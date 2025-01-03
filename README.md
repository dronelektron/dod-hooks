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

Default behavior of the forwards:

* `Plugin_Continue` - Continue the execution
* `Plugin_Changed` - The parameters have been changed
* `Plugin_Handled` - The same as `Plugin_Continue`
* `Plugin_Stop` - Stop the execution

Called before setting the winning `team`

```sourcepawn
forward Action DodHooks_OnSetWinningTeam(int& team);
```
