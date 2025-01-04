#if defined _dod_hooks_watcher_included
 #endinput
#endif
#define _dod_hooks_watcher_included

enum {
    Index_GameRules_SetWinningTeam,
    Index_Player_Respawn
};

#define WATCHERS_INDEX_FIRST Index_GameRules_SetWinningTeam
#define WATCHERS_INDEX_LAST Index_Player_Respawn
#define WATCHERS_SIZE (WATCHERS_INDEX_LAST + 1)
