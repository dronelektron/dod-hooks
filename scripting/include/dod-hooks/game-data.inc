#if defined _dod_hooks_game_data_included
 #endinput
#endif
#define _dod_hooks_game_data_included

#define GAME_CONFIG "dod-hooks.games"

#define GAME_RULES_SET_WINNING_TEAM "CDODGameRules::SetWinningTeam"
#define GAME_RULES_TEAM_FULL "CDODGameRules::TeamFull"

#define PLAYER_RESPAWN "CDODPlayer::DODRespawn"
#define PLAYER_JOIN_TEAM "CDODPlayer::HandleCommand_JoinTeam"
#define PLAYER_JOIN_CLASS "CDODPlayer::HandleCommand_JoinClass"
#define PLAYER_VOICE_COMMAND "CDODPlayer::VoiceCommand"
