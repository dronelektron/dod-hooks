static GlobalForward g_onSetWinningTeam;
static GlobalForward g_onRespawn;

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
