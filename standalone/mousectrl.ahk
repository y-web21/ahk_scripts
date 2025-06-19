;*************************************************************************************
;左クリックを押しながらホイールスクロールで次を検索／前を検索←?
;■■アプリ個別動作について■■
;・./appに記載有り
;   vlc.ahk
;・その他は本ファイル下部に記載

;■■CAUTION!!!■■
;     Lbutton & WheelUp::shiftalttab
;     Lbutton & WheelDown::alttab
;     Lbutton & MButton::alttabandmenu
; Alttab系は、#ifで制御不能。
;     ~Rbutton::Return
; これも#ifでは制御できない(?)
;***************************************************************************************
#SingleInstance force
; #Requires AutoHotkey v1
if (A_AhkVersion >= "2.0") {
    MsgBox "This script run only v1"
    exit
}

; ============================================
; == group ==
; ============================================
SetTitleMatchMode 2
GroupAdd, Explorer, ahk_class CabinetWClass
GroupAdd, Explorer, ahk_class #32770
GroupAdd, TextEditor, ahk_class XLMAIN
GroupAdd, TextEditor, ahk_class MozillindowClass
GroupAdd, TextEditor, ahk_class PX_WINDOW_CLASS
GroupAdd, TextEditor, ahk_class Chrome_WidgetWi1 ; chrome app 'text'
GroupAdd, TextEditor, ahk_class Notepad++
GroupAdd, Text, ahk_exe Notepad.exe
GroupAdd, Browser, ahk_class Chrome_WidgetWin_1
GroupAdd, Browser, ahk_exe chrome.exe


#IfWinActive ahk_group Explorer
    ; Explorerでチルトホイールエミュレートが無視される
    ; XButton2 & Wheelup::MouseClick, WheelLeft, , , 3, , ,
    ; XButton2 & Wheeldown::MouseClick, WheelRight, , , 3, ,
    XButton2 & Wheelup:: send {left}
    XButton2 & Wheeldown:: send {right}
    XButton2::send {XButton2} ; BrowserForward
    XButton1::send {XButton1} ; BrowserBack
    XButton1 & LButton::send +{LButton} ; BrowserBack

; =========================== mouse ==================================
/*
enableKensington := false
#If enableKensington = true
;Ctrl+Click
; RButton & Lbutton::
;     send "{ctrl down}"
;     click("left")
;     send "{ctrl up}"
; return
#If
*/
; =========================== apps ==================================
; stirling edit strunt
#IfWinActive ahk_class Afx:400000:8:10003:0:0
    WheelUp:: send {Up}
    WheelDown:: send {Down}

#IfWinActive ahk_class Photoshop
    ;Undo Redo
    XButton1:: send ^!{z}
    XButton2:: send ^+{z}
    ;zoomは挙動が不安定
    ; zoomin
    ; RButton & WheelUp::
    ;         send "{alt down}"
    ;         sleep,10
    ;         MouseClick, WheelUp, , , 2, , ,
    ;         sleep,40
    ;         send "{alt up}"
    ;     return
    ; zoomout
    ; RButton & WheelDown::
    ;         send "{alt down}"
    ;         sleep,10
    ;         MouseClick, WheelDown, , , 2, , ,
    ;         sleep,40
    ;         send "{alt up}"
    ;     return

    ; invert and send many notches
    WheelRight:: MouseClick, WheelLeft, , , 10, , ,
    WheelLeft:: MouseClick, WheelRight, , , 10, , ,
    ; for slimblade
    XButton2 & WheelUp:: MouseClick, WheelRight, , , 10, , ,
    XButton2 & WheelDown:: MouseClick, WheelLeft, , , 10, , ,

#IfWinActive ahk_class XLMAIN
    ; Undo Redo
    XButton1:: send ^{y}
    XButton2:: send ^{z}
    ; excelでチルトホイールエミュレートが無視される
    ; XButton2 & Wheelup::send "{left}"
    ; XButton2 & Wheeldown::send "{right}"
    ; シート移動など(アプリ固有にタブ移動と同等設定)
    ; Lbutton & Wheelup::send "^{pgup}"
    ; Lbutton & Wheeldown::send "^{pgdn}"

#IfWinActive ahk_group TextEditor
    ~RButton:: return
    ; sheet tab change
    RButton & Wheelup:: send ^{pgup}
    RButton & Wheeldown:: send ^{pgdn}

#IfWinActive ahk_group Text
    ~RButton:: return
    ; sheet tab change
    RButton & Wheelup:: send ^+{tab}
    RButton & Wheeldown:: send ^{tab}

; vscode, chrome
#IfWinActive ahk_group Browser
    RButton:: send {RButton}
    RButton & Wheelup:: send ^{pgup}
    RButton & Wheeldown:: send ^{pgdn}
    XButton1 & XButton2:: send ^{w}
    XButton1:: send {XButton1}
    XButton2:: send {XButton2}
#If

;タスクバー上でホイール回転することで音量変更をする
#If MouseIsOver("ahk_class Shell_TrayWnd")
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}

    MouseIsOver(WinTitle) {
        MouseGetPos,,, Win
        Return WinExist(WinTitle . " ahk_id " . Win)
    }
#If
