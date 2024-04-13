# memo

`<ahk_root_dir>/UX/launcher.ahk` の Settings から UTF-8 にしておく

1. [Edit this Scriptのエディタを変更](#edit-this-scriptのエディタを変更)
1. [v1 v2](#v1-v2)
   1. [変化点](#変化点)
   1. [v1 と v2 の共存](#v1-と-v2-の共存)
1. [docs link](#docs-link)
   1. [2 stroke key](#2-stroke-key)
   1. [key list](#key-list)
   1. [send](#send)
   1. [operators](#operators)

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

## v1 v2

### 変化点

基本的に次を参照する。[[参考] v1.1からv2.0への変更｜AutoHotkey v2](https://ahkscript.github.io/ja/docs/v2/v2-changes.htm)

- StringLeft,StringRight は削除
  - [SubStr - 構文と使用法｜AutoHotkey v2](https://ahkscript.github.io/ja/docs/v2/lib/SubStr.htm)

### v1 と v2 の共存

1. v2で v1 スクリプト起動すると v1 のインストールを促されるので、そのままインストールする
   - ahk の root に v1 がインストールされる
1. `<ahk_root_dir>/UX/launcher.ahk` で script version の `Auto Detect` を Enable にする

もし上手くいかない場合は、`#Rquires` ディレクティブを追記して、明示的に v1 スクリプトであることを宣言する。(e.g. `#Requires AutoHotkey v1.1`)

[[参考] v1.1からv2.0への変更｜AutoHotkey v2](https://ahkscript.github.io/ja/docs/v2/v2-changes.htm)

## docs link

### 2 stroke key

https://www.autohotkey.com/docs/v2/lib/InputHook.htm

### key list

[List of Keys (Keyboard, Mouse and Controller) | AutoHotkey v2](https://www.autohotkey.com/docs/v2/KeyList.htm)

### send

[Send / SendRaw / SendEvent / SendInput / SendPlay - AutoHotkey Wiki](https://ahkwiki.net/Send)

### operators

[変数と式 - 定義と使用法｜AutoHotkey v2](https://ahkscript.github.io/ja/docs/v2/Variables.htm#Operators)
