#Requires AutoHotkey v2.0+
#SingleInstance Force

#HotIf WinActive("ahk_exe explorer.exe")
; LAlt cursor
<!h:: {
    if (A_PriorHotkey != "^g")
        SendInput("{left}")
}
<!j:: SendInput("{down}")
<!k:: SendInput("{up}")
<!l:: {
    if (A_PriorHotkey != "^g")
        SendInput("{right}")
}

; LCtrl
<^u:: SendEvent("!{up}")
<^h:: SendEvent("!{left}")
<^l:: SendEvent("!{right}")

<^j:: SendInput("{down}")
<^k:: SendInput("{up}")

<^i:: SendEvent("^{f}{tab 4}")
<^o:: SendInput("{Appskey}")
^,:: SendInput("^{l}")
^+Enter:: SendInput("{F2}")

; 2 stroke keybind
^g::
{ ; V1toV2: Added bracket
    CtrlH := chr(8)
    CtrlL := chr(12)
    CtrlU := chr(21)
    ihInputChar := InputHook("L1 T0.8 M", "{Esc}"), ihInputChar.Start(), ihInputChar.Wait()
    InputChar := ihInputChar.Input
    if (InputChar = CtrlU || InputChar = "u") {
        SendEvent("!{up}")
    } else if (InputChar = "h") {
        SendEvent("!{left}")
    } else if (InputChar = "l") {
        SendEvent("!{right}")
    }
    Return
} ; V1toV2: Added bracket in the end
#HotIf
