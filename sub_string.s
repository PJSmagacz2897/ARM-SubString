 .section        .data
 .section        .text
 .global         sub_string
 sub_string:
 
         @ This function performs the sub_string operation on the following arguments:
         
         @ Initial Variable Locations
         @ r0: original string
         @ r1: start index
         @ r2: end index
         @ r3: loop counter/length of output string
         @ Note that the location of these variables changes during runtime
 
 
         push {r4, r14}          @ pushes r4-r14 to stack so that they can be used here
         sub r1, r1, $1          @ r1--; decrements start index to correct location
         sub r3, r2, r1          @ r3 = r2 - r1; initialize loop counter
         add r0, r0, r1          @ r0 += r1; moves pointer to start index
         add r10, r3, $0         @ r10 = r3; r10 is used to store length for later
 
         @ The following four instructions move the variables to other registers
         @ so that malloc can be called without losing the argument values
 
         mov r6, r1              @ r1 -> r6; start index is now in r6
         mov r7, r2              @ r2 -> r7; end index is now in r7
         mov r8, r3              @ r3 -> r8; loop counter is now in r8
         mov r4, r0              @ r0 -> r4; original string is now in r4
 
         add r0, r3, $1          @ r0 = r3 + 1; r0 is now length + 1 for \0
         bl malloc               @ malloc allocates lengt + 1 bytes into r0
 
         loop:                   @ loop for copying bytes; r5 is used as tempory storage
 
         ldrb r5, [r4], $1       @ r5 = r4++; copies byte from r4 into r5 and increments r4
         strb r5, [r0], $0       @ r0 = r5; copies byte into r0 from r5
         add r0, r0, $1          @ r0++; increments the output string pointer
         sub r8, r8, $1          @ r8 = r8 - 1; decrements the loop counter
         cmp r8, $0              @ r8 > 0; sets flag if loop counter is > 0
         bgt loop                @ if (r8 > 0) then loop, else break
 
         strb r9, [r0], $0       @ r0 = '\0'; adds the null terminator to the end of output
         sub r0, r0, r10         @ r0 -= r10; sets pointer to beginning of output string
         pop {r4, r14}           @ pops r4-r14 so that program can continue after return
         bx lr                   @ returns r0 to main.c
 
         mov r0, $0
         bl fflush
         mov r7, $1
         svc $0
 .end
