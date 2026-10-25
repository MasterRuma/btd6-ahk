Reload() {
    Run(A_ScriptFullPath)
    ExitApp()
}

SlowClick(x, y) {
    if defeated {
        return
    }
    Sleep(100)
    MouseMove(x,y)
    Sleep(100)
    Click(x,y)
    Sleep(100)
}

StartGame() {
    if difficulty != "apopalypse" {
        Sleep(100)
        Send(KEYS["play"])  ; Start game
    }
    Sleep(100)
    Send(KEYS["play"])      ; Increase speed
    Sleep(100)
}

Todo() {
    LogMsg("Going to reselect the map and difficulty")
    Send("{Esc}")
    Sleep(1500)
    global difficulty := ""
    ClickImage("buttons\home", 4000)
}

MakeWindowActive(window := windowName) {
    
    if !WinExist(window) {
        LogMsg("Found the following window did not exist during MakeWindowActive(): " window)
        return
    }
    
    if !WinActive(window) {
        LogMsg(window " was not active, activating")
        WinActivate(window)
        LogMsg(window " WinActivate ran")
        WinWaitActive(window)
        LogMsg(window " is now activated")
    }
}

CheckDefeat() {
    return SearchImage("states\defeat",,720,280,1210,410)
}