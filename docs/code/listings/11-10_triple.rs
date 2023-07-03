impl<T: Literal + Clone> Validate for TripleConstraint<T> {
    fn validate(self, prev: Expr) -> Expr {
        when(
            Column::edge(Predicate)
                .eq(lit(self.predicate))
                .and(match self.object {
                    NodeConstraint::Value(value) => Column::edge(Object).eq(lit(value)),
                    NodeConstraint::Any => lit(true),
                }),
        )
        .then(lit(self.label))
        .otherwise(prev)
    }
}