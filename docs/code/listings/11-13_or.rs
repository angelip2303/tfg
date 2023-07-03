impl<T: Literal + Clone> Validate for ShapeOr<T> {
    fn validate(self, prev: Expr) -> Expr {
        when(
            self.shapes
                .iter()
                .fold(lit(false), |acc, shape| {
                    acc.or(lit(shape.get_label()).is_in(Column::subject(Custom("labels"))))
                })
                .and(Column::subject(Column::VertexId).is_first()),
        )
        .then(lit(self.label))
        .otherwise(prev)
    }
}