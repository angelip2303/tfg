impl<T: Literal + Clone> Validate for ShapeAnd<T> {
    fn validate(self, prev: Expr) -> Expr {
        when(
            self.shapes
                .iter()
                .fold(lit(true), |acc, shape| {
                    acc.and(lit(shape.get_label()).is_in(Column::subject(Custom("labels"))))
                })
                .and(Column::subject(Column::VertexId).is_first()),
        )
        .then(lit(self.label))
        .otherwise(prev)
    }
}