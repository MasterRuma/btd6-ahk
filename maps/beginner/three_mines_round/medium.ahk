ThreeMinesRoundMedium() {
    global TS := Map(
        "Hero", ["hero", [608, 804]],
        "Ninja", ["ninja", [753, 239]],
    )

    Place("Ninja", true)

    StartGame()

    Place("Hero", true)
    Upgrade("Ninja", 4, 0, 2, true)
}
