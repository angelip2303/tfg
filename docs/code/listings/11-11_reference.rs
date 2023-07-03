impl<T: Literal + Clone> Validate for ShapeReference<T> {
    fn validate(self, prev: Expr) -> Expr {
        when(
            Column::object(Custom("labels"))
                .list()
                .contains(lit(self.reference.get_label()))
                .and(Column::edge(Predicate).eq(lit(self.predicate))),
        )
        .then(lit(self.label))
        .otherwise(prev)
    }
}