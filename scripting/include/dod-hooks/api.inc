#if defined _dod_hooks_api_included
 #endinput
#endif
#define _dod_hooks_api_included

#define FORCE_RESPAWN_YES true
#define FORCE_RESPAWN_NO false

forward Action GameRules_OnSetWinningTeam(int& team);

forward Action Player_OnRespawn(int client);

forward Action Player_OnJoinTeam(int client, int& team);

forward Action Player_OnJoinClass(int client, int& class);

native void GameRules_SetWinningTeam(int team);

native bool Player_Respawn(int client, bool forceRespawn = true);
