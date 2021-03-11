  .data
# DATA NEEDED FOR FUNCTION USE
s:  .space  1400
s_n: .word 350
Mp: .space 1400
Mp_n:  .word 350
mult_temp: .space  1400
mult_temp_n: .word 350
sub_temp: .space  1400
sub_temp_n: .word 350
mod_temp: .space  1400
mod_temp_n: .word 350
p:  .word 3

zero: .word 0
zero_n:  .word 1
one:  .word 1
one_n:  .word 1
two:  .word 2
two_n: .word 1

testing:  .asciiz "Testing p = "
found:  .asciiz " found prime Mp = "
found_two:  .asciiz " found prime p = 2\n"
not_prime: .asciiz " Mp not prime\n"
newline:  .asciiz "\n"

# DATA NEEDED FOR OTHER TESTS
# Label names correspond to the test they are used in

is_small_prime_test_str:  .asciiz "Small Prime Tests\n"

compress_test_str:  .asciiz "Compress Tests\n"
compress_test:  .word 3 0 0 0
compress_test_n:  .word 4

shift_right_test_str: .asciiz "Shift Right Testn\n"
shift_right_test: .word 3
  .space 12
shift_right_test_n: .word 1

shift_left_test_str:  .asciiz "Shift Left Test\n"
shift_left_test:  .word 0 0 0 7
shift_left_test_n: .word  4

compare_big_test_str: .asciiz "Comparison Tests\n"
compare_big_test1:  .word 2 4
compare_big_test1_n:  .word 2
compare_big_test2:  .word 0 3
compare_big_test2_n:  .word 2

mult_big_test_str:  .asciiz "Multiply Tests\n"
mult_big_test1: .word 3
  .space  4
mult_big_test1_n: .word 1
mult_big_test2: .word 7
mult_big_test2_n: .word 1
mult_big_test3: .word 0 3
  .space  8
mult_big_test3_n: .word 2
mult_big_test4: .word 2 4
mult_big_test4_n: .word 2
mult_big_test5: .word 0 0 0 0 0 0 0 1
  .space  24
mult_big_test5_n: .word 8
mult_big_test6: .word 0 0 0 0 0 0 9
mult_big_test6_n: .word 7


pow_big_test_str: .asciiz "Power Tests\n"
pow_big_test1:  .word 3
pow_big_test1_n:  .word 1
pow_big_test2:  .word 2 4
pow_big_test2_n:  .word 2

sub_big_test_str: .asciiz "Subtraction Tests\n"
sub_big_test1:  .word 7
sub_big_test1_n:  .word 1
sub_big_test2:  .word 3
sub_big_test2_n:  .word 1
sub_big_test3:  .word 2 4
sub_big_test3_n:  .word 2
sub_big_test4:  .word 2 1
sub_big_test4_n:  .word 2
sub_big_test5:  .word 0 0 0 0 0 0 0 0 0 9
sub_big_test5_n:  .word 10
sub_big_test6:  .word 1 2 3 4 5 6 7
sub_big_test6_n:  .word 7

mod_big_test_str: .asciiz "Modulus Tests\n"
mod_big_test1:  .word 7
mod_big_test1_n:  .word 1
mod_big_test2:  .word 3
  .space 4
mod_big_test2_n:  .word 1
mod_big_test3:  .word 8 4
mod_big_test3_n:  .word 2
mod_big_test4:  .word 2 1
    .space 4
mod_big_test4_n:  .word 2
mod_big_test5:  .word 0 0 0 0 0 0 0 0 0 9
mod_big_test5_n:  .word 10
mod_big_test6:  .word 1 2 3 4 5 6 7
  .space 16
mod_big_test6_n:  .word 7

LLT_test_str: .asciiz "LLT Tests\n"

mersenne_scan_test_str: .asciiz "Mersenne Scan\n"

  .text
