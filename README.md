# DOD Hooks

Allows you to use natives and detours functions

### Supported Games

* Day of Defeat: Source

### Requirements

* [SourceMod](https://www.sourcemod.net) 1.11 or later

### Installation

* Download latest [release](https://github.com/dronelektron/dod-hooks/releases)
* Extract `gamedata` and `plugins` folders to `addons/sourcemod` folder of your server

### API

Called when setting the winning `team`

Use `Plugin_Continue` for normal execution and `Plugin_Stop` to stop execution

```sourcepawn
forward Action DodHooks_OnSetWinningTeam(int team);
```
