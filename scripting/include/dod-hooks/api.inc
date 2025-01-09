#if defined _dod_hooks_api_included
 #endinput
#endif
#define _dod_hooks_api_included

enum {
    Voice_Attack,
    Voice_Hold,
    Voice_Left,
    Voice_Right,
    Voice_StickTogether,
    Voice_Cover,
    Voice_UseSmoke,
    Voice_UseGrens,
    Voice_CeaseFire,
    Voice_YesSir,
    Voice_Negative,
    Voice_Backup,
    Voice_FireInHole,
    Voice_Grenade,
    Voice_Sniper,
    Voice_NiceShot,
    Voice_Thanks,
    Voice_AreaClear,
    Voice_DropWeapons,
    Voice_Displace,
    Voice_MgAhead,
    Voice_EnemyBehind,
    Voice_WeGotHim,
    Voice_MoveUpMg,
    Voice_NeedAmmo,
    Voice_UseBazooka,
    Voice_BazookaSpotted,
    Voice_GoGoGo,
    Voice_Medic,
    Voice_CoverFlanks,
    Voice_Tank,
    Voice_TakeAmmo,
    Voice_MoveWithtank,
    Voice_WTF,
    Voice_FireLeft,
    Voice_FireRight,
    // "Voice_MgAhead" already exists
    Voice_EnemyAhead = 37,
    Voice_FallBack
};

#define FORCE_RESPAWN_YES true
#define FORCE_RESPAWN_NO false

forward Action GameRules_OnSetWinningTeam(int& team);

forward Action Player_OnRespawn(int client);

forward Action Player_OnJoinTeam(int client, int& team);

forward Action Player_OnJoinClass(int client, int& class);

forward Action Player_OnVoiceCommand(int client, int& voiceCommand);

native void GameRules_SetWinningTeam(int team);

native bool Player_Respawn(int client, bool forceRespawn = true);
