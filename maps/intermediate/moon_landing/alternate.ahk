MooonLandingAlternate() {
    global TS := Map(
        "Hero", ["hero", [252, 584]],
        "Mortar 1", ["mortar", [422, 679]],
        "Mortar 2", ["mortar", [888, 448]],
        "Alch 1", ["alch", [1106, 747]],
        "Alch 2", ["alch", [1120, 816]],
        "Alch 3", ["alch", [1054, 617]],
        "Alch 4", ["alch", [1082, 879]],
        "Alch 5", ["alch", [1176, 932]],
        "Village", ["village", [1201, 750]],
        "Dartling", ["dartling", [70, 646]], 
    )

    Place("Mortar 1", true)
    Aim("Mortar 1", 810, 728)
    StartGame()
    Upgrade("Mortar 1", 0, 0, 2, true)
    Upgrade("Mortar 1", 0, 2, 0, true)

    Place("Alch 1", true)
    Upgrade("Alch 1", 0, 2, 2, true)

    Place("Hero", true)

    Upgrade("Mortar 1", 0, 0, 2, true)
    
    Place("Village", true)
    Upgrade("Village", 2, 2, 0, true)

    Loop 4 {
        Place("Alch " (A_Index + 1), true)
        Upgrade("Alch " (A_Index + 1), 0, 2, 2, true)
    }

    Targeting("Alch 5", 2) 

    Place("Mortar 2", true)
    Aim("Mortar 2", 810, 728)
    Upgrade("Mortar 2", 0, 2, 4, true)

    Place("Dartling", true)
    Targeting("Dartling", 1)
    Aim("Dartling", 605, 270)
    Upgrade("Dartling", 2, 2, 0, true)
    Upgrade("Dartling", 3, 0, 0, true)

    WaitForRound(80)

    Upgrade("Alch 5", 0, 0, 3, true)


}
