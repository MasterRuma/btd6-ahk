global TrainingWorkflow := [
    ["bomb", 7],
    ["tack", 6],
    ["ice", 6],
    ["glue", 6],
    ["sniper", 7],
    ["sub", 7],
    ["boat", 8],
    ["ace", 8],
    ["heli", 10],
    ["mortar", 7],
    ["wizard", 7],
    ["super", 22],
    ["ninja", 8],
    ["alch", 6],
    ["druid", 7],
    ["farm", 10],
    ["spike", 7],
    ["village", 7],
    ["engineer", 7]
]

global isTrainingMode := false
global trainingIndex := 1
global trainingCount := 0
global trainingLastVictories := 0
global trainingMonkeyType := ""

^!+f:: {
    ClearLogFile()
    LogMsg("Monkey Training Script started (Ctrl+Alt+Shift+F)")
    
    global isTrainingMode := true
    global trainingIndex := 1
    global trainingCount := 0
    global trainingLastVictories := victories
    
    ApplyTrainingConfig()
    
    SetTimer(CheckTrainingProgress, 2000)
    
    Start()
}

ApplyTrainingConfig() {
    global trainingIndex, mapSelect, userDifficulty, trainingMonkeyType
    if (trainingIndex <= TrainingWorkflow.Length) {
        item := TrainingWorkflow[trainingIndex]
        trainingMonkeyType := item[1]
        mapSelect := "ancient_portal"
        userDifficulty := "easy"
        LogMsg("Training: Next monkey set to " trainingMonkeyType " (" item[2] " games)")
    }
}

CheckTrainingProgress() {
    global isTrainingMode, trainingIndex, trainingCount, trainingLastVictories, mapSelect, trainingMonkeyType
    
    if (!isTrainingMode) {
        SetTimer(CheckTrainingProgress, 0)
        return
    }
    
    if (victories > trainingLastVictories) {
        global trainingLastVictories := victories
        global trainingCount := trainingCount + 1
        
        item := TrainingWorkflow[trainingIndex]
        LogMsg("Training: " trainingMonkeyType " finished " trainingCount " / " item[2] " games.")
        
        if (trainingCount >= item[2]) {
            global trainingIndex := trainingIndex + 1
            global trainingCount := 0
            
            if (trainingIndex > TrainingWorkflow.Length) {
                LogMsg("Training Workflow Completed! Stopping script.")
                global isTrainingMode := false
                SetTimer(CheckTrainingProgress, 0)
                Reload()
                return
            }
            
            ApplyTrainingConfig()
        }
    }
}
