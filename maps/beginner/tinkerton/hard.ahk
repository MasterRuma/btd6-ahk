TinkertonHard() {
    global TS := Map(
        "Dart", ["dart", [569, 336]],
        "Boomer", ["boomer", [419, 462]],
    )

    Place("Dart")
    Place("Boomer")

    StartGame()

    Upgrade("Dart", 0, 2, 4, true)
    Upgrade("Boomer", 0, 0, 2, true)
    Upgrade("Boomer", 5, 0, 0, true)
}