pub struct GraphFrame {
    pub vertices: DataFrame,
    pub edges: DataFrame,
}

pub fn from_edges(edges: DataFrame) -> Result<Self> {
    let subjects = edges
        .clone() // this is because cloning a DataFrame is a cheap operation
        .lazy()
        .select([col(Subject.as_ref()).alias(VertexId.as_ref())]);
    let objects = edges
        .clone() // this is because cloning a DataFrame is a cheap operation
        .lazy()
        .select([col(Object.as_ref()).alias(VertexId.as_ref())]);
    let vertices = concat([subjects, objects], true, true)?
        .unique(
            Some(vec![VertexId.as_ref().to_string()]),
            UniqueKeepStrategy::First,
        )
        .collect()?;

    GraphFrame::new(vertices, edges)
}