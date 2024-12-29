#include <sourcemod>
#include <dhooks>

#include "dod-hooks/api/native"
#include "dod-hooks/dynamic-hook"

#include "modules/dynamic-hook.sp"
#include "modules/forward.sp"
#include "modules/native.sp"
#include "modules/sdk-call.sp"

public Plugin myinfo = {
    name = "DOD hooks",
    author = "Dron-elektron",
    description = "Allows you to use natives and detours functions",
    version = "0.1.0",
    url = "https://github.com/dronelektron/dod-hooks"
};

public APLRes AskPluginLoad2(Handle plugin, bool late, char[] error, int errorMax) {
    Native_Create();

    return APLRes_Success;
}

public void OnPluginStart() {
    DynamicHook_Create();
    Forward_Create();
    SdkCall_Create();
}

public void OnMapStart() {
    DynamicHook_EnableSetWinningTeam();
}

public void OnMapEnd() {
    DynamicHook_DisableSetWinningTeam();
}
