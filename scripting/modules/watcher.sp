static GlobalForward g_forwards[WATCHERS_SIZE];
static DynamicDetour g_detours[WATCHERS_SIZE];
static DHookCallback g_callbacks[WATCHERS_SIZE];

static bool g_enabled[WATCHERS_SIZE];

void Watcher_ResetDetourStatus() {
    for (int i = Index_GameRules_SetWinningTeam; i <= Index_GameRules_SetWinningTeam; i++) {
        g_enabled[i] = false;
    }
}

void Watcher_SetForward(int index, GlobalForward globalForward) {
    g_forwards[index] = globalForward;
}

void Watcher_SetDetour(int index, DynamicDetour detour, DHookCallback callback) {
    g_detours[index] = detour;
    g_callbacks[index] = callback;
}

void Watcher_UpdateDetourStatus() {
    for (int i = Index_GameRules_SetWinningTeam; i <= Index_GameRules_SetWinningTeam; i++) {
        UpdateDetourStatus(i);
    }
}

static void UpdateDetourStatus(int index) {
    bool enabled = g_forwards[index].FunctionCount > 0;

    if (g_enabled[index] == enabled) {
        return;
    }

    g_enabled[index] = enabled;

    if (enabled) {
        g_detours[index].Enable(Hook_Pre, g_callbacks[index]);
    } else {
        g_detours[index].Disable(Hook_Pre, g_callbacks[index]);
    }
}
