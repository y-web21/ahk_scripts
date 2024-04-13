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
; <^i:: SendEvent("!{up}")
<^h:: SendEvent("!{left}")
<^l:: SendEvent("!{right}")

<^j:: SendInput("{down}")
<^k:: SendInput("{up}")
<^u:: SendInput("{PgUp}")
<^d:: SendInput("{PgDn}")
<^+j:: SendInput("+{down}")
<^+k:: SendInput("+{up}")
<^+u:: SendInput("+{PgUp}")
<^+d:: SendInput("+{PgDn}")

<^i:: SendEvent("^{f}{tab 4}{Down}{Up}")
<^o:: SendInput("{Appskey}")
<^;:: SendInput("^{l}")
<^<+Enter:: SendInput("{F2}")

; 2 stroke keybind
<^,::
{
    ToolTip("
    (
        f = Focus main pane
        g = home
        G = end
        H = Go HOME
        l = Focus address bar
        t = Add new tab current location
        u = Go up
        j,k = down,up
    )")
    ih := InputHook("C L1 T3.5 M", "{Esc}"), ih.Start(), ih.Wait()
    if (ih.Input == "f") {
        SendEvent("^{f}{tab 4}{Down}{Up}")
    } else if (ih.Input == "g") {
        SendEvent("{Home}")
    } else if (ih.Input == "G") {
        SendEvent("{End}")
    } else if (ih.Input == "l") {
        SendEvent("^{l}")
    } else if (ih.Input == "t") {
        SendEvent("^{l}")
        Sleep(50)
        SendEvent("^{a}^{c}")
        Sleep(50)
        SendEvent("^{t}")
        Sleep(350)
        SendEvent("^{l}")
        Sleep(50)
        SendEvent("^{v}{Enter}")
        Sleep(550)
        SendEvent("^{f}{tab 4}{Down}{Up}")
    } else if (ih.Input == "H") {
        SendEvent("^{l}")
        Sleep(50)
        SendEvent("^{a}{Bs}")
        SendText(EnvGet("UserProfile"))
    } else if (ih.Input == "u" || ih.Input == "h" || ih.Input == "l" || ih.Input == "o"
        || ih.Input == "j" || ih.Input == "k") {
            while true {
                secondKey := ih.Input
                if (secondKey == "j") {
                    SendInput("{Down}")
                } else if (secondKey == "k") {
                    SendInput("{Up}")
                } else if (secondKey == "u") {
                    SendEvent("!{Up}")
                } else if (secondKey == "h") {
                    SendEvent("!{Left}")
                } else if (secondKey == "l") {
                    SendEvent("!{Right}")
                } else if (secondKey == "o") {
                    SendEvent("{Enter}")
                }
                ToolTip("
                (
                    o = open
                    u = go up
                    h = go previous
                    l = go forward
                    j,k = down,up
                )")
                ih := InputHook("C L1 T3.5 M", "{Esc}"), ih.Start(), ih.Wait()
                if (ih.Input != "u" && ih.Input != "h" && ih.Input != "l" && ih.Input != "o"
                    && ih.Input != "j" && ih.Input != "k")
                    break
            }
    }
    ToolTip("")
    Return
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
