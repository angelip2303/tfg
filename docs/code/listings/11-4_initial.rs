let vertices = &self.graph.vertices.lazy();
let initial_message = &self.initial_message;

let mut current_vertices = vertices
    .to_owned()
    .select([
        all(), // we select all the columns of the graph vertices
        initial_message
            .to_owned()
            .alias(self.vertex_column.as_ref()), // column name is set by the user
    ])
    .with_common_subplan_elimination(false)
    .with_streaming(true)
    .collect()?;