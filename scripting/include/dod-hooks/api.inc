#if defined _dod_hooks_api_included
 #endinput
#endif
#define _dod_hooks_api_included

forward Action GameRules_OnSetWinningTeam(int& team);

native void GameRules_SetWinningTeam(int team);
