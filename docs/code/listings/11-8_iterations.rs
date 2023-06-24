pub fn iterations(&self) -> u8 {
    if self.contains_nary() {
        self.shapes.len() as u8 - 1
    } else {
        self.shapes.len() as u8
    }
}