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
`train-upgrader/` mods). You cannot just clone the repo into your mods folder
— Factorio looks for `info.json` at the top level and will silently ignore a
bare clone.

Do this instead (macOS/Linux; adjust the mods path for your platform):

```bash
cd ~/Library/Application\ Support/factorio/mods   # Windows: %APPDATA%\Factorio\mods
git clone https://github.com/sstrang/nullius.git nullius-src
ln -s nullius-src/nullius nullius_2.1.0
```

The symlink is named `nullius_2.1.0` to match the `name_version` folder
format Factorio expects. To update later:

```bash
cd nullius-src && git pull
```

Windows note: if you can't create symlinks, copy the `nullius/` folder out of
the clone instead:

```bash
git clone https://github.com/sstrang/nullius.git
xcopy /E /I nullius\nullius nullius_2.1.0
```

Then put `nullius_2.1.0` in your mods folder and enable the mod in-game.

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
