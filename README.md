# walfzf: Your Terminal Wallpaper Buddy 🌄

Welcome to **walfzf** — a snappy, interactive Bash tool that lets you search, preview, and download gorgeous wallpapers from [wallhaven.cc](https://wallhaven.cc) right from your terminal. With fuzzy search, in-terminal previews, and a dead-simple config, finding your next wallpaper is actually fun. No more endless browser tabs or cluttered downloads — just type, search, and enjoy!

---

## Demo


https://github.com/user-attachments/assets/bd8e222e-5f5c-4e24-99fc-60a989767e10



## Why you'll love it

- 🔍 **Fuzzy search**: Find wallpapers lightning-fast with [fzf](https://github.com/junegunn/fzf).
- 🖼️ **Instant previews**: See wallpapers in your terminal (works with [kitty](https://sw.kovidgoyal.net/kitty/) or [chafa](https://hpjansson.org/chafa/)).
- 📥 **One-command downloads**: Grab wallpapers by Wallhaven ID or from collections.
- 📚 **Browse user collections**: Explore and download from any public Wallhaven collection.
- ⚙️ **Easy config**: Tweak settings in a simple file (`~/.config/wallhaven-cli/config.sh`).
- 💡 **Minimal fuss**: Just Bash, curl, jq, fzf, file, and an image previewer.
- 🛠️ **Debug mode**: For those "what's going on?" moments.

---

## Getting Started

Ready to dive in? Here’s how:

1. **Grab the code:**
   ```sh
   git clone https://github.com/yourusername/walfzf.git
   cd walfzf
   ```
2. **Make it executable:**
   ```sh
   chmod +x walfzf
   ```
3. **(Optional) Add it to your PATH:**
   ```sh
   ln -s "$PWD/walfzf" ~/bin/walfzf  # Or copy to any folder in your PATH
   ```

That’s it! You’re good to go.

---

## What you'll need

- bash (>= 4.x)
- curl
- jq
- fzf
- file
- [kitty](https://sw.kovidgoyal.net/kitty/) (for image previews — optional, but awesome)
- [chafa](https://hpjansson.org/chafa/) (fallback for previews)

On Ubuntu/Debian, you can install everything in one go:
```sh
sudo apt install bash curl jq fzf file chafa
```

---

## How to use it

Fire it up with:
```sh
./walfzf [command] [options] [arguments]
```

### What can you do?

- `search (s) <query> [options]`  
  Search for wallpapers with fuzzy matching. 
  - `-p <page>`, `--page <page>`: Start from a specific page
  - `-b`, `--background-preload`: Preload images for even snappier previews

- `download (d) <image_id...>`  
  Download wallpapers by their Wallhaven IDs. Fast and simple.

- `collection (c) <username> [collection_id] [options]`  
  Browse and download from anyone’s public collections.
  - `-p <page>`, `--page <page>`: Start from a specific page
  - `-a`, `--all`: Download every image in a collection

- `edit (e)`  
  Open your config file in your favorite editor.

- `help (h), --help, -h`  
  Show this help message.

### Example: Search and Download
```sh
./walfzf search mountains
# Use fzf to pick, preview, and grab wallpapers interactively
```

### Example: Download by ID
```sh
./walfzf download abc123 def456
```

---

## Make it yours (Configuration)

The first time you run walfzf, it’ll set up a config file at `~/.config/wallhaven-cli/config.sh`. You can edit this file directly, or just type:
```sh
./walfzf edit
```

You can tweak things like:
- Your default editor
- Where wallpapers are saved
- Which categories to search (general, anime, people)
- Search order, top range, resolutions, ratios
- Whether to preload images for faster previews

Set it up once, and you’re set for good.

---

## Troubleshooting & Debugging

If something’s not working or you’re just curious what’s happening under the hood, turn on debug mode:
```sh
WALLHAVEN_CLI_DEBUG=1 ./walfzf search nature
```
You’ll get extra info in your terminal to help figure things out.


## Big thanks
- [wallhaven.cc](https://wallhaven.cc) for the amazing wallpapers
- [fzf](https://github.com/junegunn/fzf) for fuzzy searching magic
- [kitty](https://sw.kovidgoyal.net/kitty/) and [chafa](https://hpjansson.org/chafa/) for making terminal previews possible

---

Enjoy your new wallpapers, right from your terminal! 🎉
