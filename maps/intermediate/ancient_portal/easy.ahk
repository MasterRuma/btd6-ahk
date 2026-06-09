AncientPortalEasy() {
    global trainingMonkeyType
    global TS := Map(
        "Hero", ["hero", [1200, 465]],
        "TrainingLand", [trainingMonkeyType, [540, 262]],
        "TrainingWater", [trainingMonkeyType, [1208, 692]],
    )

    StartGame()

    WaitForRound(3)

    Place("Hero")

    WaitForRound(10)
    
    if (trainingMonkeyType ~= "sub|boat") {
        Place("TrainingWater")
    } else {
        Place("TrainingLand")
    }
}

