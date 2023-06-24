fn validate(self, prev: Expr) -> Expr {
    when(self.shapes.iter().fold(lit(true), |acc, shape| {
        acc.and(lit(shape.get_label()).is_in(Column::msg(None)))
    }))
    .then(match concat_list([lit(self.label), prev.to_owned()]) {
        Ok(concat) => concat,
        Err(_) => prev.to_owned(),
    })
    .otherwise(prev)
}