#SingleInstance Force
#Include %A_ScriptDir%
#Include ./lib/eamat/IME.ahk
debug := false ; true / false
global KeyDownTickCount := 0
GroupAdd, CtrlEscape, ahk_exe Code.exe
GroupAdd, CtrlEscape, ahk_exe nvim-qt.exe

;--------------------------------------------------------------------------------
; End of autoexecute section
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------
; End of class creation
;--------------------------------------------------------------------------------
; modfier キーの空打ちで IME の OFF/ON を切り替える
; Original Author:     karakaram   http://www.karakaram.com/alt-ime-on-off

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
#MaxHotkeysPerInterval 350

; 主要なキーを HotKey に設定し、何もせずパススルーする
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
; *~Esc::
*~Tab::
*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
Return

; 上部メニューがアクティブになるのを抑制
; LAlt::Send {Blind){vk07}
; RAlt::Send (Blind){vk07)

*~Esc::StartPressTimeMeasurement()
*~LCtrl::StartPressTimeMeasurement()
*~LShift::StartPressTimeMeasurement()
*~RShift::StartPressTimeMeasurement()

#If WinActive("ahk_group CtrlEscape")
; 左Ctrl で IME OFF & Esc
LCtrl up::IME_SET_WRAP("*~" . StrSplit(A_ThisHotkey, " ")[1], , , "Esc")
#If
Esc up::IME_SET_WRAP("*~" . StrSplit(A_ThisHotkey, " ")[1])
; IME on/off when the shift key pressed alone
LShift up::IME_SET_WRAP("*~" . StrSplit(A_ThisHotkey, " ")[1])
RShift up::IME_SET_WRAP("*~" . StrSplit(A_ThisHotkey, " ")[1], 1)

StartPressTimeMeasurement(){
    if (KeyDownTickCount == 0)
        KeyDownTickCount := A_TickCount
}

IME_SET_WRAP(hotkey, imeState := 0, threshold := 200, key := "") {
    ; 長押しの場合は IME 切り替えを行わない。
    global KeyDownTickCount
    if (A_PriorHotkey != hotkey) {
        KeyDownTickCount := 0
        Return
    }
    Elapsed := A_TickCount - KeyDownTickCount
    if (debug == true ) {
        ToolTip % Elapsed
    }
    if (Elapsed > threshold) {
        KeyDownTickCount := 0
        Return
    }
    IME_SET(imeState)
    if (key != "") {
        SendEvent, {%key%}
    }

    KeyDownTickCount := 0
}

