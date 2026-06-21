# Bloons TD 6 with AutoHotkey v2

An AutoHotkey v2 script for Bloons TD 6 mainly to help during collection events. Plays through maps
from map category chosen by the user (expert by default) on easy, standard difficulty. The script
can be set to choose a random map, a map with a collection event bonus active, or a single map
specified by the user.

> **Warning**  
> Read the [Ninja Kiwi Terms of Service](https://ninjakiwi.com/terms) before using this script
> **_at your own risk!_**
>
> The script **should** be safe to use in **private games** but there is always the chance of being
> flagged for cheating (indicated by leaves on the settings button).

This is a fork from [Valokoodari/btd6-ahk](https://github.com/Valokoodari/btd6-ahk). The main goals include:

- map strategies/solutions that work without Double Cash or Fast Track
- maintain script functionality
  - after NK updates
  - during collection events

Other versions, including strategies around Double Cash and/or Fast Track, may be found on the Valokoodari Discord:

[![](https://dcbadge.vercel.app/api/server/nzJgMjt)](https://discord.gg/nzJgMjt)

**[Mode Support](/docs/mode_support.md)** contains map and mode availability.

## Requirements:

- Game running **fullscreen** on a **1920x1080** display
- **Normal or small cursor** selected
- Game language set to **English**
- **Default game hotkeys**
- **Dark Castle** unlocked
- [AutoHotkey v2.0](https://www.autohotkey.com/)

> **Note**  
> You can change the display resolution to 1920x1080 in **_Windows settings_** if you have a higher
> resolution display. Setting the resolution in the game settings is not enough altough that must
> also be set correctly.

> **Note**  
> Only easy, standard difficulty has been fully tested without any Monkey Knowledge. Other
> modes may require full MK.

## Usage

For optimal results set `mapSelect` in `config.ini` according to the current event (`none`,
`birthday`, `easter`, `fireworks`, `halloween`, `holiday`, `totem`). You may also set `mapSelect`
to the name of a single map in `snake_case` with special characters like `'` and `#` removed. The
default method chooses a random expert map.

After opening BTD6, run the `main.ahk` script on the home menu, stage selection menu, or collection menu with <kbd>Ctrl</kbd> +
<kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>J</kbd>.

The script can be stopped (and reloaded) with <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Shift</kbd> +
<kbd>P</kbd>.

## Credits

This project is based on [btd6-ahk](https://github.com/Valokoodari/btd6-ahk) by [Valokoodari](https://github.com/Valokoodari).  
Additional credit goes to various members of the Valokoodari Discord who have contributed.

# MasterRuma Fork Additions

This fork includes the following committed additions and workflow changes:

- Team Event automation, a coordinate-copy hotkey, and Discord webhook logging support.
- Beginner page 1 Hard Standard clear scripts, excluding Monkey Meadow.
- BTD6 v55 Ancient Portal updates, including Churchill-based monkey XP farming.
- Ancient Portal training flow changed from Easy setup toward Deflation-based XP farming.
- Ancient Portal Primary, Hard, Alternate, and Impoppable strategies.
- Ancient Portal Impoppable loop for tower unlock progression.
- Training Monkey workflow updates for repeated tower XP farming.