main:
  # Test is_small_primt
  la $a0, is_small_prime_test_str
  li $v0, 4
  syscall
  li $a0, 7
  jal is_small_prime
  move $a0, $v0
  li $v0, 1
  syscall
  la $a0, newline
  li $v0, 4
  syscall
  li $a0, 81
  jal is_small_prime
  move $a0, $v0
  li $v0, 1
  syscall
  la $a0, newline
  li $v0, 4
  syscall
  li $a0, 127
  jal is_small_prime
  move $a0, $v0
  li $v0, 1
  syscall
  la $a0, newline
  li $v0, 4
  syscall

  # Test compress
  la $a0, compress_test_str
  li $v0, 4
  syscall
  la $a0, compress_test
  la $a1, compress_test_n
  jal compress
  jal print_big

  # Test shift_right
  la $a0, shift_right_test_str
  li $v0, 4
  syscall
  la $a0, shift_right_test
  la $a1, shift_right_test_n
  jal shift_right
  jal shift_right
  jal shift_right
  jal print_big

  # Test shift_left
  la $a0, shift_left_test_str
  li $v0, 4
  syscall
  la $a0, shift_left_test
  la $a1, shift_left_test_n
  jal shift_left
  jal shift_left
  jal print_big

  # Test compare
  la $a0, compare_big_test_str
  li $v0, 4
  syscall
  la $a0, compare_big_test1
  la $a1, compare_big_test1_n
  la $a2, compare_big_test2
  la $a3, compare_big_test2_n
  jal compare_big
  move $a0, $v0
  li $v0, 1
  syscall
  la $a0, newline
  li $v0, 4
  syscall
  la $a0, compare_big_test2
  la $a1, compare_big_test2_n
  la $a2, compare_big_test1
  la $a3, compare_big_test1_n
  jal compare_big
  move $a0, $v0
  li $v0, 1
  syscall
  la $a0, newline
  li $v0, 4
  syscall
  la $a0, compare_big_test1
  la $a1, compare_big_test1_n
  la $a2, compare_big_test1
  la $a3, compare_big_test1_n
  jal compare_big
  move $a0, $v0
  li $v0, 1
  syscall
  la $a0, newline
  li $v0, 4
  syscall

  # Test mult_big
  la $a0, mult_big_test_str
  li $v0, 4
  syscall
  la $a0, mult_big_test1
  la $a1, mult_big_test1_n
  la $a2, mult_big_test2
  la $a3, mult_big_test2_n
  jal mult_big
  la $a0, mult_big_test1
  la $a1, mult_big_test1_n
  jal print_big
  la $a0, mult_big_test3
  la $a1, mult_big_test3_n
  la $a2, mult_big_test4
  la $a3, mult_big_test4_n
  jal mult_big
  la $a0, mult_big_test3
  la $a1, mult_big_test3_n
  jal print_big
  la $a0, mult_big_test5
  la $a1, mult_big_test5_n
  la $a2, mult_big_test6
  la $a3, mult_big_test6_n
  jal mult_big
  la $a0, mult_big_test5
  la $a1, mult_big_test5_n
  jal print_big

  # Test pow_big
  la $a0, pow_big_test_str
  li $v0, 4
  syscall
  la $a0, pow_big_test1
  la $a1, pow_big_test1_n
  li $a2, 4
  jal pow_big
  la $a0, Mp
  la $a1, Mp_n
  jal print_big
  la $a0, pow_big_test2
  la $a1, pow_big_test2_n
  li $a2, 42
  jal pow_big
  la $a0, Mp
  la $a1, Mp_n
  jal print_big

  # Test sub_big
  la $a0, sub_big_test_str
  li $v0, 4
  syscall
  la $a0, sub_big_test1
  la $a1, sub_big_test1_n
  la $a2, sub_big_test2
  la $a3, sub_big_test2_n
  jal sub_big
  la $a0, sub_big_test1
  la $a1, sub_big_test1_n
  jal print_big
  la $a0, sub_big_test3
  la $a1, sub_big_test3_n
  la $a2, sub_big_test4
  la $a3, sub_big_test4_n
  jal sub_big
  la $a0, sub_big_test3
  la $a1, sub_big_test3_n
  jal print_big
  la $a0, sub_big_test5
  la $a1, sub_big_test5_n
  la $a2, sub_big_test6
  la $a3, sub_big_test6_n
  jal sub_big
  la $a0, sub_big_test5
  la $a1, sub_big_test5_n
  jal print_big

  # Test mod_big
  la $a0, mod_big_test_str
  li $v0, 4
  syscall
  la $a0, mod_big_test1
  la $a1, mod_big_test1_n
  la $a2, mod_big_test2
  la $a3, mod_big_test2_n
  jal mod_big
  la $a0, mod_big_test1
  la $a1, mod_big_test1_n
  jal print_big
  la $a0, mod_big_test3
  la $a1, mod_big_test3_n
  la $a2, mod_big_test4
  la $a3, mod_big_test4_n
  jal mod_big
  la $a0, mod_big_test3
  la $a1, mod_big_test3_n
  jal print_big
  la $a0, mod_big_test5
  la $a1, mod_big_test5_n
  la $a2, mod_big_test6
  la $a3, mod_big_test6_n
  jal mod_big
  la $a0, mod_big_test5
  la $a1, mod_big_test5_n
  jal print_big

  # Test LLT
  la $a0, LLT_test_str
  li $v0, 4
  syscall
  la $t0, p
  li $t1, 11
  sw $t1, ($t0)
  jal LLT
  move $a0, $v0
  li $v0, 1
  syscall
  la $a0, newline
  li $v0, 4
  syscall
  la $t0, p
  li $t1, 61
  sw $t1, ($t0)
  jal LLT
  move $a0, $v0
  li $v0, 1
  syscall
  la $a0, newline
  li $v0, 4
  syscall

  # Test mersenne_scan
  la $a0, mersenne_scan_test_str
  li $v0, 4
  syscall
  jal mersenne_scan

