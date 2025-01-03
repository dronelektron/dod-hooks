static DynamicDetour g_setWinningTeam;

void Detour_GameRules_SetWinningTeam_Create(GameData gameData) {
    g_setWinningTeam = DHookCreateDetour(Address_Null, CallConv_THISCALL, ReturnType_Void, ThisPointer_Ignore);
    g_setWinningTeam.SetFromConf(gameData, SDKConf_Signature, GAME_RULES_SET_WINNING_TEAM);
    g_setWinningTeam.AddParam(HookParamType_Int); // team
}

void Detour_GameRules_SetWinningTeam_Enable() {
    g_setWinningTeam.Enable(Hook_Pre, SetWinningTeam);
}

void Detour_GameRules_SetWinningTeam_Disable() {
    g_setWinningTeam.Disable(Hook_Pre, SetWinningTeam);
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
