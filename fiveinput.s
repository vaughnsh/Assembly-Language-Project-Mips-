.globl main
.data
prompt: .asciiz "Enter a number:"
.text

main:
addi $v0, $zero, 4  #ask user for 1st number
lui $a0, 0x1000   
syscall
lui $a0, 0x1000
ori $a0, 0x0010
addi $a1, $0, 9    #read user input
addi $v0, $0, 8
syscall
addi $v0, $zero, 4  #ask user for 2nd number
lui $a0, 0x1000
syscall
lui $a0, 0x1000
ori $a0, 0x0020
addi $v0, $zero, 8 #read user input
syscall
lui $a0, 0x1000
addi $v0, $zero, 4 #ask user for 3rd number
syscall
lui $a0, 0x1000
ori $a0, 0x0030
addi $v0, $zero,8  #read user input
syscall
lui $a0, 0x1000
addi $v0, $zero,4   #ask user for 4th number
syscall
lui $a0, 0x1000
ori $a0, 0x0040
add $v0, $zero,8    #read user input
syscall
lui $a0, 0x1000
addi $v0, $zero, 4  #ask user for 5th number
syscall
lui $a0, 0x1000
ori $a0, 0x0050
addi $v0, $zero, 8 #read user input
syscall
lui $a0, 0x1000
add $t0, $0, $0
add $t4, $0, $0
free:              #clear prompt string from memory
sb $t0, ($a0)
addi $a0, $a0, 1
addi $t4, $t4, 1
slti $t5, $t4, 16
bne $t5, $0, free 
add $0,$0,$0
lui $s0, 0x1000    #assign registers s0-s4 specified addresses
lui $s1, 0x1000
ori $s1, 0x0008
lui $s2, 0x1000
ori $s2, 0x0010
lui $s3, 0x1000
ori $s3, 0x0018
lui $s4, 0x1000
ori $s4, 0x0020
lui $a0, 0x1000
ori $a0, 0x0010
addi $t2, $t2, 0
read1:				#parse through first number
lbu $t2, 0($a0)         #load first byte to t2
beq $t2, 0x0a , free1 #at the end of word free up its orignal place in memory 
add $0, $0, $0
beq $t2, 0x2d, minus #include minus sign
add $0, $0, $0
slti $t1, $t2, 0x39    # set range to only allow integers in ascii code
addi $t3, $0, 0x2f
slt $t1, $t3, $t2
beq $t1, $0, skip   #if not in range skip character
add $0, $0, $0
minus:
sb $t2, ($s0)       #store byte from t2 to specified address
addi $s0, $s0, 1
add $0, $0, $0
addi $a0, $a0, 1 
add $0, $0, $0
j read1              #jump to next byte
add $0,$0,$0
skip:                #skip character
addi $a0, $a0, 1
j read1              #jump to next byte
add $0, $0, $0

free1:              #clear first number from undesired spot in memory
lui $a0, 0x1000
ori $a0, 0x0010
add $t4, $0, $0
loop1:
sb $t0, ($a0)
addi $a0, $a0, 1
addi $t4, $t4, 1
slti $t5, $t4, 7
bne $t5, $0, loop1 
add $0,$0,$0




second:          #same process for second number
lui $a0, 0x1000
ori $a0, 0x0020
add $t2, $0, $0
read2:
lbu $t2, 0($a0)
beq $t2, 0x0a , free2
add $0, $0, $0
beq $t2, 0x2d, minus2
add $0, $0, $0
slti $t1, $t2, 0x39
addi $t3, $0, 0x2f
slt $t1, $t3, $t2
beq $t1, $0, skip2
add $0, $0, $0
minus2:
sb $t2, ($s1)
addi $s1, $s1, 1
add $0, $0, $0
addi $a0, $a0, 1 
add $0, $0, $0
j read2
add $0,$0,$0
skip2:
addi $a0, $a0, 1
j read2
add $0, $0, $0

free2:
lui $a0, 0x1000
ori $a0, 0x0020
add $t4, $0, $0
loop2:
sb $t0, ($a0)
addi $a0, $a0, 1
addi $t4, $t4, 1
slti $t5, $t4, 7
bne $t5, $0, loop2 
add $0,$0,$0


third:            #same process for third number
lui $a0, 0x1000
ori $a0, 0x0030
add $t2, $0, $0
read3:
lbu $t2, 0($a0)
beq $t2, 0x0a , free3
add $0, $0, $0
beq $t2, 0x2d, minus3
add $0, $0, $0
slti $t1, $t2, 0x39
addi $t3, $0, 0x2f
slt $t1, $t3, $t2
beq $t1, $0, skip3
add $0, $0, $0
minus3:
sb $t2, ($s2)
addi $s2, $s2, 1
add $0, $0, $0
addi $a0, $a0, 1 
add $0, $0, $0
j read3
add $0,$0,$0
skip3:
addi $a0, $a0, 1
j read3
add $0, $0, $0

free3:
lui $a0, 0x1000
ori $a0, 0x0030
add $t4, $0, $0
loop3:
sb $t0, ($a0)
addi $a0, $a0, 1
addi $t4, $t4, 1
slti $t5, $t4, 7
bne $t5, $0, loop3
add $0,$0,$0


fourth:             #same process for fourth number
lui $a0, 0x1000
ori $a0, 0x0040
add $t2, $0, $0
read4:
lbu $t2, 0($a0)
beq $t2, 0x0a , free4
add $0, $0, $0
beq $t2, 0x2d, minus4
add $0, $0, $0
slti $t1, $t2, 0x39
addi $t3, $0, 0x2f
slt $t1, $t3, $t2
beq $t1, $0, skip4
add $0, $0, $0
minus4:
sb $t2, ($s3)
addi $s3, $s3, 1
add $0, $0, $0
addi $a0, $a0, 1 
add $0, $0, $0
j read4
add $0,$0,$0
skip4:
addi $a0, $a0, 1
j read4
add $0, $0, $0


free4:
lui $a0, 0x1000
ori $a0, 0x0040
add $t4, $0, $0
loop4:
sb $t0, ($a0)
addi $a0, $a0, 1
addi $t4, $t4, 1
slti $t5, $t4, 7
bne $t5, $0, loop4
add $0,$0,$0



fifth:        #same process for fifth number
lui $a0, 0x1000
ori $a0, 0x0050
add $t2, $0, $0
read5:
lbu $t2, 0($a0)
beq $t2, 0x0a , free5
add $0, $0, $0
beq $t2, 0x2d, minus5
add $0, $0, $0
slti $t1, $t2, 0x39
addi $t3, $0, 0x2f
slt $t1, $t3, $t2
beq $t1, $0, skip5
add $0, $0, $0
minus5:
sb $t2, ($s4)
addi $s4, $s4, 1
add $0, $0, $0
addi $a0, $a0, 1 
add $0, $0, $0
j read5
add $0,$0,$0
skip5:
addi $a0, $a0, 1
j read5
add $0, $0, $0


free5:
lui $a0, 0x1000
ori $a0, 0x0050
add $t4, $0, $0
loop5:
sb $t0, ($a0)
addi $a0, $a0, 1
addi $t4, $t4, 1
slti $t5, $t4, 7
bne $t5, $0, loop5
add $0,$0,$0


done:     #end code
addi $v0, $0, 10
syscall