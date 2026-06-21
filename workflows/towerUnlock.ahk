global isAncientPortalLoop := false
global ancientPortalCount := 0
global ancientPortalTarget := 10
global lastAncientVictories := 0

^!+y:: {
    ClearLogFile()
    LogMsg("Ancient Portal Impoppable Loop started (Ctrl+Alt+Shift+Y)")
    
    global isAncientPortalLoop := true
    global ancientPortalCount := 0
    global lastAncientVictories := victories
    
    global mapSelect := "ancient_portal"
    global userDifficulty := "impoppable"
    
    SetTimer(CheckAncientPortalProgress, 2000)
    
    Start()
}

CheckAncientPortalProgress() {
    global isAncientPortalLoop, ancientPortalCount, ancientPortalTarget, lastAncientVictories
    
    if (!isAncientPortalLoop) {
        SetTimer(CheckAncientPortalProgress, 0)
        return
    }
    
    if (victories > lastAncientVictories) {
        global lastAncientVictories := victories
        global ancientPortalCount := ancientPortalCount + 1
        
        LogMsg("Ancient Portal: cleared " ancientPortalCount " / " ancientPortalTarget " times.")
        
        if (ancientPortalCount >= ancientPortalTarget) {
            LogMsg("Ancient Portal Loop Completed! Clicking reward coordinates.")
            global isAncientPortalLoop := false
            SetTimer(CheckAncientPortalProgress, 0)
            
            ; 10번 완료 후, 홈 화면이나 맵 선택 화면으로 돌아올 때까지 대기
            ; WaitForVictoryOrDefeat()에서 이미 승리 화면을 클릭하고 홈으로 이동 중임
            Sleep(5000)
            
            ; 지정된 좌표 (1169, 624) 클릭
            SlowClick(1169, 624)
            LogMsg("Clicked at 1169, 624. Task finished.")
            
            ; 모든 작업 완료 후 스크립트 리로드하여 루프 중단 및 상태 초기화
            Reload()
            return
        }
    }
}
