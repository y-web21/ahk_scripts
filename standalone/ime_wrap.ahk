; FATAL!! v2 array is not zero based.
#Requires AutoHotkey >=2.0
#SingleInstance Force
#Include %A_ScriptDir%
#Include ../lib/k-ayaki/IME.ahk
#Include ../module/tooltipex.ahk

te := ToolTipEx("", 2000)
debug := false ; true / false
global KeyDownTickCount := 0
; ウィンドウグループの作成
GroupAdd("CtrlEscape", "ahk_exe Code.exe")
GroupAdd("CtrlEscape", "ahk_exe nvim-qt.exe")

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
A_MaxHotkeysPerInterval := 350
return
;--------------------------------------------------------------------------------
; End of autoexecute section
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------
; End of class creation
;--------------------------------------------------------------------------------
; modifierキーの空打ちでIMEのOFF/ONを切り替える
; Original Author: karakaram http://www.karakaram.com/alt-ime-on-off

; 主要なキーを HotKey に設定し、何もせずスルーする
*~a::Return
*~b::Return
*~c::Return
*~d::Return
*~e::Return
*~f::Return
*~g::Return
*~h::Return
*~i::Return
*~j::Return
*~k::Return
*~l::Return
*~m::Return
*~n::Return
*~o::Return
*~p::Return
*~q::Return
*~r::Return
*~s::Return
*~t::Return
*~u::Return
*~v::Return
*~w::Return
*~x::Return
*~y::Return
*~z::Return
*~1::Return
*~2::Return
*~3::Return
*~4::Return
*~5::Return
*~6::Return
*~7::Return
*~8::Return
*~9::Return
*~0::Return
*~F1::Return
*~F2::Return
*~F3::Return
*~F4::Return
*~F5::Return
*~F6::Return
*~F7::Return
*~F8::Return
*~F9::Return
*~F10::Return
*~F11::Return
*~F12::Return
*~`::Return
*~~::Return
*~!::Return
*~@::Return
*~#::Return
*~$::Return
*~%::Return
*~^::Return
*~&::Return
*~*::Return
*~(::Return
*~)::Return
*~-::Return
*~_::Return
*~=::Return
*~+::Return
*~[::Return
*~{::Return
*~]::Return
*~}::Return
*~\::Return
*~|::Return
*~;::Return
*~'::Return
*~"::Return
*~,::Return
*~<::Return
*~.::Return
*~>::Return
*~/::Return
*~?::Return
; *~Esc::Return
*~Tab::Return
*~Space::Return
*~Left::Return
*~Right::Return
*~Up::Return
*~Down::Return
*~Enter::Return
*~PrintScreen::Return
*~Delete::Return
*~Home::Return
*~End::Return
*~PgUp::Return
*~PgDn::Return

; 上部メニューがアクティブになるのを抑制
; LAlt::Send {Blind){vk07}
; RAlt::Send (Blind){vk07)

*~Esc::StartPressTimeMeasurement()
*~LCtrl::StartPressTimeMeasurement()
*~LShift::StartPressTimeMeasurement()
*~RShift::StartPressTimeMeasurement()

#HotIf WinActive("ahk_group CtrlEscape")
    ; Press Left Ctrl to IME OFF & Esc
    LCtrl up::IME_SET_WRAP("*~" . StrSplit(A_ThisHotkey, " ")[1], , , "Esc")
#HotIf

Esc up::IME_SET_WRAP("*~" . StrSplit(A_ThisHotkey, " ")[1])

; toggle IME
LShift up::IME_TOGGLE("*~" . StrSplit(A_ThisHotkey, " ")[1])
; IME on/off when the shift key pressed alone
; LShift up::IME_SET_WRAP("*~" . StrSplit(A_ThisHotkey, " ")[1])
; RShift up::IME_SET_WRAP("*~" . StrSplit(A_ThisHotkey, " ")[1], 1)

StartPressTimeMeasurement(){
    global KeyDownTickCount
    ; if (KeyDownTickCount == 0)
    KeyDownTickCount := A_TickCount
}

IME_TOGGLE(hotkey, threshold := 300, sendkey_aft_changed := "") {
    IME_SET_WRAP(hotkey, !IME_GET(), threshold, sendkey_aft_changed)
}

IME_SET_WRAP(hotkey, imeState := 0, threshold := 300, sendkey_aft_changed := "") {
    ; 長押しの場合は IME 切り替えを行わない。
    global KeyDownTickCount
    te.clear()
    if (A_PriorHotkey != hotkey) {
        KeyDownTickCount := 0
        if debug == true
            te.show("IME switching has been skipped." hotkey)
        Return
    }
    Elapsed := A_TickCount - KeyDownTickCount
    if (debug == true) {
        ; ToolTip Elapsed
        te.show(A_TickCount - KeyDownTickCount)
    }
    if (Elapsed > threshold) {
        KeyDownTickCount := 0
        if debug == true
            te.append("IME switching has been skipped." "  Elapsed >"  Elapsed "   threshold>" threshold)
        Return
    }
    IME_SET(imeState)
    if (sendkey_aft_changed != "") {
        SendEvent "{%sendkey_aft_changed%}"
    }

    KeyDownTickCount := 0
}


