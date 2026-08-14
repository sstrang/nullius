# Nullius (Factorio 2.1 test build)

Fork of [Nullius](https://mods.factorio.com/mod/nullius) by Anachrony, ported
to run on **Factorio 2.1**.

The official mod portal release still targets Factorio 2.0. Until the author
publishes a 2.1 build, this repo is where the 2.1-compatible version lives.

**Status: test build.** It loads, creates maps, and plays, but it has not
been through a full playthrough. Expect the occasional bug. If you hit one,
see [Reporting bugs](#reporting-bugs) below.

## Requirements

- Factorio **2.1** (experimental branch)
- The same hard dependencies as the official mod:
  - `alien-biomes`
  - `angelsrefininggraphics`, `angelssmeltinggraphics`, `angelspetrochemgraphics`
  - `boblogistics`
  - `configurable-valves`
- All the optional dependencies from the official mod work too, but aren't
  required.

## Installation

**Important:** the mod does not live at the root of this repository. It's in
the `nullius/` subdirectory (the repo also bundles the `safefill/` and
`train-upgrader/` mods). You cannot just drop the whole repo into your mods
folder — Factorio looks for `info.json` at the top level and will silently
ignore it. The final folder must be named `nullius_2.1.0` (that's the
`name_version` format Factorio expects).

### No command line? Point-and-click method

1. Go to <https://github.com/sstrang/nullius> and click the green
   **Code** button, then **Download ZIP**.
2. Extract the zip (Windows: right-click → *Extract All*; macOS: double-click).
3. Open the extracted folder. You'll see several subfolders — the one you
   want is **`nullius`** (ignore `safefill/` and `train-upgrader/`).
4. Copy the `nullius` folder into your Factorio **mods** folder:
   - Windows: press <kbd>Win</kbd>+<kbd>R</kbd>, type `%APPDATA%\Factorio\mods`, Enter
   - macOS: in Finder press <kbd>Cmd</kbd>+<kbd>Shift</kbd>+<kbd>G</kbd> and
     paste `~/Library/Application Support/factorio/mods`
   - Linux: `~/.factorio/mods`
5. Rename the copied folder from `nullius` to **`nullius_2.1.0`**.
6. Start Factorio, go to **Mods** in the main menu, and tick the Nullius
   checkbox to enable it (the game will also list any missing dependency
   mods — install those from the mod portal and it'll work).

To update later: repeat steps 1–5, replacing the old `nullius_2.1.0` folder.

### Terminal method (macOS/Linux)

```bash
cd ~/Library/Application\ Support/factorio/mods   # Linux: ~/.factorio/mods
git clone https://github.com/sstrang/nullius.git nullius-src
ln -s nullius-src/nullius nullius_2.1.0
```

To update later:

```bash
cd nullius-src && git pull
```

### Terminal method (Windows)

```bash
cd %APPDATA%\Factorio\mods
git clone https://github.com/sstrang/nullius.git
xcopy /E /I nullius\nullius nullius_2.1.0
```

## Reporting bugs

Paste the error text into a GitHub issue on this repo. Most failures also
appear at the end of the Factorio log:

- Windows: `%APPDATA%\Factorio\factorio-current.log`
- macOS: `~/Library/Application Support/factorio/factorio-current.log`
- Linux: `~/.factorio/factorio-current.log`

The last ~20 lines usually contain the full error plus a stack trace. If a
load error lists `Modifications:` at the end, that's just every mod that
touched prototypes — it is *not* the culprit list, so include it but don't
assume the last mod listed is the problem.

## Credits

All design and content belongs to Anachrony and the Nullius contributors.
This repo only adapts the code for Factorio 2.1:

https://github.com/GregorSamsanite/nullius
