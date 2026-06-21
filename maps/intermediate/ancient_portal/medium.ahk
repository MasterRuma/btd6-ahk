AncientPortalMedium() {
    global trainingMonkeyType
    global TS := Map(
        "Boomer", ["boomer", [271, 778]],
        "Hero", ["hero", [427, 871]],
        "TrainingTower", [trainingMonkeyType, [540, 262]],
    )

    Place("Boomer", true)
    Remove(765, 924, 946, 628)

    StartGame()

    WaitForRound(5)
    Sell("Boomer")

    Place("Hero", true)
    Place("TrainingTower", true)

    WaitForRound(17)
    Click(435, 866)
    SlowClick(1380, 685)
}
