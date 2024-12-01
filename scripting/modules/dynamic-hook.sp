static Handle g_setWinningTeam;

void DynamicHook_Create() {
    Handle gameConfig = LoadGameConfigFile(GAME_CONFIG);

    if (gameConfig == null) {
        SetFailState("Unable to load the '%s' file", GAME_CONFIG);
    }

    CreateSetWinningTeam(gameConfig);
    EnableSetWinningTeam();

    delete gameConfig;
}

static void CreateSetWinningTeam(Handle gameConfig) {
    g_setWinningTeam = DHookCreateFromConf(gameConfig, FUNCTION_SET_WINNING_TEAM);

    if (g_setWinningTeam == null) {
        SetFailState("Unable to hook the '%s' function", FUNCTION_SET_WINNING_TEAM);
    }
}

static void EnableSetWinningTeam() {
    DHookEnableDetour(g_setWinningTeam, POST_NO, DynamicHook_OnSetWinningTeam);
}

public MRESReturn DynamicHook_OnSetWinningTeam(DHookParam params) {
    int team = DHookGetParam(params, 1);
    Action result = Forward_OnSetWinningTeam(team);

    return result > Plugin_Continue ? MRES_Supercede : MRES_Ignored;
}
