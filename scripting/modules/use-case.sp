bool UseCase_Player_Respawn(int client, bool forceRespawn) {
    bool noTeam = GetClientTeam(client) < Team_Allies;
    bool noClass = GetDesiredPlayerClass(client) == Class_Undefined;

    if (noTeam || noClass) {
        return false;
    }

    if (forceRespawn || !IsPlayerAlive(client)) {
        SdkCall_Player_Respawn(client);

        return true;
    }

    return false;
}

static int GetDesiredPlayerClass(int client) {
    return GetEntProp(client, Prop_Send, "m_iDesiredPlayerClass");
}
