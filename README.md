# DOD hooks

Allows you to use native and detour functions

### Supported Games

* Day of Defeat: Source

### Requirements

* [SourceMod](https://www.sourcemod.net) 1.11 or later

### Installation

* Download latest [release](https://github.com/dronelektron/dod-hooks/releases)
* Extract `gamedata` and `plugins` folders to `addons/sourcemod` folder of your server

### API

Default behavior of the forwards:

* `Plugin_Continue` - Continue execution
* `Plugin_Changed` - The parameters have been changed
* `Plugin_Handled` - The same as `Plugin_Continue`
* `Plugin_Stop` - Stop execution and return my value (if available)

Called before setting the winning `team`

```sourcepawn
forward Action GameRules_OnSetWinningTeam(int& team);
```

Called when the `team` is checked that it is full

> Returns the `full` value

```sourcepawn
forward Action GameRules_OnTeamFull(int team, bool& full);
```

Called when the `newTeam` is checked that it is stacked

> Returns the `stacked` value

```sourcepawn
forward Action GameRules_OnTeamStacked(int newTeam, int currentTeam, bool& stacked);
```

Called when the `client` is trying to join the `class`

> Returns the `canJoin` value

```sourcepawn
forward Action GameRules_OnCanPlayerJoinClass(int client, int class, bool& canJoin);
```

Called before the `client` respawn

```sourcepawn
forward Action Player_OnRespawn(int client);
```

Called before the `client` joins the `team`

```sourcepawn
forward Action Player_OnJoinTeam(int client, int& team);
```

Called before the `client` joins the `class`

```sourcepawn
forward Action Player_OnJoinClass(int client, int& class);
```

Called before the `client` uses the `voiceCommand`

```sourcepawn
forward Action Player_OnVoiceCommand(int client, int& voiceCommand);
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

Force the `client` to join the `class`

```sourcepawn
native void Player_JoinClass(int client, int class);
```

Force the `client` to use the `voiceCommand`

```sourcepawn
native void Player_VoiceCommand(int client, int voiceCommand);
```
