AncientPortalImpoppable() {
    global TS := Map(
        "Hero", ["hero", [1146, 279]],
        "Dart", ["dart", [1144, 472]],
        "Boomer A", ["boomer", [1273, 482]],
        "Boomer B", ["boomer", [1051, 447]],
        "Ice", ["ice", [1238, 334]],
        "Bomb", ["bomb", [1475, 706]]
    )

    Place("Dart", true)
    Place("Boomer A", true)

    StartGame()

    Place("Hero", true)

    Upgrade("Dart", 0, 2, 4, true)
    Upgrade("Boomer A", 0, 0, 2, true)
    Upgrade("Boomer A", 5, 0, 0, true)
    Upgrade("Dart", 0, 0, 1, true)

    Place("Boomer B", true)
    Upgrade("Boomer B", 2, 0, 5, true)

    Place("Ice", true)
    Upgrade("Ice", 0, 2, 0, true)
    Upgrade("Ice", 5, 0, 0, true)

    Place("Bomb", true)
    Upgrade("Bomb", 0, 0, 5, true)
}

