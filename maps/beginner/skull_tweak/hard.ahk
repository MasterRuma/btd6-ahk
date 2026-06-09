SkullTweakHard() {
    global TS := Map(
        "Dart", ["dart", [430, 566]],
        "Boomer", ["boomer", [540, 568]],
    )

    Place("Dart")
    Place("Boomer")

    StartGame()

    Upgrade("Dart", 0, 2, 4, true)
    Upgrade("Boomer", 0, 0, 2, true)
    Upgrade("Boomer", 5, 0, 0, true)
}
