void GameData_Load() {
    GameData gameData = new GameData(GAME_CONFIG);

    if (gameData == null) {
        SetFailState("Unable to open the '%s' game data", GAME_CONFIG);
    }

    Detour_Create(gameData);
    SdkCall_Create(gameData);
    CloseHandle(gameData);
}
