let batches: Vec<RecordBatch> = statement.query_arrow([]).unwrap();

batches
    .into_par_iter()
    .map(|batch| {
        // Processing goes here...
    });