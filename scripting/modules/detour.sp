static DynamicDetour g_setWinningTeam;

void Detour_Create(GameData gameData) {
    g_setWinningTeam = CreateSetWinningTeam(gameData);
}

static DynamicDetour CreateSetWinningTeam(GameData gameData) {
    DynamicDetour setup = DHookCreateDetour(Address_Null, CallConv_THISCALL, ReturnType_Void, ThisPointer_Ignore);

    setup.SetFromConf(gameData, SDKConf_Signature, GAME_RULES_SET_WINNING_TEAM);
    setup.AddParam(HookParamType_Int); // team

    return setup;
}

void Detour_EnableSetWinningTeam() {
    g_setWinningTeam.Enable(Hook_Pre, OnSetWinningTeam);
}

void Detour_DisableSetWinningTeam() {
    g_setWinningTeam.Disable(Hook_Pre, OnSetWinningTeam);
}

static MRESReturn OnSetWinningTeam(DHookParam params) {
    int team = DHookGetParam(params, 1);

    switch (Forward_OnSetWinningTeam(team)) {
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
