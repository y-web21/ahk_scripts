# memo

## Edit this Scriptのエディタを変更

[AutoHotKey/Edit this Scriptのエディタを変更 - yanor.net/wiki](https://yanor.net/wiki/?AutoHotKey/Edit+this+Script%E3%81%AE%E3%82%A8%E3%83%87%E3%82%A3%E3%82%BF%E3%82%92%E5%A4%89%E6%9B%B4)

> レジストリ HKEY_CLASSES_ROOT\AutoHotkeyScript\Shell\Edit\Command の値を変更する。
> 例："C:\Users\taro\App\Vim\gvim.exe" "%1"
> 既定：notepad.exe %1
>  Windows Registry Editor Version 5.00
>  
>  [HKEY_CLASSES_ROOT\AutoHotkeyScript\Shell\Edit\Command]
>  @="\"C:\\Users\\taro\\App\\Vim\\gvim.exe\" \"%1\""
> 参考
> http://www.autohotkey.com/board/topic/23889-how-to-edit-this-script-in-any-editor-other-than/
