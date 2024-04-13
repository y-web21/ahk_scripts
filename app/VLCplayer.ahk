;*************************************************************************************
;VLC player
;#If WinActive("ahk_class QWidget") ;or WinActive("ahk_class VLC video main 047AF268");or ("ahk_class Notepad") ;and (a="enable")
; #If (WinActive("ahk_class Qt5QWindowIcon") or WinActive("ahk_class QWidget") or WinActive("ahk_class VLC video main 000001E9BAEAED40"))
#If WinActive("ahk_exe vlc.exe")
    ;~でLボタンを殺さないでコンビネーション時も通過させないとドラッグができなくなる
    ~LButton::Return
	;シーク
	RButton & WheelUp::send,!{Left}
	RButton & WheelDown::send,!{Right}
	;速度調整
	LButton & WheelUp::send,`[
	LButton & WheelDown::send,`]
	;動画切り替え
	WheelLeft::
		send,n
		sleep,1000
		Return
	WheelRight::
		send,p
		sleep,1000
		Return
	; XButton2 & WheelUp::send,p
	; XButton2 & WheelDown::send,n

;	RButton & XButton2::send,{space}

	MButton::send,{space}

	XButton1::send,{Media_Prev}
	XButton2::send,{Media_Next}
	; XButton1::send,{Media_Play_Pause}

	F13::
		sleep, 10
		;GetKeyState stWU, WheelUp
		;GetKeyState stWD, WheelDown
		;msgbox ,%stWU%
		if WinActive("ahk_class QWidget") ;and (stWU != U) and (stWD != U)
			send,{space}
		return
#If  ;Without any condition

