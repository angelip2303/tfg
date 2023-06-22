#[cfg(not(target_env = "msvc"))]
#[global_allocator]
static ALLOCATOR: jemallocator::Jemalloc = jemallocator::Jemalloc;

fn main() {
    // Your code goes here...
}