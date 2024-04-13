;==================Auto Execution Area==================
;最初のReturnの出現で宣言部が終了してしまうため、まず読み込み。
#include %A_ScriptDir% ;ここから下の#IncludeやFileInstallの基準パスを変更

#HotkeyInterval 1000    ;default 2000
#MaxHotkeysPerInterval 100    ;????

; =======================================d=====
; == group ==
; ============================================
GroupAdd, DisableF1Help, ahk_class CabinetWClass
GroupAdd, DisableF1Help, ahk_class #32770 ; ダイアログボックス
GroupAdd, DisableF1Help, ahk_class XLMAIN

; ============================================
; == for deepl.ahk ==
; ============================================
SysGet, monitor1, Monitor, 1
#Include deepl.ahk

; ============================================
; == ahk_group #If must be the Auto-execute Section? ==
; ============================================
#If WinActive("ahk_group DisableF1Help")
    F1::return
#if

; ============================================
; == explicit end of auto execution section ==
; ============================================
Return

; #Include mousectrl.ahk
#Include VLCplayer.ahk
#Include app/etc.ahk
#Include app/explorer.ahk
#Include temp.ahk

; ============================================
; ==  ==
; ============================================


SendMode Input ;入力した操作の再生速度が速くなるモード。

#If WinActive("ahk_class CabinetWClass")
; F13:: msgbox, hello f13
#If

RCtrl & ,::AltTab
RCtrl & .::ShiftAltTab

LWin & z::Suspend
#n::
    Reload
    sleep, 700
return
; win + `
#sc029::
    WinGetClass, class, A
    MsgBox, The active window's class is "%class%".
    ClipBoard = ahk_class %class%
    WinGet, exe, ProcessName, A
    MsgBox, %exe%
    WinGetTitle, title, A
    MsgBox, %title%
return

*#e::
    if GetKeyState("Ctrl"){
        run, "%USERPROFILE%"
        return
    }
    else if GetKeyState("Shift"){
        run, explorer.exe
        return
    }
    else {
        run, explorer.exe
    }
Return

; run , e%UserProfile%\user\extttttttttttttt.txt
run , %PROGRAMFILES%\WindowsApps\Files_3.0.8.0_x64__wvne1zexy08sa\Files.App\files.exe
; start shell:AppsFolder\Microsoft.WindowsStore_8wekyb3d8bbwe!App

return

; for browser group
#if WinActive("ahk_class Chrome_WidgetWin_1")
    RButton::RButton
    ; RButton & XButton1::MButtn
    ; RButton & LButton::MButton ; LButton をコンビネーションに含むと#If以外(Explorer)でも押しっぱなしになったりする
    RButton & Wheelup::send,+^{tab}
    RButton & Wheeldown::send,^{tab}
    RButton & XButton1::MButton
; LButton::LButton ; 他ウィンドウに左クリックで移ると押しっぱなしになるのでボツ
#if

;タスクバー上でホイール回転することで音量変更をする
#If MouseIsOver("ahk_class Shell_TrayWnd")
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}

    MouseIsOver(WinTitle) {
        MouseGetPos,,, Win
        Return WinExist(WinTitle . " ahk_id " . Win)
    }
#If

;■実行中のスクリプトがもうひとつ起動されたとき、自動的に既存のプロセスを終了して新たに実行開始する。
#SingleInstance Force

LWin & F2::
    if (%ClipBoardDataType% = %A_EVT_INF_TEXT% and Strlen(ClipBoard)>0) {
        ; Run, "https://www.deepl.com/ja/translator#en/ja/%Clipboard%"
        Run, "C:\Program Files\SRWare Iron (64-Bit)\chrome.exe" --incognito "https://translate.google.com/?hl=ja#ja/en/%Clipboard%"
        Run, "C:\Program Files\SRWare Iron (64-Bit)\chrome.exe" --incognito "https://www.deepl.com/ja/translator#en/ja/%Clipboard%"

        ; }Else{
        ;     InputBox, OutputVar, Translate for Google
        ;         if Strlen(OutputVar)>0
        ;         Run, "https://translate.google.com/?hl=ja#en/ja/%OutputVar%"
    }
    return

#\:: ; [Win]+[\]
    WinGet, window, ID, A
    InputBox, width, Resize, Width:, , 140, 130
    InputBox, height, Resize, Height:, , 140, 130
    WinMove, ahk_id %window%, , , , width, height
    return
