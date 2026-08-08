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

global PostUnlockTrainingWorkflow := [
    ["desperado", 3],
    ["dartling", 4],
    ["mermonkey", 4],
    ["skywarden", 4],
    ["farm", 4],
    ["beast", 6]
]

global SetupWorkflow := ["easy", "primary"]
global isSetupMode := false
global setupIndex := 1

global isTrainingMode := false
global trainingIndex := 1
global trainingCount := 0
global trainingLastVictories := 0
global trainingMonkeyType := ""

global isPostUnlockTrainingMode := false
global postUnlockTrainingIndex := 1
global postUnlockTrainingCount := 0
global postUnlockTrainingLastVictories := 0

^!+f:: {
    ClearLogFile()
    LogMsg("Monkey Training Script started (Ctrl+Alt+Shift+F)")
    
    global isTrainingMode := true
    global isSetupMode := true
    global isPostUnlockTrainingMode := false
    global setupIndex := 1
    global trainingIndex := 1
    global trainingCount := 0
    global trainingLastVictories := victories
    
    ApplyTrainingConfig()
    
    SetTimer(CheckTrainingProgress, 2000)
    SetTimer(CheckPostUnlockTrainingProgress, 0)
    
    Start()
}

^!+g:: {
    ClearLogFile()
    LogMsg("Post-Unlock Monkey Training Script started (Ctrl+Alt+Shift+G)")
    
    global isTrainingMode := false
    global isSetupMode := false
    global isPostUnlockTrainingMode := true
    global postUnlockTrainingIndex := 1
    global postUnlockTrainingCount := 0
    global postUnlockTrainingLastVictories := victories
    
    ApplyPostUnlockTrainingConfig()
    
    SetTimer(CheckPostUnlockTrainingProgress, 2000)
    SetTimer(CheckTrainingProgress, 0)
    
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

ApplyPostUnlockTrainingConfig() {
    global postUnlockTrainingIndex, mapSelect, userDifficulty, trainingMonkeyType
    mapSelect := "ancient_portal"
    userDifficulty := "medium"

    if (postUnlockTrainingIndex <= PostUnlockTrainingWorkflow.Length) {
        item := PostUnlockTrainingWorkflow[postUnlockTrainingIndex]
        trainingMonkeyType := item[1]
        LogMsg("Post-Unlock Training: Next monkey set to " trainingMonkeyType " (" item[2] " games)")
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

CheckPostUnlockTrainingProgress() {
    global isPostUnlockTrainingMode, postUnlockTrainingIndex, postUnlockTrainingCount, postUnlockTrainingLastVictories, trainingMonkeyType
    
    if (!isPostUnlockTrainingMode) {
        SetTimer(CheckPostUnlockTrainingProgress, 0)
        return
    }
    
    if (victories > postUnlockTrainingLastVictories) {
        global postUnlockTrainingLastVictories := victories
        global postUnlockTrainingCount := postUnlockTrainingCount + 1
        
        item := PostUnlockTrainingWorkflow[postUnlockTrainingIndex]
        LogMsg("Post-Unlock Training: " trainingMonkeyType " finished " postUnlockTrainingCount " / " item[2] " games.")
        
        if (postUnlockTrainingCount >= item[2]) {
            global postUnlockTrainingIndex := postUnlockTrainingIndex + 1
            global postUnlockTrainingCount := 0
            
            if (postUnlockTrainingIndex > PostUnlockTrainingWorkflow.Length) {
                LogMsg("Post-Unlock Training Workflow Completed! Stopping script.")
                global isPostUnlockTrainingMode := false
                SetTimer(CheckPostUnlockTrainingProgress, 0)
                Reload()
                return
            }
            
            ApplyPostUnlockTrainingConfig()
        }
    }
}
