# walfzf 🌄

walfzf is a command-line tool for searching, previewing, and downloading wallpapers from [wallhaven.cc](https://wallhaven.cc). It uses [fzf](https://github.com/junegunn/fzf) for interactive selection, supports terminal image previews (via [kitty](https://sw.kovidgoyal.net/kitty/) or [chafa](https://hpjansson.org/chafa/)), and can download wallpapers by ID or from user collections.

## Demo

https://github.com/user-attachments/assets/bd8e222e-5f5c-4e24-99fc-60a989767e10

## Features

- Fuzzy search with fzf for quick filtering
- Terminal image previews (kitty or chafa)
- Download wallpapers by Wallhaven ID
- Browse and download from user collections
- Configurable search parameters (categories, order, resolutions, etc.)
- Optional background preloading for faster previews
- Debug mode for troubleshooting

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

Run walfzf with a command and optional arguments:

```sh
./walfzf [command] [options] [arguments]
```

### Search Commands

- **search (s) `<query>` [options]**  
  Search wallpapers with fuzzy matching.  
  Options:  
  `-p <page>`, `--page <page>` — Start from a specific page  
  `-b`, `--background-preload` — Preload images for faster previews  
  `-t`, `--thumbs` — Use low‑resolution thumbnails for preview speed  

- **latest (l) [options]**  
  Browse the most recently added wallpapers.  
  Options: same as search (`-p`, `-b`, `-t`).  

- **toplist (t) [options]**  
  Browse top‑rated wallpapers over a time range.  
  Options:  
  `-p <page>`, `--page <page>`  
  `-r <range>`, `--range <range>` — Time range: 1d, 3d, 1w, 1M, 3M, 6M, 1y (default from config)  
  `-b`, `--background-preload`  
  `-t`, `--thumbs`  

- **random (r) [options]**  
  Browse random wallpapers.  
  Options:  
  `-p <page>`, `--page <page>`  
  `-s <seed>`, `--seed <seed>` — Seed for reproducible random results  
  `-b`, `--background-preload`  
  `-t`, `--thumbs`  

### Browse Commands

- **tags [filter|sort]**  
  Browse popular tags on wallhaven.cc. Selecting a tag starts a search.  
  Sort options (pick one): `popular` (default), `viewed`, `tagged`, `subs`.  
  Pass any other argument as a text filter (e.g., `walfzf tags anime`).  

- **collection (c) `<username>` [collection_id] [options]**  
  Browse and download from a user’s public collections. If collection_id is omitted, you’ll be prompted to choose one.  
  Options:  
  `-p <page>`, `--page <page>`  
  `-a`, `--all` — Download all images from the selected collection  

### Download Command

- **download (d) `<image_id...>`**  
  Download one or more wallpapers by their Wallhaven IDs.  

### Configuration Commands

- **edit (e)**  
  Open the configuration file in your default editor.  

- **setup [folder]**  
  View or change the wallpaper save folder.  
  Examples:  
  `walfzf setup` — Show current folder  
  `walfzf setup ~/Pictures/walls` — Set folder (supports `~`)  
  `walfzf setup --folder /tmp/walls` — Same, with explicit flag  

### Help

- **help (h), --help, -h**  
  Show the help message.  

### Examples

```sh
# Search for mountain wallpapers
./walfzf search mountains

# Browse latest wallpapers, page 2
./walfzf latest -p 2

# Download specific images by ID
./walfzf download abc123 def456

# Browse user collections
./walfzf collection someuser

# Change wallpaper folder
./walfzf setup ~/Walls
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

Enjoy your new wallpapers, right from your terminal!
