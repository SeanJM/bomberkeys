#Persistent  ; Keep this script running until the user explicitly exits it.
SetTimer, WatchAxis, 5
return
; Based on http://www.autohotkey.com/docs/misc/RemapJoystick.htm

WatchAxis:
GetKeyState, JoyX, JoyX  ; Get position of X axis.
GetKeyState, JoyY, JoyY  ; Get position of Y axis.
GetKeyState, state, Joy6
KeyLRPrev = %KeyLR%  ; Prev now holds the key that was down before (if any).
KeyUDPrev = %KeyUD%  ; Prev now holds the key that was down before (if any).

if (JoyX > 70)
  KeyLR = Right

if (JoyX < 30)
  KeyLR = Left

if (JoyY > 70)
  KeyUD = Down

if (JoyY < 30)
  KeyUD = Up

if (JoyX > 30) and (JoyX < 70)
    KeyLR =
if (JoyY > 30) and (JoyY < 70)
    KeyUD =

if (KeyLR != %KeyLRPrev%)  ; The correct key is already down (or no key is needed).
    ; Otherwise, release the previous key and press down the new key:
    SetKeyDelay -1  ; Avoid delays between keystrokes.
    if KeyLRPrev   ; There is a previous key to release.
        Send, {%KeyLRPrev% up}  ; Release it.
    if KeyLR   ; There is a key to press down.
        Send, {%KeyLR% down}  ; Press it down.

if (KeyUD != %KeyUDPrev%)
    SetKeyDelay -1  ; Avoid delays between keystrokes.
    if KeyUDPrev   ; There is a previous key to release.
        Send, {%KeyUDPrev% up}  ; Release it.
    if KeyUD   ; There is a key to press down.
        Send, {%KeyUD% down}  ; Press it down.

if state = D
    Send, {q down}
if state != D
    Send, {q up}

return

Joy2::Send k
Joy1::Send l
Joy10::Send {space}
