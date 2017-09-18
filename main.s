.section                .data
theString:              .asciz "Enter a string: "
stringToSub:            .space 100
theStartIndex:          .asciz "Enter the start index: "
theEndIndex:            .asciz "Enter the end index: "
startIndex:             .word 1
endIndex:               .word 1
outputString:           .asciz "The substring of the given string is '%s'\n"
stringStorage:          .asciz "%s"
intStorage:             .asciz "%d"
.section                .text
.global                 main
main:

        @ This function calls the sub_string function from sub_string.c, written in ARM assembly.

        @ Data Variables
        @ theString, theStartIndex and theEndIndex are the input prompts
        @ stringToSub stores the original string
        @ startIndex stores the start index
        @ endIndex stores the end index
        @ outputString stores the ouput string
        @ stringStorage is the input format specifier for strings
        @ intStorage is the inpur format specifier for ints


        @ Prints prompt asking for input string and stores input string

        ldr r0, =stringStorage
        ldr r1, =theString
        bl printf
        ldr r0, =stringStorage
        ldr r1, =stringToSub
        bl scanf

        @ Prints prompt asking for start index and stores start index

        ldr r0, =stringStorage
        ldr r1, =theStartIndex
        bl printf
        ldr r0, =intStorage
        ldr r1, =startIndex
        bl scanf

        @ Prints prompt asking for end index and stores end index

        ldr r0, =stringStorage
        ldr r1, =theEndIndex
        bl printf
        ldr r0, =intStorage
        ldr r1, =endIndex
        bl scanf

        @ Calls sub_string

        ldr r0, =stringToSub
        ldr r1, =startIndex
        ldr r1, [r1]
        ldr r2, =endIndex
        ldr r2, [r2]
        bl sub_string

        @ Prints output string

        ldr r0, =outputString
        mov r1, r3
        bl printf

        mov r0, $0
        bl fflush
        mov r7, $1
        svc $0
        .end
