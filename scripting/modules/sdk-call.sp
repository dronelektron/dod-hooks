static Handle g_setWinningTeam;
static Handle g_respawn;

void SdkCall_GameRules_SetWinningTeam_Create(GameData gameData) {
    StartPrepSDKCall(SDKCall_GameRules);
    PrepSDKCall_SetFromConf(gameData, SDKConf_Signature, GAME_RULES_SET_WINNING_TEAM);
    PrepSDKCall_AddParameter(SDKType_PlainOldData, SDKPass_Plain); // team

    g_setWinningTeam = EndPrepSDKCall();
}

void SdkCall_GameRules_SetWinningTeam(int team) {
    SDKCall(g_setWinningTeam, team);
}

void SdkCall_Player_Respawn_Create(GameData gameData) {
    StartPrepSDKCall(SDKCall_Entity);
    PrepSDKCall_SetFromConf(gameData, SDKConf_Signature, PLAYER_RESPAWN);

    g_respawn = EndPrepSDKCall();
}

void SdkCall_Player_Respawn(int client) {
    SDKCall(g_respawn, client);
}
