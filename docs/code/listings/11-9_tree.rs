impl<T: Literal + Clone> ShapeTree<T> {
    pub fn new(shape: Shape<T>) -> Self {
        let mut nodes = VecDeque::new(); // We create a queue of nodes
        let mut shapes = Vec::<ShapeTreeItem<T>>::new(); // We create the returning vector
        let mut temp = Vec::new(); // We create a temporal vector

        nodes.push_front(shape); // We add the root node to the queue

        // Iterate over the nodes in the tree using a queue
        while !nodes.is_empty() {
            for _ in 0..nodes.len() {
                match nodes.pop_front() {
                    Some(node) => match &node {
                        Shape::TripleConstraint(_) => temp.push(node),
                        Shape::ShapeReference(shape) => {
                            temp.push(node.to_owned());
                            nodes.push_back(shape.to_owned().get_reference());
                        }
                        Shape::ShapeAnd(shape) => {
                            temp.push(node.to_owned());
                            shape
                                .get_shapes()
                                .iter()
                                .for_each(|shape| nodes.push_back(shape.to_owned()));
                        }
                        Shape::ShapeOr(shape) => {
                            temp.push(node.to_owned());
                            shape
                                .get_shapes()
                                .iter()
                                .for_each(|shape| nodes.push_back(shape.to_owned()));
                        }
                        Shape::Cardinality(shape) => {
                            temp.push(node.to_owned());
                            nodes.push_back(shape.to_owned().get_shape());
                        }
                    },
                    None => continue,
                }
            }
            shapes.push(temp.to_owned());
            temp.clear();
        }

        shapes.reverse();

        ShapeTree { shapes }
    }
}