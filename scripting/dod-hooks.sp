#include <sourcemod>
#include <dhooks>

#include "dod-hooks/detour"
#include "dod-hooks/game-data"
#include "dod-hooks/native"
#include "dod-hooks/use-case"
#include "dod-hooks/watcher"

#include "modules/detour.sp"
#include "modules/forward.sp"
#include "modules/game-data.sp"
#include "modules/native.sp"
#include "modules/sdk-call.sp"
#include "modules/use-case.sp"
#include "modules/watcher.sp"

public Plugin myinfo = {
    name = "DOD hooks",
    author = "Dron-elektron",
    description = "Allows you to use native and detour functions",
    version = "0.1.0",
    url = "https://github.com/dronelektron/dod-hooks"
};

public APLRes AskPluginLoad2(Handle plugin, bool late, char[] error, int errorMax) {
    Native_GameRules_SetWinningTeam_Create();
    Native_Player_Respawn_Create();

    return APLRes_Success;
}

public void OnPluginStart() {
    Forward_GameRules_OnSetWinningTeam_Create();
    Forward_Player_OnRespawn_Create();
    Forward_Player_OnJoinTeam_Create();
    GameData_Load();
    Watcher_ResetDetourStatus();
}

public void OnMapStart() {
    Watcher_UpdateDetourStatus();
}
