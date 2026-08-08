MonkeyMeadowReverse() {
    global TS := Map(
        "Hero", ["hero", [648, 546]],
        "Wizard 1", ["wizard", [745, 549]],
        "Wizard 2", ["wizard", [824, 547]],
        "Wizard 3", ["wizard", [644, 699]],
        "Wizard 4", ["wizard", [727, 700]],
        "Wizard 5", ["wizard", [811, 692]],
        "Wizard 6", ["wizard", [485, 676]],
        "Wizard 7", ["wizard", [395, 667]],
        "Wizard 8", ["wizard", [488, 770]],
        "Wizard 9", ["wizard", [389, 754]],
        "Wizard 10", ["wizard", [916, 541]],
        "Wizard 11", ["wizard", [480, 542]],
        "Wizard 12", ["wizard", [914, 421]],
        "Wizard 13", ["wizard", [393, 544]],
        "Wizard 14", ["wizard", [762, 389]],
        "Wizard 15", ["wizard", [668, 383]],
        "Wizard 16", ["wizard", [477, 388]],
        "Wizard 17", ["wizard", [388, 388]],
        "Wizard 18", ["wizard", [897, 684]],
        "Wizard 19", ["wizard", [983, 686]],
        "Wizard 20", ["wizard", [1080, 678]],
        "Wizard 21", ["wizard", [1119, 595]],
        "Wizard 22", ["wizard", [865, 840]],
        "Wizard 23", ["wizard", [927, 344]],
        "Wizard 24", ["wizard", [1021, 308]],
        "Wizard 25", ["wizard", [1122, 284]],
        "Wizard 26", ["wizard", [1223, 296]],
        "Wizard 27", ["wizard", [1143, 509]],
        "Wizard 28", ["wizard", [957, 853]],
        "Wizard 29", ["wizard", [1308, 303]],
        "Wizard 30", ["wizard", [1317, 384]],
    )

    Place("Wizard 1", true)
    StartGame()
    Upgrade("Wizard 1", 0, 2, 2, true)

    Place("Hero", true)
    Upgrade("Wizard 1", 0, 1, 0, true)

    Loop 14 {
        Place("Wizard " (A_Index + 1), true)
        Upgrade("Wizard " (A_Index + 1), 0, 3, 2, true)
    }
}
