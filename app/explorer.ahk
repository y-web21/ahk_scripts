#Requires AutoHotkey v2.0+
#SingleInstance Force


#HotIf WinActive("ahk_exe explorer.exe")
; LCtrl
; <^i:: SendEvent("!{up}")
; <^h:: SendEvent("!{left}")
; <^l:: SendEvent("!{right}")

; <^j:: SendInput("{down}")
; <^k:: SendInput("{up}")
; <^u:: SendInput("{PgUp}")
; <^d:: SendInput("{PgDn}")
; <^+j:: SendInput("+{down}")
; <^+k:: SendInput("+{up}")
; <^+u:: SendInput("+{PgUp}")
; <^+d:: SendInput("+{PgDn}")

; ; <^i:: SendEvent("^{f}{tab 4}{Down}{Up}") ; conflict with google Japanese IME
; <^o:: SendInput("{Appskey}")
; <^;:: SendInput("^{l}")
; <^<+Enter:: SendInput("{F2}")

; <^r::SendEvent("{AppsKey}")

<^+u:: SendInput("+{PgUp}")

; <^+d::SendTextToAddressBar(EnvGet("UserProfile") . "\downloads")
; <^+d::SendTextToAddressBar(GetPaths.get(GetPaths.folderId.downloads))
<^+d::SendTextToAddressBar(GetPaths.downloads())
<^+m::SendTextToAddressBar(GetPaths.desktop())
<^+o::SendTextToAddressBar(GetPaths.home())

SendTextToAddressBar(address){
    SendEvent("^{l}")
    Sleep(50)
    SendEvent("^{a}{Bs}")
    SendText(address)
}

<^.::SendEvent("^{f}{tab 4}{Down}{Up}")
; 2 stroke keybind
<^,::
{
    SendEvent("!{d}")
    ; SendEvent("^{l}")
    ; ih := InputHook("C L1 T3.5 M", "{Esc}"), ih.Start(), ih.Wait()
    ; if (ih.Input == "m") {
        ; SendEvent("^{f}{tab 4}{Down}{Up}")
    ; }
}
>^g::
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
