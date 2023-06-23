let v_prog = &mut self.v_prog;
let vertex_columns = current_vertices_df
    .to_owned()
    .outer_join(
        message_df,
        col(Column::VertexId.as_ref()), // id column of the current_vertices DataFrame
        Column::msg(Some(Column::VertexId)), // msg.id column of the message_df DataFrame
    )
    .select(&[
        col(Column::VertexId.as_ref()),
        v_prog().alias(self.vertex_column.as_ref()),
    ]);