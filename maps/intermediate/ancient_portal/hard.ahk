AncientPortalHard() {
    global TS := Map(
        "Hero", ["hero", [1146, 279]],
        "Dart", ["dart", [1144, 472]],
        "Boomer", ["boomer", [1273, 482]]
    )

    Place("Dart", true)
    Place("Boomer", true)

    StartGame()

    Place("Hero", true)

    Upgrade("Dart", 0, 2, 4, true)
    Upgrade("Boomer", 0, 0, 2, true)
    Upgrade("Boomer", 5, 0, 0, true)
}

