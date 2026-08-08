MoonLandingHard() {
    global TS := Map(
        "Hero", ["hero", [257, 440]],
        "Wizard C 1", ["wizard", [712, 531]],
        "Wizard C 2", ["wizard", [794, 516]],
        "Wizard C 3", ["wizard", [631, 563]],
        "Wizard C 4", ["wizard", [787, 431]],
        "Wizard C 5", ["wizard", [896, 475]],
        "Wizard B", ["wizard", [904, 540]],
        "Druid 1", ["druid", [1107, 749]],
        "Druid 2", ["druid", [1054, 617]],
        "Druid 3", ["druid", [1064, 521]],
        "Druid 4", ["druid", [987, 534]],
        "Druid 5", ["druid", [1039, 439]],
        "Druid 6", ["druid", [958, 422]],
        "Druid 7", ["druid", [875, 384]],
        "Druid 8", ["druid", [998, 236]],
        "Druid 9", ["druid", [360, 528]],
        "Druid 10", ["druid", [1211, 586]],
        "Druid 11", ["druid", [1223, 656]],
        "Druid 12", ["druid", [912, 222]],
        "Druid 13", ["druid", [827, 206]],
        "Druid 14", ["druid", [1196, 718]],
        "Druid 15", ["druid", [756, 174]],
    )

    Place("Druid 1", true)
    StartGame()
    Upgrade("Druid 1", 1, 3, 0, true)

    Place("Wizard C 1", true)
    Upgrade("Wizard C 1", 1, 0, 3, true)

    Place("Hero", true)

    Upgrade("Druid 1", 0, 1, 0, true)

    Place("Wizard B", true)
    Upgrade("Wizard B", 2, 3, 0, true)

    Loop 4 {
        Place("Wizard C " (A_Index + 1), true)
        Upgrade("Wizard C " (A_Index + 1), 1, 0, 3, true)
    }

    Loop 14 {
        Place("Druid " (A_Index + 1), true)
        Upgrade("Druid " (A_Index + 1), 1, 4, 0, true)
    }

}
