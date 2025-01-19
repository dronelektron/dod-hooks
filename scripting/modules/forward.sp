static GlobalForward g_onSetWinningTeam;
static GlobalForward g_onTeamFull;
static GlobalForward g_onTeamStacked;
static GlobalForward g_onCanPlayerJoinClass;
static GlobalForward g_onRespawn;
static GlobalForward g_onJoinTeam;
static GlobalForward g_onJoinClass;
static GlobalForward g_onVoiceCommand;

void Forward_Create() {
    GameRules_OnSetWinningTeam_Create();
    GameRules_OnTeamFull_Create();
    GameRules_OnTeamStacked_Create();
    GameRules_OnCanPlayerJoinClass_Create();
    Player_OnRespawn_Create();
    Player_OnJoinTeam_Create();
    Player_OnJoinClass_Create();
    Player_OnVoiceCommand_Create();
}

static void GameRules_OnSetWinningTeam_Create() {
    g_onSetWinningTeam = new GlobalForward("GameRules_OnSetWinningTeam", ET_Hook, Param_CellByRef);

    Watcher_SetForward(Index_GameRules_SetWinningTeam, g_onSetWinningTeam);
}

Action Forward_GameRules_OnSetWinningTeam(int& team) {
    Action result = Plugin_Continue;

    Call_StartForward(g_onSetWinningTeam);
    Call_PushCellRef(team);
    Call_Finish(result);

    return result;
}

static void GameRules_OnTeamFull_Create() {
    g_onTeamFull = new GlobalForward("GameRules_OnTeamFull", ET_Hook, Param_Cell, Param_CellByRef);

    Watcher_SetForward(Index_GameRules_TeamFull, g_onTeamFull);
}

Action Forward_GameRules_OnTeamFull(int team, bool& full) {
    Action result = Plugin_Continue;

    Call_StartForward(g_onTeamFull);
    Call_PushCell(team);
    Call_PushCellRef(full);
    Call_Finish(result);

    return result;
}

static void GameRules_OnTeamStacked_Create() {
    g_onTeamStacked = new GlobalForward("GameRules_OnTeamStacked", ET_Hook, Param_Cell, Param_Cell, Param_CellByRef);

    Watcher_SetForward(Index_GameRules_TeamStacked, g_onTeamStacked);
}

Action Forward_GameRules_OnTeamStacked(int newTeam, int currentTeam, bool& stacked) {
    Action result = Plugin_Continue;

    Call_StartForward(g_onTeamStacked);
    Call_PushCell(newTeam);
    Call_PushCell(currentTeam);
    Call_PushCellRef(stacked);
    Call_Finish(result);

    return result;
}

static void GameRules_OnCanPlayerJoinClass_Create() {
    g_onCanPlayerJoinClass = new GlobalForward("GameRules_OnCanPlayerJoinClass", ET_Hook, Param_Cell, Param_Cell, Param_CellByRef);

    Watcher_SetForward(Index_GameRules_CanPlayerJoinClass, g_onCanPlayerJoinClass);
}

Action Forward_GameRules_OnCanPlayerJoinClass(int client, int class, bool& canJoin) {
    Action result = Plugin_Continue;

    Call_StartForward(g_onCanPlayerJoinClass);
    Call_PushCell(client);
    Call_PushCell(class);
    Call_PushCellRef(canJoin);
    Call_Finish(result);

    return result;
}

static void Player_OnRespawn_Create() {
    g_onRespawn = new GlobalForward("Player_OnRespawn", ET_Hook, Param_Cell);

    Watcher_SetForward(Index_Player_Respawn, g_onRespawn);
}

Action Forward_Player_OnRespawn(int client) {
    Action result = Plugin_Continue;

    Call_StartForward(g_onRespawn);
    Call_PushCell(client);
    Call_Finish(result);

    return result;
}

static void Player_OnJoinTeam_Create() {
    g_onJoinTeam = new GlobalForward("Player_OnJoinTeam", ET_Hook, Param_Cell, Param_CellByRef);

    Watcher_SetForward(Index_Player_JoinTeam, g_onJoinTeam);
}

Action Forward_Player_OnJoinTeam(int client, int& team) {
    Action result = Plugin_Continue;

    Call_StartForward(g_onJoinTeam);
    Call_PushCell(client);
    Call_PushCellRef(team);
    Call_Finish(result);

    return result;
}

static void Player_OnJoinClass_Create() {
    g_onJoinClass = new GlobalForward("Player_OnJoinClass", ET_Hook, Param_Cell, Param_CellByRef);

    Watcher_SetForward(Index_Player_JoinClass, g_onJoinClass);
}

Action Forward_Player_OnJoinClass(int client, int& class) {
    Action result = Plugin_Continue;

    Call_StartForward(g_onJoinClass);
    Call_PushCell(client);
    Call_PushCellRef(class);
    Call_Finish(result);

    return result;
}

static void Player_OnVoiceCommand_Create() {
    g_onVoiceCommand = new GlobalForward("Player_OnVoiceCommand", ET_Hook, Param_Cell, Param_CellByRef);

    Watcher_SetForward(Index_Player_VoiceCommand, g_onVoiceCommand);
}

Action Forward_Player_OnVoiceCommand(int client, int& voiceCommand) {
    Action result = Plugin_Continue;

    Call_StartForward(g_onVoiceCommand);
    Call_PushCell(client);
    Call_PushCellRef(voiceCommand);
    Call_Finish(result);

    return result;
}
