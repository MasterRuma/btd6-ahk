ThreeMinesRoundReverse() {
    global TS := Map(
        "Hero", ["hero", [608, 804]],
        "Skywarden", ["skywarden", [753, 239]],
    )

    Place("Skywarden", true)

    StartGame()

    Place("Hero", true)
}