# Checks if small number is prime
# Reads p from $a0.
# output in $v0: 1 if p is prime, 0 if p is not prime.
is_small_prime:
  li $t0, 2 # i
  addi $t1, $a0, -1 # p - 1
  bge $t0, $t1, is_small_prime_yes # Doesn't meet initial loop condition
is_small_prime_loop:
  div $a0, $t0
  mfhi $t2 # $t2 = p % i
  beq $t2, $0, is_small_prime_no # p not prime if p % i == 0
  addi $t0, $t0, 1 # Increment i
  bne $t0, $t1, is_small_prime_loop # if i != p-1, go back to the top of the loop
is_small_prime_yes:
  li $v0, 1 # Return 1
  jr $ra # Jump back to function call
is_small_prime_no:
  li $v0, 0 # Return 0
  jr $ra  # Jump back to function call

# Prints big integer.
# Big integer address at $a0, address of size at $a1.
print_big:
  li $t1, 4
  lw $t2, ($a1) # $t2 = size of integer in digits
  mult $t2, $t1
  mflo $t1 # $t1 = size of integer in bytes
  add $t0, $a0, $t1 # $t0 = Address of big integer digit
  li $t1, 0
  li $v0, 1 # Set $v0 for printing
print_big_loop:
  addi $t0, $t0, -4 # Decrement $t0 to next digit address
  lw $a0, ($t0) # Load digit into $a0
  syscall # Print digit
  addi $t1, $t1, 1 # Increment $t1
  bne $t1, $t2, print_big_loop # If $t1 is not the size of the integer, go to top of loop
  li $v0, 4 # Set $v0 to print string
  la $a0, newline # Load newline address into $a0
  syscall # Print newline
  jr $ra # Jump back to function call

# Remove leading zeros from big integer.
# Big integer address in $a0, address of length in $a1.
compress:
  li $t1, 4
  lw $t2, ($a1) # $t2 = size of integer in digits
  mult $t2, $t1
  mflo $t1 # $t1 = size of integer in bytes
  add $t0, $a0, $t1 # $t0 = Address of big integer digit
compress_loop:
  addi $t0, -4 # Decrement $t0 to next digit address
  lw $t1, ($t0) # Load digit into $t1
  bne $t1, $0, compress_loop_not_zero # If digit is not 0, end loop
  beq $t0, $a0, compress_loop_not_zero # If on last digit, end loop
  addi $t2, -1 # Decrement size of integer
  j compress_loop # Jump to top of loop
compress_loop_not_zero:
  sw $t2, ($a1) # Store updated integer size
  jr $ra # Jump back to function call

# Multiply big integer by 10.
# Big integer address in $a0, address of length in $a1.
shift_right:
  li $t0, 4
  lw $t2, ($a1) # $t2 = size of integer in digits
  mult $t2, $t0
  mflo $t0 # $t0 = size of integer in bytes
  add $t0, $a0, $t0 # $t0 = Address of big integer digit
shift_right_loop:
  addi $t0, $t0, -4 # Decrement $t0 to next digit address
  lw $t1, ($t0) # Load digit into $t1
  sw $t1, 4($t0) # Store digit into higher place value
  bne $t0, $a0, shift_right_loop # If not on last digit yet, go back to top of loop
  sw $0, ($a0) # Place 0 into the first digit
  addi $t2, 1 # Increment the integer size by 1
  sw $t2, ($a1) # Store the updated integer size
  jr $ra # Jump back to function call

