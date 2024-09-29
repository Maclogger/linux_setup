; Snapping window to the left or right
#l::Send, #{Right}  ; WIN+L to snap window to the right
#h::Send, #{Left}  ; WIN+H to snap window to the left

; Adjusting snapped window to quadrants
#k::Send, #{Up}    ; WIN+K to move snapped window to upper quadrant
#j::Send, #{Down}  ; WIN+J to move snapped window to lower quadrant

; Switching virtual desktops using WIN+Ctrl+Arrow and then performing a quick Alt+Tab to ensure focus on an application
^#l::
Send, ^#{Right}  ; WIN+Ctrl+L to switch to the next virtual desktop
Sleep, 100  ; Wait a moment for the desktop switch to occur
return

^#h::
Send, ^#{Left}  ; WIN+Ctrl+H to switch to the previous virtual desktop
Sleep, 100  ; Wait a moment for the desktop switch to occur
return

; Switching virtual desktops using WIN+Shift+Arrow - Note: This might not work by default in Windows. It's set up here in case you have a custom setup that allows for this.
+#l::Send, +#{Right}  ; WIN+Shift+L to potentially move the current window to the next virtual desktop (custom setup required)
+#h::Send, +#{Left}  ; WIN+Shift+H to potentially move the current window to the previous virtual desktop (custom setup required)
