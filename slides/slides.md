---
theme: apple-basic
themeConfig:
  paginationX: r
  paginationY: t
  paginationPagesDisabled: [1]
layout: intro-image
image: ./assets/img/cover.png
---

<div>
<a href="https://angelip2303.github.io" class="font-300">Ángel Iglesias Préstamo</a>
</div>

<div>
  	<h1 class="font-extrabold">PSchema</h1>
  	<p class="font-300">
      Analysis and implementation of an algorithm to validate Knowledge Graphs using Big data techniques
    </p>
</div>

<Pagination classNames="text-gray-300" />

---

# 🗂️ Table of contents

- [Introduction](#introduction)

---

# 🐿️ The project in a nutshell

```mermaid
timeline
    Research : LinkedIn
    Development : Facebook
         : Google
    Writing : Youtube
    Project defense : Twitter
```

---
layout: three-cols-content
---



# 🌉 Motivation

::content::

<p>
The city of Königsberg in Prussia (now Kaliningrad, Russia) was built on both banks of the Pregel
River and featured two sizable islands, Kneiphof and Lomse, which were linked to the two mainland
sections of the city by seven bridges. The challenge was creating a route through the city that would
cross each of those bridges just once. What Euler proved was that this problem has no solution.
</p>

::left::
<figure>
    <img src="assets/img/konigsberg_bridges.png" alt="Königsberg bridges"/>
    <figcaption> <span> Figure 1: </span> Positioning of the Königsberg bridges and the Pregel river in blue </figcaption>
</figure>

::center::
<figure>
    <img src="assets/img/konigsberg_abstract.png" alt="Abstract bridges representation"/>
    <figcaption> <span> Figure 2: </span> Abstract representation of the problem  </figcaption>
</figure>

::right::
<figure>
    <img src="assets/img/konigsberg_graph.png" alt="Graph representation"/>
    <figcaption> <span> Figure 3: </span> Abstract graph corresponding to the bridges of Königsberg  </figcaption>
</figure>

---

# 🧠 Knowledge Graphs

A **Knowledge Graph** is a graph-based knowledge representation that captures knowledge as a set of entities and relationships between them.

i.e. _The Hunger Games is a dystopian novel_

```mermaid
flowchart LR
    thg(The Hunger Games)
    thg -->|is of genre| genre(dystopian novel)
```

---

# 👨‍🏫 How do we represent Knowledge?

- _Knowledge_ is at the highest level of abstraction
- _Data_ is the lowest level of abstraction
- We want to represent _Knowledge_ using _Data_
- We need a _Knowledge Representation Language_
- We need a _Knowledge Graph_

That's were RDF comes in

---

# 📄 RDF

- **R**esource **D**escription **F**ramework
- W3C Recommendation
- Standard for knowledge representation
- Based on triples
- Uses URIs to identify resources

```turtle
# i.e. The Hunger Games is a dystopian novel
# subject predicate object .
<http://example.org/thg> <http://example.org/isOfGenre> <http://example.org/dystopianNovel> .
```
---
layout: two-cols-content
---

# 🕶️ Opaque URIs

::content::

- A URI is a unique sequence of characters that **identifies** a resource.
- They are used to identify resources in RDF, namely, **subjects**, **predicates** and **objects**.
- Designing good URIs is the **first step** in linked data development.
- There are two main types of URIs: _descriptive_ and _opaque_.

::left::

#### Descriptive URIs

```turtle
http://example.org/AlanTuring
http://example.org/España
http://example.org/足球 # Football in Chinese
```

::right::

#### Opaque URIs

```turtle
http://example.org/1
http://example.org/2
http://example.org/3
```

---
layout: center
---

# Big Data

-  📈 Volume
- 🚄 Velocity
- 🌪️ Variety

---
layout: diagram
---

<h1> 👨‍💻 Pregel<sup>1</sup> </h1>

- Graph processing framework
- Developed by Google
- Based on Bulk Synchronous Parallel model
- Uses message passing
- Distributed

<Footnotes separator>
    <Footnote :number=1>
    Pregel as implemented in <a href="https://github.com/angelip2303/pregel-rs"> pregel-rs </a>
    </Footnote>
</Footnotes>

::right::

```mermaid
stateDiagram-v2
    state iterations <<choice>>
    state "Initial Messages" as initial
    state "Send messages" as send
    state "Aggregate messages" as aggregate
    state "Vertex computation" as compute

    [*] --> initial
	initial --> iterations
    iterations --> send: if iteration <= max_iterations
	iterations --> [*]: else
	send --> aggregate
    aggregate --> compute
    compute --> iterations
```

---
layout: quote
---

## "Do not communicate by sharing memory; instead, share memory by communicating."
[Effective Go](https://go.dev/doc/effective_go#concurrency)

---
layout: diagram
---

# 🌳 Shape Expression tree

```turtle
:Person {
	:birthPlace @:Place ;
	:birthDate @:Date ;
	:employer @:Organization ;
}
:Place {
	:country @:Country
}
:Country {}
:Organization {}
:Date {}
```

::right::

```mermaid
graph TD
    Person -->|birthPlace| Place
    Person -->|birthDate| Date
    Person -->|employer| Organization
    Place -->|country| Country
```
---
layout: diagram-header
---

# 🚶 _Reverse_ Level order traversal

::left::

- **Level order traversal** visits the nodes of a tree level by level.
- **Reverse** level order traversal visits the nodes of a tree level by level, but in reverse order.


<Footnotes separator>
    <Footnote :number=1>
    <it> Reverse </it> level order traversal as implemented in <a href="https://github.com/angelip2303/pschema-rs"> pschema-rs </a>
    </Footnote>
</Footnotes>

::right::

<figure>
    <img
    class="m-auto"
    src="assets/img/traversal.svg" 
    alt="Tree traversal as implemented in PSchema"
    width="400"
/>
    <figcaption> <span> Order: </span> h, i, j, k, d, e, f, g, b, c, a  </figcaption>
</figure>

---

# 🧮 PSchema

- **P**regel-based **Schema** validation algorithm
- Validates Knowledge Graphs
- Uses Pregel to distribute the validation process

---

# 1️⃣ Running example -- Alan Turing

```mermaid
flowchart LR
    alan(Alan Turing)
    alan -->|instance of| human(Human)
    alan -->|place of birth| warrington(Warrington Lodge)
    alan -->|place of death| wilmslow(Wilmslow)
    alan -->|date of birth| 1912-06-23
    alan -->|employer| gchq(GCHQ)
    bombe(Bombe) -->|discoverer| alan
    bombe -->|instance of| computer(Computer)
    bombe -->|manufacturer| gchq(GCHQ)
    warrington -->|country| uk
    wilmslow -->|country| uk
    wilmslow -->|instance of| town(Town)
```

---

# 2️⃣ Running example -- Alan Turing

```mermaid
flowchart LR
    alan(Alan Turing)
    alan -->|instance of| human(Human)
    alan -->|place of birth| warrington(Warrington Lodge)
    alan -->|place of death| wilmslow(Wilmslow)
    alan -->|date of birth| 1912-06-23
    alan -->|employer| gchq(GCHQ)
    bombe(Bombe) -->|discoverer| alan
    bombe -->|instance of| computer(Computer)
    bombe -->|manufacturer| gchq(GCHQ)
    warrington -->|country| uk
    wilmslow -->|country| uk
    wilmslow -->|instance of| town(Town)
```

---

# 🚀 Optimizations

- **Front-coding** to reduce the size of the messages (Witten, I. H., A. Moff at, and T. C. Bell (1999). Managing Gigabytes : Compressing and Indexing Documents and Images. Morgan Kaufmann.)
- **Compressing** the messages using a compression algorithm (i.e. gzip)
- **Caching** the messages in memory to avoid sending them again
- **Using a binary format** to reduce the size of the messages