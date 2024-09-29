#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, Force

#InstallKeybdHook

; Remap keys
SC056::LShift
RCTRL::RAlt

; Definícia skratky Ctrl+Shift+E na spustenie Total Commander
^+e::
{
    Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Total Commander\Total Commander 64 bit
}
return

; Definícia skratky Ctrl+Shift+1 na spustenie skriptu UIChanger.py
^+1::
{
    Run, python "C:\Users\MARUSK\Documents\scripty\quick_login\UIChanger.py"
}
return

; Definícia skratky Ctrl+Shift+Q na spustenie skriptu autoLogin.py
^+q::
{
    Run, python "C:\Users\MARUSK\Documents\scripty\quick_login\autoLogin.py"
}
return

; ALT Keypress Implied for all below
!k::Send {UP}        ; k UP          (Cursor up line)
!j::Send {DOWN}      ; k DOWN        (Cursor down line)
!h::Send {LEFT}      ; j LEFT        (Cursor left one character)
!l::Send {RIGHT}     ; l RIGHT       (Cursor right one character)

; CTRL + ALT Keypress Implied for all below
!^h::Send ^{LEFT}    ; h    CTRL + LEFT  (Cursor left per word)
!^l::Send ^{RIGHT}   ; l    CTRL + RIGHT (Cursor right per word)

; SHIFT + ALT Keypress Implied for all below
!+k::Send +{UP}      ; k SHIFT + UP      (Highlight per line)
!+j::Send +{DOWN}    ; k SHIFT + DOWN    (Highlight per line)
!+h::Send +{LEFT}    ; j SHIFT + LEFT    (Highlight per character)
!+l::Send +{RIGHT}   ; l SHIFT + RIGHT   (Highlight per character)

; SHIFT + CTRL + ALT Keypress Implied for all below
!+^k::Send +!{UP}    ; k SHIFT + ALT + UP     (Multiply cursor up)
!+^j::Send +!{DOWN}  ; j SHIFT + ALT + DOWN   (Multiply cursor down) 
!+^h::Send +^{LEFT}  ; h SHIFT + CTRL + LEFT  (Highlight per word)
!+^l::Send +^{RIGHT} ; l SHIFT + CTRL + RIGHT (Hightlight per word)

; CTRL + SHIFT Keypress Implied for all below
+^k::Send +^{UP}
+^j::Send +^{DOWN}


; AutoHotkey skript na prepinanie medzi dvoma rozlozeniami klavesnice pomocou CapsLock

; AutoHotkey skript na prepinanie rozlozenia klavesnice pomocou CapsLock




