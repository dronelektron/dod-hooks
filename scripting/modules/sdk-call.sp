static Handle g_setWinningTeam;
static Handle g_respawn;
static Handle g_joinClass;
static Handle g_voiceCommand;

void SdkCall_Create(GameData gameData) {
    GameRules_SetWinningTeam_Create(gameData);
    Player_Respawn_Create(gameData);
    Player_JoinClass_Create(gameData);
    Player_VoiceCommand_Create(gameData);
}

static void GameRules_SetWinningTeam_Create(GameData gameData) {
    StartPrepSDKCall(SDKCall_GameRules);
    PrepSDKCall_SetFromConf(gameData, SDKConf_Signature, GAME_RULES_SET_WINNING_TEAM);
    PrepSDKCall_AddParameter(SDKType_PlainOldData, SDKPass_Plain); // team

    g_setWinningTeam = EndPrepSDKCall();
}

void SdkCall_GameRules_SetWinningTeam(int team) {
    SDKCall(g_setWinningTeam, team);
}

static void Player_Respawn_Create(GameData gameData) {
    StartPrepSDKCall(SDKCall_Entity);
    PrepSDKCall_SetFromConf(gameData, SDKConf_Signature, PLAYER_RESPAWN);

    g_respawn = EndPrepSDKCall();
}

void SdkCall_Player_Respawn(int client) {
    SDKCall(g_respawn, client);
}

static void Player_JoinClass_Create(GameData gameData) {
    StartPrepSDKCall(SDKCall_Entity);
    PrepSDKCall_SetFromConf(gameData, SDKConf_Signature, PLAYER_JOIN_CLASS);
    PrepSDKCall_AddParameter(SDKType_PlainOldData, SDKPass_Plain); // class

    g_joinClass = EndPrepSDKCall();
}

void SdkCall_Player_JoinClass(int client, int class) {
    SDKCall(g_joinClass, client, class);
}

static void Player_VoiceCommand_Create(GameData gameData) {
    StartPrepSDKCall(SDKCall_Entity);
    PrepSDKCall_SetFromConf(gameData, SDKConf_Signature, PLAYER_VOICE_COMMAND);
    PrepSDKCall_AddParameter(SDKType_PlainOldData, SDKPass_Plain); // voiceCommand

    g_voiceCommand = EndPrepSDKCall();
}

void SdkCall_Player_VoiceCommand(int client, int voiceCommand) {
    SDKCall(g_voiceCommand, client, voiceCommand);
}
