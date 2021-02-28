# arrayCount.asm
  .data 
arrayA: .word 11, 0, 31, 22, 9, 17, 6, 9    # arrayA has 8 values
count:  .word 0                         # dummy value

  .text
main:

    # code to setup the variable mappings
    la $t0, arrayA    # load address of array
    la $t8, count     # load value of count

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
    ble $t2, $t4, increment   # comapre value multiple x ($t2) and value after ($t4) to see if same
    
    j loop

increment: 
  lw $t3, ($t8) 
  addi $t3, $t3, 1          # increment count for multiple
  sw $t3, ($t8)
  j loop

end_loop:
    # code for printing result
    lw $a0, ($t8)
    li $v0, 1
    syscall    

    # code for terminating program
    li  $v0, 10
    syscall

