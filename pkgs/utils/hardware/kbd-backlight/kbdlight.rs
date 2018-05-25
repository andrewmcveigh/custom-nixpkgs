use std::fs::File;
use std::io::prelude::*;

fn read(filename: &str) -> Result<String, std::io::Error> {
    let mut file = File::open(filename)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents.trim().to_string())
}

fn write(mut f: File, b: &[u8]) {
    match f.write_all(b) {
        Ok(_) => (),
        _     => panic!("Couldn't write file!")
    }
}

fn main() {
    let f = "/sys/class/leds/tpacpi::kbd_backlight/brightness";
    let s = read(f).unwrap();
    let file = File::create(f).unwrap();
    match s.as_str() {
        "0" => write(file, b"1"),
        "1" => write(file, b"2"),
        "2" => write(file, b"0"),
        _       => panic!()
    }
}
