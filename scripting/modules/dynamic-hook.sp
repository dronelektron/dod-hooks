static Handle g_setWinningTeam;

void DynamicHook_Create() {
    Handle gameConfig = LoadGameConfigFile(GAME_CONFIG);

    if (gameConfig == null) {
        SetFailState("Unable to load the '%s' file", GAME_CONFIG);
    }

    g_setWinningTeam = CreateHook(gameConfig, FUNCTION_SET_WINNING_TEAM);

    EnableSetWinningTeam();
    CloseHandle(gameConfig);
}

static Handle CreateHook(Handle gameConfig, const char[] functionName) {
    Handle setup = DHookCreateFromConf(gameConfig, functionName);

    if (setup == null) {
        SetFailState("Unable to hook the '%s' function", functionName);
    }

    return setup;
}

static void EnableSetWinningTeam() {
    DHookEnableDetour(g_setWinningTeam, POST_NO, DynamicHook_OnSetWinningTeam);
}

public MRESReturn DynamicHook_OnSetWinningTeam(DHookParam params) {
    int team = DHookGetParam(params, 1);
    Action result = Forward_OnSetWinningTeam(team);

    return result > Plugin_Continue ? MRES_Supercede : MRES_Ignored;
}