# Divide big integer by 10.
# Big integer address in $a0, address of length in $a1.
shift_left:
  move $t0, $a0 # $t0 = Address of big integer digit
  li $t1, 4
  lw $t3, ($a1) # $t3 = size of integer in digits
  mult $t3, $t1
  mflo $t1 # $t1 = size of integer in bytes
  add $t1, $a0, $t1
  addi $t1, -4 # $t1 = Address of last big integer digit
shift_left_loop:
  lw $t2, 4($t0) # Load next digit
  sw $t2, ($t0) # Store next digit at current address
  addi $t0, 4 # Increment $t0 to next digit address
  bne $t0, $t1, shift_left_loop # Until $t0 at last digit address, go back to top of loop
  addi $t3, -1 # Decrease integer size by 1
  sw $t3, ($a1) # Store the updated integer size
  jr $ra # Jump back to function call

# Compare two big integers.
# Big integer 1 address in $a0, address of length in $a1
# Big integer 2 address in $a2, address of length in $a3
# Output in $v0. 1 if Big integer 1 > Big integer 2, 0 if equal, -1 if Big integer 1 < Big integer 2
compare_big:
  lw $t0, ($a1) # $t0 = Length of integer 1
  lw $t1, ($a3) # $t1 = Length of integer 2
  bgt $t0, $t1, compare_big_bigger # If length of integer 1 is greater than length of integer 1, return 1
  blt $t0, $t1, compare_big_smaller # If length of integer 1 is less than length of integer 1, return -1
  li $t2, 4
  mult $t2, $t0
  mflo $t2 # $t0 = Length of integers in bytes
  add $t3, $t2, $a0 # $t3 = Address of big integer 1 digit
  add $t4, $t2, $a2 # $t4 = Address of big integer 2 digit
compare_big_loop:
  addi $t3, -4 # Decrement $t3 to next digit address
  addi $t4, -4 # Decrement $t4 to next digit address
  lw $t5, ($t3) # Load integer 1 digit into $t5
  lw $t6, ($t4) # Load integer 2 digit into $t6
  bgt $t5, $t6, compare_big_bigger # If integer 1 digit > integer 2 digit, return 1
  blt $t5, $t6, compare_big_smaller # If integer 1 digit < integer 2 digit, return -1
  bne $t3, $a0, compare_big_loop # If $t3 not at address of last digit, go to top of loop
  li $v0, 0 # Return 0
  jr $ra # Jump back to function call
compare_big_bigger:
  li $v0, 1 # Return 1
  jr $ra # Jump back to function call
compare_big_smaller:
  li $v0, -1 # Return -1
  jr $ra # Jump back to function call

#Multiply two big integers
# Big integer 1 address in $a0, address of length in $a1
# Big integer 2 address in $a2, address of length in $a3
# Output stored in big integer 1
# Calculation done and stored in mult_temp and mult_temp_n
# mult_temp and mult_temp_n copied into big integer 1
mult_big:
  lw $t0, ($a1) # Big integer 1 length
  lw $t1, ($a3) # Big integer 2 length
  add $t2, $t0, $t1 # Maximum product length
  la $t4, mult_temp_n
  sw $t2, ($t4) # Store maximum product length at mult_temp_n
  la $t3, mult_temp # $t3 = Address of mult_temp digit
  li $t4, 0
mult_big_loop_one:
  sw $0, ($t3) # Initialize all digits in mult_temp to 0
  addi $t3, 4 # Increment $t3 to next digit address
  addi $t4, 1 # Increment counter by 1
  blt $t4, $t2, mult_big_loop_one # If the counter is less than the length of mult_temp, go to top of loop
  li $t2, 0 # i
mult_big_loop_two:
  li $t3, 0 # Carry value
  move $t4, $t2 # j
  add $t5, $t0, $t2 # (length of big integer 1) + i
