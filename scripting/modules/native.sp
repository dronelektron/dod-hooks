void Native_Create() {
    CreateNative("GameRules_SetWinningTeam", SetWinningTeam);
    CreateNative("Player_Respawn", Respawn);
    CreateNative("Player_JoinClass", JoinClass);
}

static any SetWinningTeam(Handle plugin, int numParams) {
    int team = GetNativeCell(1);

    SdkCall_GameRules_SetWinningTeam(team);

    return VOID;
}

static any Respawn(Handle plugin, int numParams) {
    int client = GetNativeCell(1);
    bool forceRespawn = GetNativeCell(2);

    return UseCase_Player_Respawn(client, forceRespawn);
}

static any JoinClass(Handle plugin, int numParams) {
    int client = GetNativeCell(1);
    int class = GetNativeCell(2);

    SdkCall_Player_JoinClass(client, class);

    return VOID;
}
