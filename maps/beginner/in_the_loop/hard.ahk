InTheLoopHard() {
    global TS := Map(
        "Dart", ["dart", [1152, 733]],
        "Boomer", ["boomer", [1077, 716]],
    )

    Place("Dart")
    Place("Boomer")

    StartGame()

    Upgrade("Dart", 0, 2, 4, true)
    Upgrade("Boomer", 0, 0, 2, true)
    Upgrade("Boomer", 5, 0, 0, true)

}
