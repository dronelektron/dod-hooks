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
forward Action GameRules_OnSetWinningTeam(int& team);
```

Called before the `client` respawn

```sourcepawn
forward Action Player_OnRespawn(int client);
```

Set the winning `team`

```sourcepawn
native void GameRules_SetWinningTeam(int team);
```

Respawn the dead `client` or alive if `forceRespawn` is set to `true`

> Returns `true` on success and `false` otherwise

```sourcepawn
native bool Player_Respawn(int client, bool forceRespawn = true);
```
