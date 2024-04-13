#Requires AutoHotkey v2.0+
;*************************************************************************************
;VLC player
#HotIf WinActive("ahk_exe vlc.exe")
;~でLボタンを殺さないでコンビネーション時も通過させないとドラッグができなくなる
~LButton:: {
    Return
}
;シーク
RButton & WheelUp:: Send("!{Left}")
RButton & WheelDown:: Send("!{Right}")
;速度調整
LButton & WheelUp::    Send("`[")
LButton & WheelDown::    Send("`]")
;動画切り替え
WheelLeft::
{
    Send("n")
    Sleep(1000)
    Return
}
WheelRight::
{
    Send("p")
    Sleep(1000)
    Return
}

MButton:: Send("{space}")

XButton1:: Send("{Media_Prev}")
XButton2:: Send("{Media_Next}")
; XButton1::send,{Media_Play_Pause}

F13::
{
    Sleep(10)
    if WinActive("ahk_class QWidget") ;and (stWU != U) and (stWD != U)
        Send("{space}")
    return
}
#HotIf
