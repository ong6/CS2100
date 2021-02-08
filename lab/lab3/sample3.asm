# sample3.asm
       .data 0x10000100
msg:   .asciiz "Hello"
       .text

main:  li $v0, 4
       la $a0, msg
       syscall

       lb $t0, 4($a0)
       addi $t0, $t0, -32
       sb $t0, 4($a0)
       syscall
                          # load 'o' into $t0
                          # change $t0 to ASCII value of 'O'
                          # store $t0 into the memory location of 'o'
                          # perform another syscall
       li $v0, 10
       syscall
