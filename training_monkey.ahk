global TrainingWorkflow := [
    ["bomb", 3],
    ["tack", 3],
    ["ice", 3],
    ["glue", 3],
    ["sniper", 3],
    ["sub", 4],
    ["boat", 4],
    ["ace", 4],
    ["heli", 5],
    ["mortar", 3],
    ["wizard", 3],
    ["super", 10],
    ["ninja", 4],
    ["alch", 3],
    ["druid", 4],
    ["spike", 3],
    ["village", 3],
    ["engineer", 3]
]

global SetupWorkflow := ["easy", "primary"]
global isSetupMode := false
global setupIndex := 1

global isTrainingMode := false
global trainingIndex := 1
global trainingCount := 0
global trainingLastVictories := 0
global trainingMonkeyType := ""

^!+f:: {
    ClearLogFile()
    LogMsg("Monkey Training Script started (Ctrl+Alt+Shift+F)")
    
    global isTrainingMode := true
    global isSetupMode := true
    global setupIndex := 1
    global trainingIndex := 1
    global trainingCount := 0
    global trainingLastVictories := victories
    
    ApplyTrainingConfig()
    
    SetTimer(CheckTrainingProgress, 2000)
    
    Start()
}

ApplyTrainingConfig() {
    global trainingIndex, mapSelect, userDifficulty, trainingMonkeyType, isSetupMode, setupIndex
    mapSelect := "ancient_portal"

    if (isSetupMode) {
        userDifficulty := SetupWorkflow[setupIndex]
        trainingMonkeyType := "hero"
        LogMsg("Training Setup: Clearing " userDifficulty)
        return
    }

    if (trainingIndex <= TrainingWorkflow.Length) {
        item := TrainingWorkflow[trainingIndex]
        trainingMonkeyType := item[1]
        userDifficulty := "deflation"
        LogMsg("Training: Next monkey set to " trainingMonkeyType " (" item[2] " games)")
    }
}

CheckTrainingProgress() {
    global isTrainingMode, isSetupMode, setupIndex, trainingIndex, trainingCount, trainingLastVictories, mapSelect, trainingMonkeyType
    
    if (!isTrainingMode) {
        SetTimer(CheckTrainingProgress, 0)
        return
    }
    
    if (victories > trainingLastVictories) {
        global trainingLastVictories := victories
        
        if (isSetupMode) {
            global setupIndex := setupIndex + 1
            LogMsg("Training Setup: Progressing to next step.")
            
            if (setupIndex > SetupWorkflow.Length) {
                LogMsg("Training Setup: All prerequisites cleared. Starting Deflation training.")
                global isSetupMode := false
                global trainingIndex := 1
                global trainingCount := 0
            }
            ApplyTrainingConfig()
        } else {
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
}
