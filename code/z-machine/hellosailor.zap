GLOBAL::                        ; Global vars:
        .GSTR Greeting,"Hello"
        .GSTR Name,"Sailor"
OBJECT::                        ; Objects
IMPURE::                        ; end of dynamic memory

; Minimal dictionary:
VOCAB:: 
        .BYTE 0
        .BYTE 4
        .WORD 0
WORDS::                         ; Abbreviation table
ENDLOD::                        ; end of low memory


        .FUNCT GO               ; Header
        
START::                         ; entry point
; Call our Greeting function:
        CALL GREET,5,Greeting,Name >STACK
        FSTACK                  ; Pop returned value off stack
        CRLF                    ; Final linefeed
        QUIT                    ; Game over, Man!


        .FUNCT GREET,N,G,S      ; Function
TOP:    PRINT G
        PRINTI ", "
        PRINT S
        PRINTI "!"
        CRLF                    ; Print newline
        DLESS? 'N,1 \LOOP       ; Jump to LOOP if not done
        RTRUE                   ; Return true
LOOP:   JUMP TOP                ; LOOP

        .END                    ; end of input