mult_big_loop_three:
  li $t9, 4
  mult $t2, $t9
  mflo $t6 # 4 * i
  add $t6, $a2, $t6
  lw $t6, ($t6) # ith digit of big integer 2
  sub $t7, $t4, $t2
  mult $t7, $t9
  mflo $t7 # 4 * (j - i)
  add $t7, $t7, $a0
  lw $t7, ($t7) # (j-i)th digit of big integer 1
  mult $t7, $t6
  mflo $t7 # (ith digit of big integer 2) * ((j-i)th digit of big integer 1)
  la $t8, mult_temp
  mult $t4, $t9
  mflo $t9 # 4 * j
  add $t8, $t9, $t8
  lw $t9, ($t8) # jth digit of mult_temp
  add $t7, $t7, $t9 # (ith digit of big integer 2) * ((j-i)th digit of big integer 1) + (jth digit of mult_temp)
  add $t7, $t7, $t3 # $t7 = (ith digit of big integer 2) * ((j-i)th digit of big integer 1) + (jth digit of mult_temp) + (carry value)
  li $t9, 10
  div $t7, $t9
  mfhi $t9 # $t7 % 10
  sw $t9, ($t8) # jth digit of mult_temp = ($t7 % 10)
  mflo $t3 # carry = $t7 / 10
  addi $t4, 1 # Incrememnt j by 1
  blt $t4, $t5, mult_big_loop_three # If j < (length of big integer 1) + i, go to top of loop_three
  bgt $t3, $0, mult_big_if # If carry value > 0, go body of if statement
  b mult_big_endif # Jump to after if statement
mult_big_if:
  addi $t8, 4 # 4 * (j+1)
  lw $t6, ($t8) # (j+1)th digit of mult_temp
  add $t6, $t6, $t3 # $t6 = ((j+1)th digit of mult_temp) + carry value
  li $t7, 10
  div $t6, $t7
  mflo $t3 # carry = $t6 / 10
  mfhi $t9 # $t7 % 10
  sw $t9, ($t8) # (j+1)th digit of mult_temp = ($t7 % 10)
mult_big_endif:
  addi $t2, 1 # Increment i by 1
  blt $t2, $t1, mult_big_loop_two # If i < big integer 2 length, jump back to top of loop_two
  move $s0, $ra # Save return address in $s0
  move $s1, $a0 # Save big integer address in $s0
  move $s2, $a1 # Save big integer length address in $s0
  la $a0, mult_temp
  la $a1, mult_temp_n
  jal compress # Remove leading zeros from mult_temp
  move $a0, $s1 # Move big integer address back into $a0
  move $a1, $s2 # Move big integer length address back into $a1
  la $t0, mult_temp_n
  lw $t0, ($t0)
  sw $t0, ($a1) # Update big integer 1 length
  la $t1, mult_temp # $t1 = Address of mult_temp digit
  move $t2, $a0 # $t2 = Address of big integer 1 digit
  li $t3, 4
  mult $t3, $t0
  mflo $t3
  add $t3, $t3, $t1 # $t3 = Address of last mult_temp digit
mult_big_copy: # Copy contents of mult_temp into big integer 1
  lw $t4, ($t1) # Load digit of mult_temp
  sw $t4, ($t2) # Store digit into big address 1
  addi $t2, 4 # Increment $t2 to next digit
  addi, $t1, 4 # Increment $t1 to next digit
  bne $t1, $t3, mult_big_copy # Until $t1 is not at the last digit of mult_temp, go to the top of copy loop
  jr $s0 # Jump back to function call

# Raise big integer to the power of an integer
# Big integer address in $a0, address of length in $a1. Exponent address in $a2.
# Ouput stored in Mp and Mp_n
pow_big:
  la $t0, Mp_n
  lw $t1, ($a1)
  sw $t1, ($t0) # Store length of big integer at Mp_n
  la $t1, Mp # $t1 = Address of Mp digit
  move $t2, $a0 # $t2 = Address of big integer digit
  li $t3, 4
  lw $t0, ($a1)
  mult $t3, $t0
  mflo $t3 # Length of big integer in bytes
  add $t3, $t3, $t2 # Address of last digit in big integer
pow_big_copy: # Copy big integer to Mp
  lw $t4, ($t2) # Load digit of big integer
  sw $t4, ($t1) # Store digit into Mp
  addi $t2, 4 # Increment $t2 to next digit
  addi $t1, 4 # Increment $t2 to next digit
  blt $t2, $t3, pow_big_copy # If $t2 not at address of last digit of big integer, go to top of copy loop
  li $s3, 1 # i
  move $s4, $a2 # Save exponent in $s4
  move $s5, $ra # Save return address in $s5
  move $a2, $a0
  move $a3, $a1
  la $a0, Mp
  la $a1, Mp_n
