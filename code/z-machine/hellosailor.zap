GLOBAL::                        ; labels that must be defined
OBJECT::                        ;   even though this simple demo
WORDS::                         ;   doesn't use them
IMPURE::                        ; end of dynamic memory

; minimal dictionary:
VOCAB::
        .BYTE 0                 ; # of breaking punctuation marks
        .BYTE 4                 ; entry length (not that we have any)
        .WORD 0                 ; # of entries
ENDLOD::                        ; end of low memory

        .FUNCT GO               ; Header

START::                         ; entry point
        CALL SAILOR,5 >STACK    ; Call our "Hello, Sailor!" function
        FSTACK                  ; Pop returned value off stack
        CRLF                    ; Final linefeed
        QUIT                    ; Game over, Man!

        .FUNCT SAILOR,N         ; "Hello, Sailor!" function
TOP:    PRINTI "Hello, sailor!" ; Print our magic text
        CRLF                    ; Print newline
        DLESS? 'N,1 \LOOP       ; Jump to LOOP if not done
        RTRUE                   ; Return true
LOOP:   JUMP TOP                ; LOOP

        .END                    ; end of input
