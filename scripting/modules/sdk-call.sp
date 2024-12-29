static Handle g_setWinningTeam;

void SdkCall_Create() {
    GameData gameData = new GameData(GAME_CONFIG);

    g_setWinningTeam = CreateSetWinningTeam(gameData);

    CloseHandle(gameData);
}

void SdkCall_SetWinningTeam(int team) {
    SDKCall(g_setWinningTeam, team);
}

static Handle CreateSetWinningTeam(GameData gameData) {
    StartPrepSDKCall(SDKCall_GameRules);
    PrepSDKCall_SetFromConf(gameData, SDKConf_Signature, DOD_GAME_RULES_SET_WINNING_TEAM);
    PrepSDKCall_AddParameter(SDKType_PlainOldData, SDKPass_Plain); // team

    return EndPrepSDKCall();
}
