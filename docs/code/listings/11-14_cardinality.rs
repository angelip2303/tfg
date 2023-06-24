fn validate(self, prev: Expr) -> Expr {
    let count = Column::msg(None)
        .list()
        .eval(col("").eq(lit(self.shape.get_label())).cumsum(false), true)
        .list()
        .first();

    when(
        match self.min {
            Bound::Inclusive(min) => count.to_owned().gt_eq(lit(min)),
            Bound::Exclusive(min) => count.to_owned().gt(lit(min)),
        }
        .and(match self.max {
            Bound::Inclusive(max) => count.lt_eq(lit(max)),
            Bound::Exclusive(max) => count.lt(lit(max)),
        }),
    )
    .then(
        match concat_list([lit(self.get_shape().get_label()), prev.to_owned()]) {
            Ok(concat) => concat,
            Err(_) => prev.to_owned(),
        },
    )
    .otherwise(prev)
}