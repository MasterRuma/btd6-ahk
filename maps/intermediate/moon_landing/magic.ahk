MoonLandingMagic() {
    global TS := Map(
        "Hero", ["hero", [904, 490]],
        "Druid A", ["druid", [87, 488]],
        "Druid 1", ["druid", [1054, 617]],
        "Druid 2", ["druid", [998, 236]],
        "Druid 3", ["druid", [1064, 521]],
        "Druid 4", ["druid", [987, 534]],
        "Druid 5", ["druid", [1039, 439]],
        "Druid 6", ["druid", [958, 422]],
        "Druid 7", ["druid", [875, 384]],
        "Druid 8", ["druid", [1107, 749]],
        "Druid 9", ["druid", [360, 528]],
        "Druid 10", ["druid", [1211, 586]],
        "Druid 11", ["druid", [1223, 656]],
        "Druid 12", ["druid", [912, 222]],
        "Druid 13", ["druid", [827, 206]],
        "Druid 14", ["druid", [1196, 718]],
        "Druid 15", ["druid", [756, 174]],
        "Druid 16", ["druid", [821, 476]],
        "Druid 17", ["druid", [253, 433]],
        "Druid 18", ["druid", [790, 373]],
        "Druid 19", ["druid", [291, 567]],
        "Druid 20", ["druid", [1284, 558]],
        "Druid 21", ["druid", [183, 463]],
    )

    Place("Druid 1", true)
    StartGame()
    Upgrade("Druid 1", 1, 3, 0, true)

    Place("Hero", true)

    Place("Druid A", true)
    Upgrade("Druid A", 4, 0, 2, true)

    Upgrade("Druid 1", 0, 1, 0, true)

    Loop 20 {
        Place("Druid " (A_Index + 1), true)
        Upgrade("Druid " (A_Index + 1), 1, 4, 0, true)
    }

    Upgrade("Druid 1", 0, 1, 0, true)

}
