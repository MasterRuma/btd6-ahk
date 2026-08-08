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

TestScreenRecord() {
    Send "#!g"
}