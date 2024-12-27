static DynamicDetour g_setWinningTeam;

void DynamicHook_Create() {
    GameData gameData = new GameData(GAME_CONFIG);

    g_setWinningTeam = CreateSetWinningTeam(gameData);

    CloseHandle(gameData);
}

static DynamicDetour CreateSetWinningTeam(GameData gameData) {
    DynamicDetour setup = DHookCreateDetour(Address_Null, CallConv_THISCALL, ReturnType_Void, ThisPointer_Ignore);

    setup.SetFromConf(gameData, SDKConf_Signature, DOD_GAME_RULES_SET_WINNING_TEAM);
    setup.AddParam(HookParamType_Int); // team

    return setup;
}

void DynamicHook_EnableSetWinningTeam() {
    g_setWinningTeam.Enable(Hook_Pre, OnSetWinningTeam);
}

void DynamicHook_DisableSetWinningTeam() {
    g_setWinningTeam.Disable(Hook_Pre, OnSetWinningTeam);
}

static MRESReturn OnSetWinningTeam(DHookParam params) {
    int team = DHookGetParam(params, 1);
    Action result = Forward_OnSetWinningTeam(team);

    return result > Plugin_Continue ? MRES_Supercede : MRES_Ignored;
}
