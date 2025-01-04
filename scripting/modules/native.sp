void Native_GameRules_SetWinningTeam_Create() {
    CreateNative("GameRules_SetWinningTeam", SetWinningTeam);
    CreateNative("Player_Respawn", Respawn);
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
