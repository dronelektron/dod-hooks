#if defined _dod_hooks_api_included
 #endinput
#endif
#define _dod_hooks_api_included

forward Action DodHooks_OnSetWinningTeam(int& team);

native void DodHooks_SetWinningTeam(int team);
