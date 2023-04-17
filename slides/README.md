## Slide 1:

### [Presentation Title]

## Slide 2:

### What is it Pregel?

- Pregel is a distributed graph processing framework developed by Google for
  large-scale graph computation.
- It is designed to handle massive graphs with billions of vertices and edges, and
  provides a simple programming model based on the Bulk Synchronous Parallel (BSP) model.

## Slide 3:

### The project in a nutshell

- Our project aims to leverage the power of Pregel for graph processing tasks in a
  distributed computing environment.
- We have developed a custom implementation of Pregel, called `pregel-rs`, in Rust
  programming language to take advantage of its performance, safety, and concurrency
  features.
- Additionally, we have also developed `pschema-rs`, a schema-based graph processing
  library in Rust, which provides a high-level abstraction for defining and manipulating
  graph schemas.

## Slide 4:

### Where do we come from?

- Our project was inspired by the need for efficient graph processing solutions in
  various domains such as social networks, recommendation systems, and scientific
  simulations.
- We recognized the limitations of existing graph processing frameworks and sought to
  develop a custom solution that addresses these challenges.

## Slide 5:

### The first trial

## Slide 6:

### What went wrong?

## Slide 7:

### ETL

- One key aspect of our project is the Extract, Transform, Load (ETL) process.
- We developed a custom ETL pipeline named `wd2duckdb` to efficiently process
  large-scale graph data.
- Our ETL process involves extracting graph data from Wikidata JSON dumps, transforming
  it into a Wikidata entities, and loading them into a DuckDB database for distributed
  graph processing.

## Slide 8:

### `pregel-rs`

- Our initial trial involved implementing Pregel in Rust to leverage its performance,
  safety, and concurrency features.
- We experimented with various graph processing tasks such as graph traversal,
  community detection, and PageRank using `pregel-rs`.
- The results were promising, with significant improvements in processing speed and
  resource utilization compared to other existing graph processing frameworks.
- `pregel-rs` provides a simple programming model based on the BSP model, allowing
  developers to express graph algorithms in a familiar and intuitive way.

## Slide 9:

### `pschema-rs`

- `pschema-rs` is our schema-based graph processing library in Rust.
- It provides a high-level abstraction for defining and manipulating entity schemas
  contained in graphs, allowing users to specify the structure and properties of the
  subsets to be generated.
- It seamlessly integrates with `pregel-rs` to enable efficient processing of graph
  data based on the defined schemas.

## Slide 10:

### What can it be used for?

- Our project has potential applications in various domains such as social networks,
  recommendation systems, fraud detection, scientific simulations, and more.
- It can be used to efficiently process large-scale graph data, uncover patterns and
  insights,
