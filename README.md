# alacritty

### config file

put config file in `c:\Users\{Username}\AppData\Roaming\alacritty\alacritty.toml`

which maps to wsl2 is `/mnt/c/Users/{Username}/AppData/Roaming/alacritty/alacritty.toml`

### direct start wsl

to direct start wsl by clicking the `alacritty` icon, put `shell = "ubuntu.exe"` in the config file

### switch tmux window by using `Alt-<num>`

```toml
[[keyboard.bindings]]
key = "Key1"
mods = "Alt"
command.program = "ubuntu.exe"
command.args = ["run", "tmux", "select-window", "-t", "1"]
```
