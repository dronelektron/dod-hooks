static Handle g_setWinningTeam;

void SdkCall_GameRules_SetWinningTeam_Create(GameData gameData) {
    StartPrepSDKCall(SDKCall_GameRules);
    PrepSDKCall_SetFromConf(gameData, SDKConf_Signature, GAME_RULES_SET_WINNING_TEAM);
    PrepSDKCall_AddParameter(SDKType_PlainOldData, SDKPass_Plain); // team

    g_setWinningTeam = EndPrepSDKCall();
}

void SdkCall_GameRules_SetWinningTeam(int team) {
    SDKCall(g_setWinningTeam, team);
}
