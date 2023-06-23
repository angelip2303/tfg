PregelBuilder::new(GraphFrame::new(vertices, edges)?)
        .max_iterations(4)
        .with_vertex_column(Custom("rank"))
        .initial_message(lit(1.0 / num_vertices))
        .send_messages(
            MessageReceiver::Subject,
            Column::subject(Custom("rank")) / Column::subject(Custom("out_degree")),
        )
        .send_messages(
            MessageReceiver::Object,
            Column::subject(Custom("rank")) / Column::subject(Custom("out_degree")),
        )
        .aggregate_messages(Column::msg(None).sum())
        .v_prog(
            Column::msg(None) * lit(factor) + lit((1.0 - factor) / num_vertices),
        )
        .build();