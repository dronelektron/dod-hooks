void Native_GameRules_SetWinningTeam_Create() {
    CreateNative("GameRules_SetWinningTeam", SetWinningTeam);
}

static any SetWinningTeam(Handle plugin, int numParams) {
    int team = GetNativeCell(1);

    SdkCall_GameRules_SetWinningTeam(team);

    return VOID;
}
