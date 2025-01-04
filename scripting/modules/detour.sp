void Detour_GameRules_SetWinningTeam_Create(GameData gameData) {
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

void Detour_Player_Respawn_Create(GameData gameData) {
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
