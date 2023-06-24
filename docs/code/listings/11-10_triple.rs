fn validate(self, prev: Expr) -> Expr {
    when(
        Column::edge(Object)
            .eq(lit(self.object))
            .and(Column::edge(Predicate).eq(lit(self.predicate))),
    )
    .then(lit(self.label))
    .otherwise(prev)
}