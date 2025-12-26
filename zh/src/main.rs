use std::env;
mod utils;
mod vars;
mod config;
enum Argument {
    None,
    Status,
    Config,
    ConfigGet
}
fn info() -> String {
    let value: String = "[KERNEL]\nVersion: ".to_owned()+&utils::get_kernel_version()+"[VERSION]\nzh: "+vars::ZH_VERSION+"\nModule: "+vars::MODULE_VERSION+"\n[CONFIG]\n"+&config::get_config_txt();
    return value;
}
fn main() {
    let args: Vec<String> = env::args().collect();
    let mut arg_type: Argument = Argument::None;
    for arg in &args[1..] {
        match arg_type {
            Argument::None => (),
            Argument::Status => {
                utils::update_status(arg);
                continue;
            },
            Argument::Config => {
                if arg == "get" {
                    arg_type = Argument::ConfigGet;
                    continue;
                } else if arg == "create" {
                    config::create_config();
                    continue;
                } else {
                    println!("Unknown command.");
                    continue;
                }
            },
            Argument::ConfigGet => {
                config::get_config_cli(arg);
                continue;
            }
        }
        if arg == "status" {
            arg_type = Argument::Status;
            continue;
        } else if arg == "info" {
            println!("{}", info());
        } else if arg == "boot-completed" {
            utils::update_status(emojis::get("✅").unwrap().as_str())
        } else if arg == "config" {
            arg_type = Argument::Config;
            continue;
        } else {
            println!("Unknown command.")
        }
    }
}
