use std::env;
mod utils;
enum Argument {
    Status
}
fn main() {
    let args: Vec<String> = env::args().collect();
    let mut arg_type: Argument;;
    for arg in &args[1..] {
        match arg_type {
            Argument::Status => utils::update_status(arg)
        }
        if arg == "status" {
            arg_type = Argument::Status;
            continue;
        }
    }
}
