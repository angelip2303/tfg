impl<T: Literal + Clone> Validate for Cardinality<T> {
    fn validate(self, prev: Expr) -> Expr {
        let count = Column::subject(Column::Custom("labels"))
            .list()
            .eval(col("").eq(lit(self.shape.get_label())), true)
            .list()
            .sum();

        when(
            match self.min {
                Bound::Inclusive(min) => count.to_owned().gt_eq(lit(min)),
                Bound::Exclusive(min) => count.to_owned().gt(lit(min)),
                Bound::Zero => count.to_owned().gt_eq(lit(0u8)),
                Bound::Many => count.to_owned().gt_eq(lit(u8::MAX)),
            }
            .and(match self.max {
                Bound::Inclusive(max) => count.lt_eq(lit(max)),
                Bound::Exclusive(max) => count.lt(lit(max)),
                Bound::Zero => count.lt_eq(lit(0u8)),
                Bound::Many => count.lt_eq(lit(u8::MAX)),
            })
            .and(Column::subject(Column::VertexId).is_first()),
        )
        .then(lit(self.label))
        .otherwise(prev)
    }
}