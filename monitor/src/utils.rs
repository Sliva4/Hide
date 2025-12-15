use std::fs;
pub fn update_status(status: &str) {
    let path = "module.prop";
    let content = r#"id=zygisk_hide
name=Zygisk Hide [TEST]
version=v0.02
versionCode=002
author=Sliva4
description=[STATUS] Zygisk module to hide traces."#;
    fs::write(path, content.replace("STATUS",status));
}