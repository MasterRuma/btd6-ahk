#SingleInstance Force
#MaxThreadsPerHotkey 3
#Include %A_ScriptDir%

#Include maps\_include.ahk
#Include utils\_include.ahk
#Include data\_include.ahk

^!+j:: {
    TestPlacements()
}

^!+k:: {
    Sleep 1000
    TestScreenRecord()
}

^!+l:: {
    TestUpgrade()
}

^!+p:: {
    LogMsg("Script stopped")
    Reload()
}

TestHeroSelection() {
    for hero in HERO_SKINS {
        global hero := hero
        ChangeHero(hero)
    }
}

TestAbility() {
    Ability("sniper", "1", "4")
}

TestRemove() {
    reverseCoord := [840, 240]
    extendCoord := [840, 900]
    confirmCoord := [945, 625]
    Remove(extendCoord[1], extendCoord[2])
    Sleep(2000)
    Remove(reverseCoord[1], reverseCoord[2])

}

TestPlacements() {
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

    for tower in TS {
        if TowerHasCoords(tower) and TowerHasType(tower) {
            Place(tower)
        }
    }

}

TestUpgrade() {
    global TS := Map(
        "Dart 1", ["dart", [564, 801]],
        "Boomer 1", ["boomer", [241, 533]],
        "Hero", ["hero", [325, 122]],
        "Dart 2", ["dart", [112, 505]],
        "Dart 3", ["dart", [292, 464]]
    )

    ; Place an unupgraded Dart Monkey at these coordinates before running.
    Place("Dart 1", true)
    Place("Boomer 1", true)
    Place("Hero", true)
    Upgrade("Boomer 1", 4, 0, 2, true)  ; 000 -> 402
    Upgrade("Dart 1", 0, 2, 4, true)    ; 000 -> 024
    Upgrade("Boomer 1", 1, 0, 0, true)  ; 402 -> 502

    Upgrade("Dart 1", 0, 0, 1, true)    ; 024 -> 025
    Place("Dart 2", true)
    Upgrade("Dart 2", 5, 0, 2, true)    ; 000 -> 502
    Place("Dart 3", true)
    Upgrade("Dart 3", 0, 5, 0, true)    ; 000 -> 050
    Paragon("Dart 1", 3, 0, true)
}

TestScreenRecord() {
    Send "#!g"
}
