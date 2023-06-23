current_vertices = vertices
.to_owned()
.inner_join(
    vertex_columns,
    col(Column::VertexId.as_ref()),
    col(Column::VertexId.as_ref()),
)
.with_common_subplan_elimination(false)
.with_streaming(true)
.collect()?;

iteration += 1; // increment the counter