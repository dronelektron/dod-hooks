static GlobalForward g_onSetWinningTeam;

void Forward_Create() {
    g_onSetWinningTeam = new GlobalForward("DodHooks_OnSetWinningTeam", ET_Hook, Param_CellByRef);
}

Action Forward_OnSetWinningTeam(int& team) {
    Action result = Plugin_Continue;

    Call_StartForward(g_onSetWinningTeam);
    Call_PushCellRef(team);
    Call_Finish(result);

    return result;
}
