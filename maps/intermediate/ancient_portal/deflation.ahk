AncientPortalDeflation() {
    global trainingMonkeyType
    global TS := Map(
        "Hero", ["hero", [435, 866]],
        "TrainingLand", [trainingMonkeyType, [540, 262]],
        "TrainingWater", [trainingMonkeyType, [1208, 692]],
    )

    Place("Hero")
    Click(435, 866)

    Loop 8 {
        SlowClick(1380, 685)
    }

    Remove(765, 924, 946, 628)

    if (trainingMonkeyType ~= "sub|boat") {
        Place("TrainingWater")
    } else {
        Place("TrainingLand")
    }

    StartGame()

}

