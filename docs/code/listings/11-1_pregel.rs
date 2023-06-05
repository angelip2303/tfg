pub fn run(mut self) -> PolarsResult<DataFrame> {
        // We create a DataFrame that contains the edges of the graph. This DataFrame is used to
        // compute the triplets of the graph, which are used to send messages to the neighboring
        // vertices of each vertex in the graph. For us to do so, we select all the columns of the
        // graph edges and we prefix them with the `Edge` column name.
        let edges = &self
            .graph
            .edges
            .lazy()
            .select([all().prefix(&format!("{}.", Column::Edge.as_ref()))]);
        // We create a DataFrame that contains the vertices of the graph
        let vertices = &self.graph.vertices.lazy();
        // We start the execution of the algorithm from the super-step 0; that is, all the nodes
        // are set to active, and the initial messages are sent to each vertex in the graph. What's more,
        // The initial messages are stored in the `initial_message` column of the `current_vertices` DataFrame.
        // We use the `lazy` method to create a lazy DataFrame. This is done to avoid the execution of
        // the DataFrame until the end of the algorithm.
        let initial_message = &self.initial_message;
        let mut current_vertices = vertices
            .to_owned()
            .select([
                all(), // we select all the columns of the graph vertices
                initial_message
                    .to_owned()
                    .alias(self.vertex_column.as_ref()), // initial message column name is set by the user
            ])
            .with_common_subplan_elimination(false)
            .with_streaming(true)
            .collect()?;
        // After computing the super-step 0, we start the execution of the Pregel algorithm. This
        // execution is performed until all the nodes vote to halt, or the number of iterations is
        // greater than the maximum number of iterations set by the user at the initialization of
        // the model (see the `Pregel::new` method). We start by setting the number of iterations to 1.
        let mut iteration = 1;
        while iteration <= self.max_iterations {
            // TODO: check that nodes are not halted.
            // We create a DataFrame that contains the triplets of the graph. Those triplets are
            // computed by joining the `current_vertices` DataFrame with the `edges` DataFrame
            // first, and with the `current_vertices` second. The first join is performed on the `src`
            // column of the `edges` DataFrame and the `id` column of the `current_vertices` DataFrame.
            // The second join is performed on the `dst` column of the resulting DataFrame from the previous
            // join and the `id` column of the `current_vertices` DataFrame.
            let current_vertices_df = &current_vertices.lazy();
            let triplets_df = current_vertices_df
                .to_owned()
                .select([all().prefix(&format!("{}.", Column::Src.as_ref()))])
                .inner_join(
                    edges.to_owned().select([all()]),
                    Column::src(Column::Id), // src column of the current_vertices DataFrame
                    Column::edge(Column::Src), // src column of the edges DataFrame
                )
                .inner_join(
                    current_vertices_df
                        .to_owned()
                        .select([all().prefix(&format!("{}.", Column::Dst.as_ref()))]),
                    Column::edge(Column::Dst), // dst column of the resulting DataFrame
                    Column::dst(Column::Id),   // id column of the current_vertices DataFrame
                );
            // We create a DataFrame that contains the messages sent by the vertices. The messages
            // are computed by performing an aggregation on the `triplets_df` DataFrame. The aggregation
            // is performed on the `msg` column of the `triplets_df` DataFrame, and the aggregation
            // function is the one set by the user at the initialization of the model.
            // We create a tuple where we store the column names of the `send_messages` DataFrame. We use
            // the `alias` method to ensure that the column names are properly qualified. We also
            // do the same for the `aggregate_messages` Expr. And the same with the `v_prog` Expr.
            let (mut send_messages_ids, mut send_messages_msg): (Vec<Expr>, Vec<Expr>) = self
                .send_messages
                .iter_mut()
                .map(|send_message| {
                    let message_direction = &send_message.message_direction;
                    let send_message_expr = &mut send_message.send_message;
                    (
                        message_direction
                            .to_owned()
                            .alias(&Column::alias(&Column::Msg, Column::Id)),
                        send_message_expr().alias(Column::Pregel.as_ref()),
                    )
                })
                .unzip();
            let send_messages = &mut send_messages_ids; // we create a mutable reference to the `send_messages_ids` Vector
            let send_messages_msg_df = &mut send_messages_msg; // we create a mutable reference to the `send_messages_msg` Vector
            send_messages.append(send_messages_msg_df); // we append the `send_messages_msg` Vector to the `send_messages` Vector
            let aggregate_messages = &mut self.aggregate_messages;
            let message_df = triplets_df
                .select(send_messages)
                .groupby([Column::msg(Some(Column::Id))])
                .agg([aggregate_messages().alias(Column::Pregel.as_ref())]);
            // We Compute the new values for the vertices. Note that we have to check for possibly
            // null values after performing the outer join. This is, columns where the join key does
            // not exist in the source DataFrame. In case we find any; for example, given a certain
            // node having no incoming edges, we have to replace the null value by 0 for the aggregation
            // to work properly.
            let v_prog = &mut self.v_prog;
            let vertex_columns = current_vertices_df
                .to_owned()
                .outer_join(
                    message_df,
                    col(Column::Id.as_ref()), // id column of the current_vertices DataFrame
                    Column::msg(Some(Column::Id)), // msg.id column of the message_df DataFrame
                )
                .with_column(Column::msg(None).fill_null(self.replace_nulls.to_owned()))
                .select(&[
                    col(Column::Id.as_ref()),
                    v_prog().alias(self.vertex_column.as_ref()),
                ]);
            // We update the `current_vertices` DataFrame with the new values for the vertices. We
            // do so by performing an inner join between the `current_vertices` DataFrame and the
            // `vertex_columns` DataFrame. The join is performed on the `id` column of the
            // `current_vertices` DataFrame and the `id` column of the `vertex_columns` DataFrame.
            current_vertices = vertices
                .to_owned()
                .inner_join(
                    vertex_columns,
                    col(Column::Id.as_ref()),
                    col(Column::Id.as_ref()),
                )
                .with_common_subplan_elimination(false)
                .with_streaming(true)
                .collect()?;

            iteration += 1; // increment the counter so we now which iteration is being executed
        }

        Ok(current_vertices)
    }