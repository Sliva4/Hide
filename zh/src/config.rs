use std::fs::File;
use std::fs;
use std::io::Write;
use std::path::Path;
use serde::Deserialize;
use crate::vars::ZH_CONFIG_PATH;
#[derive(Deserialize)]
struct Config {
   mode: String
}
fn config_exists() -> bool {
    return Path::new(ZH_CONFIG_PATH).exists();
}
pub fn create_config() {
    if !config_exists() {
        println!("Creating {}",ZH_CONFIG_PATH);
        let file = File::create(ZH_CONFIG_PATH);
        let _ = file.expect("should write to file").write_all(r#"mode = '1'"#.as_bytes());
    }
}
pub fn get_config_txt() -> String {
    if !config_exists() {
        return format!("{} not found.",ZH_CONFIG_PATH);
    }
    let contents = fs::read_to_string(ZH_CONFIG_PATH).expect("open config");
    return contents;
}
pub fn get_config(option: &str) -> String {
    if !config_exists() {
        create_config();
    }
    let contents = fs::read_to_string(ZH_CONFIG_PATH).expect("open config");
    let config: Config = toml::from_str(&contents).unwrap();
    if option == "mode" {
        return config.mode;
    } else {
        return "".to_string();
    }
}
pub fn get_config_cli(option: &str) {
    let result = get_config(option);
    if result == "" {
        println!("Unknown option.");
    } else {
        println!("{}: {}",option,result);
    }
}