pow_big_loop:
  jal mult_big # Multiply Mp and big integer, storing the result in Mp
  addi $s3, 1 # Increment $s3
  bne $s3, $s4, pow_big_loop # Until $s3 is not equal to the exponent, jump to the top of the loop
  jr $s5 # Jump back to function call

# Subtract two big integers
# Big integer 1 address in $a0, address of length in $a1
# Big integer 2 address in $a2, address of length in $a3
# Output stored in big integer 1
# Calculation done and stored in sub_temp and sub_temp_n
# sub_temp and sub_temp_n copied into big integer 1
sub_big:
  lw $t0, ($a1) # a.n c.n
  lw $t1, ($a3) # b.n
  la $t2, sub_temp_n
  sw $t0, ($t2)
  li $t2, 0 # Carry value
  li $t3, 0 # i
sub_big_loop:
  li $t4, 1
  add $t4, $t3, $t4
  li $t5, 4
  mult $t3, $t5
  mflo $t3
  bgt $t4, $t1, sub_big_if_one
  b sub_big_else_one
sub_big_if_one:
  add $t4, $a0, $t3
  lw $t4, ($t4) # cDigit
  b sub_big_endif_one
sub_big_else_one:
  add $t4, $a0, $t3
  add $t5, $a2, $t3
  lw $t4, ($t4)
  lw $t5, ($t5)
  sub $t4, $t4, $t5 # cDigit
sub_big_endif_one:
  add $t4, $t4, $t2
  blt $t4, $0, sub_big_if_two # cDigit < 0
  li $t5, 10
  bge $t4, $t5, sub_big_elsif_two # cDigit >= 10
  b sub_big_else_two
sub_big_if_two:
  addi $t4, 10
  li $t2, -1
  b sub_big_endif_two
sub_big_elsif_two:
  addi $t4, -10
  addi $t2, 1
  b sub_big_endif_two
sub_big_else_two:
  li $t2, 0
sub_big_endif_two:
  la $t5, sub_temp
  add $t5, $t5, $t3
  sw $t4, ($t5)
  li $t5, 4
  div $t3, $t5
  mflo $t3
  addi $t3, 1
  bne $t3, $t0, sub_big_loop
  move $s0, $ra
  move $s1, $a0
  move $s2, $a1
  la $a0, sub_temp
  la $a1, sub_temp_n
  jal compress
  la $t0, sub_temp_n
  lw $t0, ($t0)
  sw $t0, ($s2)
  la $t1, sub_temp
  move $t2, $s1
  li $t3, 4
  mult $t3, $t0
  mflo $t3
  add $t3, $t3, $t1
sub_big_copy:
  lw $t4, ($t1)
  sw $t4, ($t2)
  addi $t2, 4
  addi, $t1, 4
  bne $t1, $t3, sub_big_copy
  jr $s0

# Perform big integer 1 % big integer 2
# Big integer 1 address in $a0, address of length in $a1
# Big integer 2 address in $a2, address of length in $a3
# Output stored in big integer 1
# Calculation done and stored in mod_temp and mod_temp_n
# mod_temp and mod_temp_n copied into big integer 1
mod_big:
  move $s3, $ra
  la $t0, mod_temp_n
  lw $t1, ($a3)
  sw $t1, ($t0)
  la $t1, mod_temp
  move $t2, $a2
  li $t3, 4
  lw $t0, ($a3)
  mult $t3, $t0
  mflo $t3
  add $t3, $t3, $t2
mod_big_copy:
  lw $t4, ($t2)
  sw $t4, ($t1)
  addi $t2, 4
  addi $t1, 4
  blt $t2, $t3, mod_big_copy
mod_big_loop_one:
  jal compare_big
  li $t0, 1
  bne $v0, $t0, mod_big_loop_one_end
  move $s4, $a0
  move $s5, $a1
  move $a0, $a2
  move $a1, $a3
  jal shift_right
  move $a1, $s5
  move $a0, $s4
  b mod_big_loop_one
mod_big_loop_one_end:
  move $s4, $a0
  move $s5, $a1
  move $a0, $a2
  move $a1, $a3
  jal shift_left
