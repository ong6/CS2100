# arrayCount.asm
  .data 
arrayA: .word 11, 0, 31, 22, 9, 17, 6, 9    # arrayA has 8 values
count:  .word 0                         # dummy value

  .text
main:
    # code to setup the variable mappings
    la $t0, arrayA    # load address of array
    la $s1, count     # load value of count
    lw $t8, 0($s1)

    li $t1, 8         # length of array
    li $t9, 0;        # length of counter

    # code for reading in the user value X
    li   $v0, 5         # read user val
    syscall             # get multiple x
    addi  $t2, $v0, 0   # address of multiple x

    # code for counting multiples of X in arrayA
    addi $t5, $t2, -1         # store mask to check if multiple

loop: 
    bge $t9, $t1, end_loop    # loop till over the size of array
    lw $a0, 0($t0)             # load curr int

    addi $t0, $t0, 4          # increment array to next val   
    addi $t9, $t9, 1          # increment counter to next val 

    # check if multiple of X
    and $t4, $a0, $t5         # applying mask to number in array
    bne $t4, $0, loop         # if not then restart loop
    
    addi $t8, $t8, 1          # increment count for multiple
    sw $t8, 0($s1)            # store val

    j loop

end_loop:
    # code for printing result
    li $v0, 1
    add $a0, $0, $t8
    syscall    

    # code for terminating program
    li  $v0, 10
    syscall

