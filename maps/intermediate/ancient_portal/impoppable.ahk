AncientPortalImpoppable() {
    global TS := Map(
        "Hero", ["hero", [1157, 278]],
        "Dart", ["dart", [1177, 437]],
        "Boomer A", ["boomer", [1253, 451]],
        "Boomer B", ["boomer", [1101, 425]],
        "Ice", ["ice", [1218, 331]],
        "Boomer C", ["boomer", [1338, 457]],
    )

    Place("Hero", true)

    StartGame()

    Place("Dart", true)
    Place("Boomer A", true)

    Upgrade("Dart", 0, 2, 4, true)
    Upgrade("Boomer A", 0, 0, 2, true)
    Upgrade("Boomer A", 5, 0, 0, true)
    Upgrade("Dart", 0, 0, 1, true)

    Place("Boomer B", true)
    Upgrade("Boomer B", 2, 0, 5, true)

    Place("Ice", true)
    Upgrade("Ice", 0, 2, 0, true)
    Upgrade("Ice", 5, 0, 0, true)

    Place("Boomer C", true)
    Upgrade("Boomer C", 0, 0, 2, true)
    Upgrade("Boomer C", 0, 5, 0, true)
}