mod_big_loop_two:
  la $a2, mod_temp
  la $a3, mod_temp_n
  jal compare_big
  li $t2, -1
  beq $v0, $t2, mod_big_loop_two_end
  move $a2, $a0
  move $a3, $a1
  move $a0, $s4
  move $a1, $s5
mod_big_loop_three:
  jal compare_big
  li $t2, -1
  beq $v0, $t2, mod_big_loop_three_end
  jal sub_big
  move $a0, $s4
  move $a1, $s5
  b mod_big_loop_three
mod_big_loop_three_end:
  move $s4, $a0
  move $s5, $a1
  move $a0, $a2
  move $a1, $a3
  lw $t0, ($a1)
  li $t1, 1
  beq $t0, $t1, mod_big_loop_two_end
  jal shift_left
  b mod_big_loop_two
mod_big_loop_two_end:
  la $t0, mod_temp_n
  lw $t1, ($t0)
  sw $t1, ($a1)
  la $t1, mod_temp
  move $t2, $a0
  li $t3, 4
  lw $t0, ($a1)
  mult $t3, $t0
  mflo $t3
  add $t3, $t3, $t2
mod_big_recopy:
  lw $t4, ($t1)
  sw $t4, ($t2)
  addi $t2, 4
  addi $t1, 4
  blt $t2, $t3, mod_big_recopy
  jr $s3

# Perform the Lucas–Lehmer primality test (LLT) algorithm on integer p
# p read from memory under "p" label
# Output in $v0: 1 if Mp = 2^p - 1 is prime, 0 otherwise
LLT:
  move $s6, $ra
  la $t0, p
  lw $t1, ($t0)
  move $a2, $t1
  la $a0, two
  la $a1, two_n
  jal pow_big
  move $t3, $a2
  la $a0, Mp
  la $a1, Mp_n
  la $a2, one
  la $a3, one_n
  jal sub_big
  la $t0, s
  li $t1, 4
  sw $t1, ($t0)
  la $t1, s_n
  li $t2, 1
  sw $t2, ($t1)
  li $s7, 0
  la $t0, p
  lw $t1, ($t0)
  addi $t1, -2
  sw $t1, ($t0)
LLT_loop:
  la $a0, s
  la $a1, s_n
  la $a2, s
  la $a3, s_n
  jal mult_big
  la $a0, s
  la $a1, s_n
  la $a2, two
  la $a3, two_n
  jal sub_big
  la $a0, s
  la $a1, s_n
  la $a2, Mp
  la $a3, Mp_n
  jal mod_big
  la $t0, p
  lw $t1, ($t0)
  addi $s7, 1
  bne $s7, $t1, LLT_loop
  la $t0, p
  lw $t1, ($t0)
  addi $t1, 2
  sw $t1, ($t0)
  la $a0, s
  la $a1, s_n
  la $a2, zero
  la $a3, zero_n
  jal compare_big
  beq $v0, $0, LLT_prime
  li $v0, 0
  jr $s6
LLT_prime:
  li $v0, 1
  jr $s6

# Scan through from p = 2 to p = 127, checking for prime Mp's along the way
mersenne_scan:
  la $t0, p
  li $t1, 2
  sw $t1, ($t0)
mersenne_scan_loop:
  la $t0, p
  lw $a0, ($t0)
  jal is_small_prime
  li $t0, 1
  bne $v0, $t0, mersenne_scan_update_p
  li $v0, 4
  la $a0, testing
  syscall
  li $v0, 1
  la $t0, p
  lw $a0, ($t0)
  syscall
  lw $t0, ($t0)
  li $t1, 2
  div $t0, $t1
  mfhi $t1
  beq $t1, $0, mersenne_scan_p_is_two
  jal LLT
  beq $v0, $0, mersenne_scan_not_prime
  li $v0, 4
  la $a0, found
  syscall
  la $a0, Mp
  la $a1, Mp_n
  jal print_big
  b mersenne_scan_update_p
mersenne_scan_not_prime:
  li $v0, 4
  la $a0, not_prime
  syscall
  b mersenne_scan_update_p
mersenne_scan_p_is_two:
  li $v0, 4
  la $a0, found_two
  syscall
  b mersenne_scan_update_p
mersenne_scan_update_p:
  la $t0, p
  lw $t1, ($t0)
  addi $t1, 1
  sw $t1, ($t0)
  li $t0, 128
  bne $t1, $t0, mersenne_scan_loop
  li $v0, 10
  syscall
