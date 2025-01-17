#if defined _dod_hooks_watcher_included
 #endinput
#endif
#define _dod_hooks_watcher_included

enum {
    Index_GameRules_SetWinningTeam,
    Index_GameRules_TeamFull,
    Index_Player_Respawn,
    Index_Player_JoinTeam,
    Index_Player_JoinClass,
    Index_Player_VoiceCommand
};

#define WATCHERS_INDEX_FIRST Index_GameRules_SetWinningTeam
#define WATCHERS_INDEX_LAST Index_Player_VoiceCommand
#define WATCHERS_SIZE (WATCHERS_INDEX_LAST + 1)
