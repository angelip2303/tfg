fn contains_nary(&self) -> bool {
    for shapes in self.shapes.iter() {
        for shape in shapes.iter() {
            match shape {
                Shape::TripleConstraint(_) => continue,
                Shape::ShapeReference(_) => continue,
                Shape::ShapeAnd(_) => return true,
                Shape::ShapeOr(_) => return true,
                Shape::Cardinality(_) => return true,
            };
        }
    }

    false
}