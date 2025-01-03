static GlobalForward g_onSetWinningTeam;

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
