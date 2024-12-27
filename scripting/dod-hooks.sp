#include <sourcemod>
#include <dhooks>

#include "dod-hooks/dynamic-hook"

#include "modules/dynamic-hook.sp"
#include "modules/forward.sp"

public Plugin myinfo = {
    name = "DOD hooks",
    author = "Dron-elektron",
    description = "Allows you to use natives and detours functions",
    version = "0.1.0",
    url = "https://github.com/dronelektron/dod-hooks"
};

public void OnPluginStart() {
    DynamicHook_Create();
    Forward_Create();
}

public void OnMapStart() {
    DynamicHook_EnableSetWinningTeam();
}

public void OnMapEnd() {
    DynamicHook_DisableSetWinningTeam();
}
