ThreeMinesRoundHard() {
    global TS := Map(
        "Dart", ["dart", [760, 843]],
        "Boomer", ["boomer", [749, 243]],
    )

    Place("Dart")
    Place("Boomer")

    StartGame()

    Upgrade("Dart", 0, 2, 4, true)
    Upgrade("Boomer", 0, 0, 2, true)
    Upgrade("Boomer", 5, 0, 0, true)
}
