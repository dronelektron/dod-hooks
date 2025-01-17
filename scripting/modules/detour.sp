void Detour_Create(GameData gameData) {
    GameRules_SetWinningTeam_Create(gameData);
    GameRules_TeamFull_Create(gameData);
    Player_Respawn_Create(gameData);
    Player_JoinTeam_Create(gameData);
    Player_JoinClass_Create(gameData);
    Player_VoiceCommand_Create(gameData);
}

static void GameRules_SetWinningTeam_Create(GameData gameData) {
    DynamicDetour detour = DHookCreateDetour(Address_Null, CallConv_THISCALL, ReturnType_Void, ThisPointer_Ignore);

    detour.SetFromConf(gameData, SDKConf_Signature, GAME_RULES_SET_WINNING_TEAM);
    detour.AddParam(HookParamType_Int); // team

    Watcher_SetDetour(Index_GameRules_SetWinningTeam, detour, SetWinningTeam);
}

static MRESReturn SetWinningTeam(DHookParam params) {
    int team = DHookGetParam(params, 1);

    switch (Forward_GameRules_OnSetWinningTeam(team)) {
        case Plugin_Changed: {
            DHookSetParam(params, 1, team);

            return MRES_ChangedHandled;
        }

        case Plugin_Stop: {
            return MRES_Supercede;
        }
    }

    return MRES_Ignored;
}

static void GameRules_TeamFull_Create(GameData gameData) {
    DynamicDetour detour = DHookCreateDetour(Address_Null, CallConv_THISCALL, ReturnType_Bool, ThisPointer_Ignore);

    detour.SetFromConf(gameData, SDKConf_Signature, GAME_RULES_TEAM_FULL);
    detour.AddParam(HookParamType_Int); // team

    Watcher_SetDetour(Index_GameRules_TeamFull, detour, TeamFull);
}

static MRESReturn TeamFull(DHookReturn results, DHookParam params) {
    int team = DHookGetParam(params, 1);
    bool full;

    switch (Forward_GameRules_OnTeamFull(team, full)) {
        case Plugin_Stop: {
            DHookSetReturn(results, full);

            return MRES_Supercede;
        }
    }

    return MRES_Ignored;
}

static void Player_Respawn_Create(GameData gameData) {
    DynamicDetour detour = DHookCreateDetour(Address_Null, CallConv_THISCALL, ReturnType_Void, ThisPointer_CBaseEntity);

    detour.SetFromConf(gameData, SDKConf_Signature, PLAYER_RESPAWN);

    Watcher_SetDetour(Index_Player_Respawn, detour, Respawn);
}

static MRESReturn Respawn(int client) {
    switch (Forward_Player_OnRespawn(client)) {
        case Plugin_Stop: {
            return MRES_Supercede;
        }
    }

    return MRES_Ignored;
}

static void Player_JoinTeam_Create(GameData gameData) {
    DynamicDetour detour = DHookCreateDetour(Address_Null, CallConv_THISCALL, ReturnType_Bool, ThisPointer_CBaseEntity);

    detour.SetFromConf(gameData, SDKConf_Signature, PLAYER_JOIN_TEAM);
    detour.AddParam(HookParamType_Int); // team

    Watcher_SetDetour(Index_Player_JoinTeam, detour, JoinTeam);
}

static MRESReturn JoinTeam(int client, DHookReturn results, DHookParam params) {
    int team = DHookGetParam(params, 1);

    switch (Forward_Player_OnJoinTeam(client, team)) {
        case Plugin_Changed: {
            DHookSetParam(params, 1, team);

            return MRES_ChangedHandled;
        }

        case Plugin_Stop: {
            DHookSetReturn(results, HANDLED_YES);

            return MRES_Supercede;
        }
    }

    return MRES_Ignored;
}

static void Player_JoinClass_Create(GameData gameData) {
    DynamicDetour detour = DHookCreateDetour(Address_Null, CallConv_THISCALL, ReturnType_Bool, ThisPointer_CBaseEntity);

    detour.SetFromConf(gameData, SDKConf_Signature, PLAYER_JOIN_CLASS);
    detour.AddParam(HookParamType_Int); // class

    Watcher_SetDetour(Index_Player_JoinClass, detour, JoinClass);
}

static MRESReturn JoinClass(int client, DHookReturn results, DHookParam params) {
    int class = DHookGetParam(params, 1);

    switch (Forward_Player_OnJoinClass(client, class)) {
        case Plugin_Changed: {
            DHookSetParam(params, 1, class);

            return MRES_ChangedHandled;
        }

        case Plugin_Stop: {
            DHookSetReturn(results, HANDLED_YES);

            return MRES_Supercede;
        }
    }

    return MRES_Ignored;
}

static void Player_VoiceCommand_Create(GameData gameData) {
    DynamicDetour detour = DHookCreateDetour(Address_Null, CallConv_THISCALL, ReturnType_Void, ThisPointer_CBaseEntity);

    detour.SetFromConf(gameData, SDKConf_Signature, PLAYER_VOICE_COMMAND);
    detour.AddParam(HookParamType_Int); // voiceCommand

    Watcher_SetDetour(Index_Player_VoiceCommand, detour, VoiceCommand);
}

static MRESReturn VoiceCommand(int client, DHookParam params) {
    int voiceCommand = DHookGetParam(params, 1);

    switch (Forward_Player_OnVoiceCommand(client, voiceCommand)) {
        case Plugin_Changed: {
            DHookSetParam(params, 1, voiceCommand);

            return MRES_ChangedHandled;
        }

        case Plugin_Stop: {
            return MRES_Supercede;
        }
    }

    return MRES_Ignored;
}
