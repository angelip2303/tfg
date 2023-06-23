let send_messages = &mut send_messages;
let aggregate_messages = &mut self.aggregate_messages;

let message_df = triplets_df
    .select(send_messages)
    .groupby([Column::msg(Some(Column::VertexId))])
    .agg([aggregate_messages().alias(Column::Pregel.as_ref())]);