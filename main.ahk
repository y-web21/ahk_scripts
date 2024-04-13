#Requires AutoHotkey v2.0+
#SingleInstance Force
;==================Auto Execution Area==================
;最初のReturnの出現で宣言部が終了してしまうため、まず読み込み。
#include %A_ScriptDir% ;ここから下の#IncludeやFileInstallの基準パスを変更

; ============================================
; == explicit end of auto execution section ==
; ============================================
Return

; #Include mousectrl.ahk
#Include app/explorer.ahk

LWin & z::Suspend
#n::{
    Reload
}

;タスクバー上でホイール回転することで音量変更をする
#HotIf MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send "{Volume_Up}"
WheelDown::Send "{Volume_Down}"

MouseIsOver(WinTitle) {
    MouseGetPos ,, &Win
    return WinExist(WinTitle " ahk_id " Win)
}
#HotIf
