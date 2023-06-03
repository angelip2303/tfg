impl From<Id> for u32 {
    fn from(id: Id) -> Self {
        match id {
            Id::Fid(fid) => u32::from(Id::Lid(fid.0)) + (fid.1 as u32 * 3_000_000_000),
            Id::Lid(lid) => lid.0 as u32 + 2_000_000_000,
            Id::Pid(pid) => pid.0 as u32 + 1_000_000_000,
            Id::Qid(qid) => qid.0 as u32,
            Id::Sid(sid) => {
                u32::from(Id::Lid(sid.0)) + (sid.1 as u32 * 3_000_000_000) + 500_000_000
            }
        }
    }
}