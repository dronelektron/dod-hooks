void Native_Create() {
    CreateNative("DodHooks_SetWinningTeam", Native_SetWinningTeam);
}

any Native_SetWinningTeam(Handle plugin, int numParams) {
    int team = GetNativeCell(1);

    SdkCall_SetWinningTeam(team);

    return VOID;
}
