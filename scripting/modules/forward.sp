static GlobalForward g_onSetWinningTeam;
static GlobalForward g_onRespawn;
static GlobalForward g_onJoinTeam;
static GlobalForward g_onJoinClass;

void Forward_GameRules_OnSetWinningTeam_Create() {
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

void Forward_Player_OnRespawn_Create() {
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

void Forward_Player_OnJoinTeam_Create() {
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

void Forward_Player_OnJoinClass_Create() {
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
