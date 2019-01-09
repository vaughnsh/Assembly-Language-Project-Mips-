.globl main
.globl multiply
.globl secondnum
.data

.text

main:

sort:
addi $t2, $0, 32 #same process as in part2
addi $s1, $0, 1 
lui $a0, 0x1000 
add $t0, $0, $0 
counter:  
lbu $s2, 0($a0)
beq $s2, 0x2d, skipminus
add $0, $0 $0
add $t0, $t0, 1
addi $a0, $a0, 1
bne $s2, $0, counter
add $0,$0,$0
sub $t0, $t0, $s1
sub $t0, $t0, $s1

lui $a0, 0x1000


stoi:
lbu $s2, 0($a0)
beq $s2, 0x2d, signedskip
add $0,$0,$0
addi $t7, $0, 10
add $s3, $t0, $0 
andi $s2, $s2, 0x0f
beq $t0, $0, endnum
add $0,$0,$0
bne $t0, $s1, power
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t7, $0, $0
add $t5, $0, $s2
addi $t6, $0, 10
addi $t2, $0, 32
jal multiply
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
add $s0, $s0, $t7
add $a0, $a0, 1
sub $t0, $t0,$s1
j stoi
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

power: 
addi $t2, $0, 32
addi $t5, $0, 10
add $t6, $t7, $0
add $t7, $0, $0
jal multiply 
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
sub $s3, $s3, $s1
bne $s3, $s1, power
add $0,$0,$0
add $t5, $s2, $0
add $t6, $t7, $0
add $t7, $0, $0
addi $t2, $0, 32
jal multiply
add $0, $0, $0
add $0,$0,$0
add $0,$0,$0
add $s0, $s0, $t7
addi $a0, $a0, 1
sub $t0, $t0, $s1
j stoi
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

endnum:
add $s0, $s0, $s2
beq $s4, 0x2d, twoscomp
j secondnum
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

skipminus:
add $a0, $a0, 1
j counter
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
signedskip:
add $s4, $s2, $0
add $a0, $a0, 1
j stoi 
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


twoscomp: 
nor $s0, $s0, $s0
add $s0, $s0, 1
j secondnum
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0



secondnum:       #same processes as part2
add $s4, $0, $0
addi $t2, $0, 32 
addi $s1, $0, 1 
lui $a0, 0x1000 
ori $a0, 0x0008
add $t0, $0, $0 
counter2:  
lbu $s2, 0($a0)
beq $s2, 0x2d, skipminus2
add $0, $0 $0
add $t0, $t0, 1
addi $a0, $a0, 1
bne $s2, $0, counter2
add $0,$0,$0
sub $t0, $t0, $s1
sub $t0, $t0, $s1

lui $a0, 0x1000
ori $a0, 0x0008

stoi2:
lbu $s2, 0($a0)
beq $s2, 0x2d, signedskip2
add $0,$0,$0
addi $t7, $0, 10
add $s3, $t0, $0 
andi $s2, $s2, 0x0f
beq $t0, $0, endnum2
add $0,$0,$0
bne $t0, $s1, power2
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t7, $0, $0
add $t5, $0, $s2
addi $t6, $0, 10
addi $t2, $0, 32
jal multiply
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
add $s5, $s5, $t7
add $a0, $a0, 1
sub $t0, $t0,$s1
j stoi2
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

power2: 
addi $t2, $0, 32
addi $t5, $0, 10
add $t6, $t7, $0
add $t7, $0, $0
jal multiply 
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
sub $s3, $s3, $s1
bne $s3, $s1, power2
add $0,$0,$0
add $t5, $s2, $0
add $t6, $t7, $0
add $t7, $0, $0
addi $t2, $0, 32
jal multiply
add $0, $0, $0
add $0,$0,$0
add $0,$0,$0
add $s5, $s5, $t7
addi $a0, $a0, 1
sub $t0, $t0, $s1
j stoi2
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

endnum2:
add $s5, $s5, $s2
beq $s4, 0x2d, twoscomp2
j thirdnum
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

skipminus2:
add $a0, $a0, 1
j counter2
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
signedskip2:
add $s4, $s2, $0
add $a0, $a0, 1
j stoi2 
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


twoscomp2: 
nor $s5, $s5, $s5
add $s5, $s5, 1
j thirdnum
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


thirdnum:  #same process as part2
add $s4, $0, $0
addi $t2, $0, 32 
addi $s1, $0, 1 
lui $a0, 0x1000 
ori $a0, 0x00010
add $t0, $0, $0 
counter3:  
lbu $s2, 0($a0)
beq $s2, 0x2d, skipminus3
add $0, $0 $0
add $t0, $t0, 1
addi $a0, $a0, 1
bne $s2, $0, counter3
add $0,$0,$0
sub $t0, $t0, $s1
sub $t0, $t0, $s1

lui $a0, 0x1000
ori $a0, 0x00010

stoi3:
lbu $s2, 0($a0)
beq $s2, 0x2d, signedskip3
add $0,$0,$0
addi $t7, $0, 10
add $s3, $t0, $0 
andi $s2, $s2, 0x0f
beq $t0, $0, endnum3
add $0,$0,$0
bne $t0, $s1, power3
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t7, $0, $0
add $t5, $0, $s2
addi $t6, $0, 10
addi $t2, $0, 32
jal multiply
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
add $s6, $s6, $t7
add $a0, $a0, 1
sub $t0, $t0,$s1
j stoi3
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

power3: 
addi $t2, $0, 32
addi $t5, $0, 10
add $t6, $t7, $0
add $t7, $0, $0
jal multiply 
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
sub $s3, $s3, $s1
bne $s3, $s1, power3
add $0,$0,$0
add $t5, $s2, $0
add $t6, $t7, $0
add $t7, $0, $0
addi $t2, $0, 32
jal multiply
add $0, $0, $0
add $0,$0,$0
add $0,$0,$0
add $s6, $s6, $t7
addi $a0, $a0, 1
sub $t0, $t0, $s1
j stoi3
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

endnum3:
add $s6, $s6, $s2
beq $s4, 0x2d, twoscomp3
j fourthnum 
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

skipminus3:
add $a0, $a0, 1
j counter3
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
signedskip3:
add $s4, $s2, $0
add $a0, $a0, 1
j stoi3
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


twoscomp3: 
nor $s6, $s6, $s6
add $s6, $s6, 1
j fourthnum
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0




fourthnum:    #same process as part2
add $s4, $0, $0
addi $t2, $0, 32 
addi $s1, $0, 1 
lui $a0, 0x1000 
ori $a0, 0x00018
add $t0, $0, $0 
counter4:  
lbu $s2, 0($a0)
beq $s2, 0x2d, skipminus4
add $0, $0 $0
add $t0, $t0, 1
addi $a0, $a0, 1
bne $s2, $0, counter4
add $0,$0,$0
sub $t0, $t0, $s1
sub $t0, $t0, $s1

lui $a0, 0x1000
ori $a0, 0x00018

stoi4:
lbu $s2, 0($a0)
beq $s2, 0x2d, signedskip4
add $0,$0,$0
addi $t7, $0, 10
add $s3, $t0, $0 
andi $s2, $s2, 0x0f
beq $t0, $0, endnum4
add $0,$0,$0
bne $t0, $s1, power4
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t7, $0, $0
add $t5, $0, $s2
addi $t6, $0, 10
addi $t2, $0, 32
jal multiply
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
add $s7, $s7, $t7
add $a0, $a0, 1
sub $t0, $t0,$s1
j stoi4
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

power4: 
addi $t2, $0, 32
addi $t5, $0, 10
add $t6, $t7, $0
add $t7, $0, $0
jal multiply 
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
sub $s3, $s3, $s1
bne $s3, $s1, power4
add $0,$0,$0
add $t5, $s2, $0
add $t6, $t7, $0
add $t7, $0, $0
addi $t2, $0, 32
jal multiply
add $0, $0, $0
add $0,$0,$0
add $0,$0,$0
add $s7, $s7, $t7
addi $a0, $a0, 1
sub $t0, $t0, $s1
j stoi4
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

endnum4:
add $s7, $s7, $s2
beq $s4, 0x2d, twoscomp4
j fifthnum 
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

skipminus4:
add $a0, $a0, 1
j counter4
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
signedskip4:
add $s4, $s2, $0
add $a0, $a0, 1
j stoi4
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


twoscomp4: 
nor $s7, $s7, $s7
add $s7, $s7, 1
j fifthnum 
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


fifthnum:       #same process as part2
add $s4, $0, $0
addi $t2, $0, 32 
addi $s1, $0, 1 
lui $a0, 0x1000 
ori $a0, 0x00020
add $t0, $0, $0 
counter5:  
lbu $s2, 0($a0)
beq $s2, 0x2d, skipminus5
add $0, $0 $0
add $t0, $t0, 1
addi $a0, $a0, 1
bne $s2, $0, counter5
add $0,$0,$0
sub $t0, $t0, $s1
sub $t0, $t0, $s1

lui $a0, 0x1000
ori $a0, 0x00020

stoi5:
lbu $s2, 0($a0)
beq $s2, 0x2d, signedskip5
add $0,$0,$0
addi $t7, $0, 10
add $s3, $t0, $0 #save value of t0 for power function
andi $s2, $s2, 0x0f
beq $t0, $0, endnum5
add $0,$0,$0
bne $t0, $s1, power5
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t7, $0, $0
add $t5, $0, $s2
addi $t6, $0, 10
addi $t2, $0, 32
jal multiply
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
add $a3, $a3, $t7
add $a0, $a0, 1
sub $t0, $t0,$s1
j stoi5
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

power5: 
addi $t2, $0, 32
addi $t5, $0, 10
add $t6, $t7, $0
add $t7, $0, $0
jal multiply 
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
sub $s3, $s3, $s1
bne $s3, $s1, power5
add $0,$0,$0
add $t5, $s2, $0
add $t6, $t7, $0
add $t7, $0, $0
addi $t2, $0, 32
jal multiply
add $0, $0, $0
add $0,$0,$0
add $0,$0,$0
add $a3, $a3, $t7
addi $a0, $a0, 1
sub $t0, $t0, $s1
j stoi5
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

endnum5:
add $a3, $a3, $s2
beq $s4, 0x2d, twoscomp5
j sortnum 
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

skipminus5:
add $a0, $a0, 1
j counter5
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
signedskip5:
add $s4, $s2, $0
add $a0, $a0, 1
j stoi5
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


twoscomp5: 
nor $a3, $a3, $a3
add $a3 $a3, 1
j sortnum
add $t5, $0, $0
add $0, $0, $0
add $0, $0, $0

sortnum:     #sort all 5 numbers by swapping every 2 registers if the first is less than the second 6 times for safety
slt $t4, $s0, $s5
add $t0, $s0, $0
add $t1, $s5, $0
beq $t4, 0, nextnum2
add $0, $0, $0
jal swap
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $s0, $t0, $0
add $s5, $t1, $0

nextnum2:
slt $t4, $s5, $s6
add $t0, $s5, $0
add $t1, $s6, $0
beq $t4, 0, nextnum3
add $0, $0, $0
jal swap
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $s5, $t0, $0
add $s6, $t1, $0

nextnum3:
slt $t4, $s6, $s7
add $t0, $s6, $0
add $t1, $s7, $0
beq $t4, 0, nextnum4 
add $0, $0, $0
jal swap
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $s6, $t0, $0
add $s7, $t1, $0

nextnum4:
slt $t4, $s7, $a3
add $t0, $s7, $0
add $t1, $a3, $0
addi $t5, $t5, 1
beq $t5, 6, free21
add $0, $0, $0
beq $t4, 0, sortnum
add $0, $0, $0
jal swap
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $s7, $t0, $0
add $a3, $t1, $0
j sortnum
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


swap:       #swap values in registers
add $t3, $t0, $0
add $t0, $t1, $0
add $t1, $t3, $0
jr $ra
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

free21:              #clear numbers from memory
add $t0, $0, $0
lui $a0, 0x1000
add $t4, $0, $0
loop21:
sb $t0, ($a0)
addi $a0, $a0, 1
addi $t4, $t4, 1
slti $t5, $t4, 7
bne $t5, $0, loop21 
add $0,$0,$0
lui $a0, 0x1000
ori $a0, 0x0008
add $t4, $0, $0
loop22:
sb $t0, ($a0)
addi $a0, $a0, 1
addi $t4, $t4, 1
slti $t5, $t4, 7
bne $t5, $0, loop22
add $0,$0,$0
lui $a0, 0x1000
ori $a0, 0x0010
add $t4, $0, $0
loop23:
sb $t0, ($a0)
addi $a0, $a0, 1
addi $t4, $t4, 1
slti $t5, $t4, 7
bne $t5, $0, loop23
add $0,$0,$0
lui $a0, 0x1000
ori $a0, 0x0018
add $t4, $0, $0
loop24:
sb $t0, ($a0)
addi $a0, $a0, 1
addi $t4, $t4, 1
slti $t5, $t4, 7
bne $t5, $0, loop24
add $0,$0,$0
lui $a0, 0x1000
ori $a0, 0x0020
add $t4, $0, $0
loop25:
sb $t0, ($a0)
addi $a0, $a0, 1
addi $t4, $t4, 1
slti $t5, $t4, 7
bne $t5, $0, loop25
add $0,$0,$0

place: #same process as part2
add $s4, $0, $0
add $t2, $0, $0
add $t1, $0, $0
lui $a0, 0x1000
slt $t4, $a3, $0
beq $t4, 0, itos
add $0, $0, $0

makepos: 
nor $a3, $a3, $a3
add $a3, $a3, 1
add $s4, $0, 0x2d

itos:
addi $s2, $0, 10
add $v1, $a3, $0
slt $t0, $v1, $s2 
bne $t0, $0, onedig
add $0, $0, $0
divideby10:
slt $t0, $v1, $s2
bne $t0, $0, convert
add $0, $0,$0
sub $v1, $v1, $s2
addi $t1, $t1, 1
j divideby10
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

convert:
addi $sp, $sp, -4
sw $v1, ($sp)
add $v1, $t1, $0
slt $t0, $t1, $s2
add $t1, $0, $0
addi $t2, $t2, 1
beq $t0, $0, divideby10
add $0, $0, $0
beq $t2, 1, addin
add $0, $0, $0
addi $sp, $sp, -4 
sw $v1, ($sp)
add $t2, $t2, 1
j storeword
add $0, $0, $0

addin:
add $sp, $sp, -4
sw $v1, ($sp)
add $t2, $t2, 1
j storeword
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

storeword:
beq $s4, 0x2d, addminus
add $0, $0, $0
resume:
lb $t3, 0($sp)
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t3, $t3, 0x30
add $sp, $sp, 4
sb $t3, 0($a0)
add $a0, $a0, 1
add $t2, $t2, -1
bne $t2, $0, storeword
add $0, $0,$0
j place2
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

addminus:
sb $s4, ($a0)
add $a0, $a0, 1
add $s4, $0, $0
j resume
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedig:
beq $s4, 0x2d, onedigminus
add $0, $0, $0
add $v1, $v1, 0x30
sb $v1, ($a0)
j place2
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedigminus:
sb $s4, ($a0)
add $a0, $a0, 1
add $s4, $0, $0
j onedig
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


place2:
add $s4, $0, $0
add $t2, $0, $0
add $t1, $0, $0
lui $a0, 0x1000
ori $a0, 0x0008
slt $t4, $s7, $0
beq $t4, 0, itos2
add $0, $0, $0

makepos2: 
nor $s7, $s7, $s7
add $s7, $s7, 1
add $s4, $0, 0x2d

itos2:
addi $s2, $0, 10
add $v1, $s7, $0
slt $t0, $v1, $s2 
bne $t0, $0, onedig2
add $0, $0, $0
divideby102:
slt $t0, $v1, $s2
bne $t0, $0, convert2
add $0, $0,$0
sub $v1, $v1, $s2
addi $t1, $t1, 1
j divideby102
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

convert2:
addi $sp, $sp, -4
sw $v1, ($sp)
add $v1, $t1, $0
slt $t0, $t1, $s2
add $t1, $0, $0
addi $t2, $t2, 1
beq $t0, $0, divideby102
add $0, $0, $0
beq $t2, 1, addin2
add $0, $0, $0
addi $sp, $sp, -4 
sw $v1, ($sp)
add $t2, $t2, 1
j storeword2
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

addin2:
add $sp, $sp, -4
sw $v1, ($sp)
add $t2, $t2, 1
j storeword2
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

storeword2:
beq $s4, 0x2d, addminus2
add $0, $0, $0
resume2:
lb $t3, 0($sp)
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t3, $t3, 0x30
add $sp, $sp, 4
sb $t3, 0($a0)
add $a0, $a0, 1
add $t2, $t2, -1
bne $t2, $0, storeword2
add $0, $0,$0
j place3
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

addminus2:
sb $s4, ($a0)
add $a0, $a0, 1
add $s4, $0, $0
j resume2
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedig2:
beq $s4, 0x2d, onedigminus2
add $0, $0, $0
add $v1, $v1, 0x30
sb $v1, 0($a0)
j place3
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedigminus2:
sb $s4, ($a0)
add $a0, $a0, 1
add $s4, $0, $0
j onedig2
add $0, $0, $0


place3:
add $s4, $0, $0
add $t2, $0, $0
add $t1, $0, $0
lui $a0, 0x1000
ori $a0, 0x0010
slt $t4, $s6, $0
beq $t4, 0, itos3
add $0, $0, $0

makepos3: 
nor $s6, $s6, $s6
add $s6, $s6, 1
add $s4, $0, 0x2d

itos3:
addi $s2, $0, 10
add $v1, $s6, $0
slt $t0, $v1, $s2 
bne $t0, $0, onedig3
add $0, $0, $0
divideby103:
slt $t0, $v1, $s2
bne $t0, $0, convert3
add $0, $0,$0
sub $v1, $v1, $s2
addi $t1, $t1, 1
j divideby103
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

convert3:
addi $sp, $sp, -4
sw $v1, ($sp)
add $v1, $t1, $0
slt $t0, $t1, $s2
add $t1, $0, $0
addi $t2, $t2, 1
beq $t0, $0, divideby103
add $0, $0, $0
beq $t2, 1, addin3
add $0, $0, $0
addi $sp, $sp, -4 
sw $v1, ($sp)
add $t2, $t2, 1
j storeword3
add $0, $0, $0

addin3:
add $sp, $sp, -4
sw $v1, ($sp)
add $t2, $t2, 1
j storeword3
add $0, $0, $0

storeword3:
beq $s4, 0x2d, addminus3
resume3:
lb $t3, 0($sp)
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t3, $t3, 0x30
add $sp, $sp, 4
sb $t3, 0($a0)
add $a0, $a0, 1
add $t2, $t2, -1
bne $t2, $0, storeword3
add $0, $0,$0
j place4
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

addminus3:
sb $s4, ($a0)
add $a0, $a0, 1
add $s4, $0, $0
j resume3
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedig3:
beq $s4, 0x2d, onedigminus3
add $0, $0, $0
add $v1, $v1, 0x30
sb $v1, ($a0)
j place4
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedigminus3:
sb $s4, ($a0)
add $a0, $a0, 1
add $s4, $0, $0
j onedig3
add $0, $0, $0

place4:
add $s4, $0, $0
add $t2, $0, $0
add $t1, $0, $0
lui $a0, 0x1000
ori $a0, 0x0018
slt $t4, $s5, $0
beq $t4, 0, itos4
add $0, $0, $0

makepos4: 
nor $s5, $s5, $s5
add $s5, $s5, 1
add $s4, $0, 0x2d

itos4:
addi $s2, $0, 10
add $v1, $s5, $0
slt $t0, $v1, $s2 
bne $t0, $0, onedig4
add $0, $0, $0
divideby104:
slt $t0, $v1, $s2
bne $t0, $0, convert4
add $0, $0,$0
sub $v1, $v1, $s2
addi $t1, $t1, 1
j divideby104
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

convert4:
addi $sp, $sp, -4
sw $v1, ($sp)
add $v1, $t1, $0
slt $t0, $t1, $s2
add $t1, $0, $0
addi $t2, $t2, 1
beq $t0, $0, divideby104
add $0, $0, $0
beq $t2, 1, addin4
add $0, $0, $0
addi $sp, $sp, -4 
sw $v1, ($sp)
add $t2, $t2, 1
j storeword4
add $0, $0, $0

addin4:
add $sp, $sp, -4
sw $v1, ($sp)
add $t2, $t2, 1
j storeword4
add $0, $0, $0

storeword4:
beq $s4, 0x2d, addminus4
add $0, $0, $0
resume4:
lb $t3, 0($sp)
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t3, $t3, 0x30
add $sp, $sp, 4
sb $t3, 0($a0)
add $a0, $a0, 1
add $t2, $t2, -1
bne $t2, $0, storeword4
add $0, $0,$0
j place5
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

addminus4:
sb $s4, ($a0)
add $a0, $a0, 1
add $s4, $0, $0
j resume4
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedig4:
beq $s4, 0x2d, onedigminus4
add $0, $0, $0
add $v1, $v1, 0x30
sb $v1, ($a0)
j place5
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedigminus4:
sb $s4, ($a0)
add $a0, $a0, 1
add $s4, $0, $0
j onedig4
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

place5:
add $s4, $0, $0
add $t2, $0, $0
add $t1, $0, $0
lui $a0, 0x1000
ori $a0, 0x0020
slt $t4, $s5, $0
beq $t4, 0, itos5
add $0, $0, $0

makepos5: 
nor $s0, $s0, $s0
add $s0, $s0, 1
add $s4, $0, 0x2d

itos5:
addi $s2, $0, 10
add $v1, $s0, $0
slt $t0, $v1, $s2 
bne $t0, $0, onedig5
add $0, $0, $0
divideby105:
slt $t0, $v1, $s2
bne $t0, $0, convert5
add $0, $0,$0
sub $v1, $v1, $s2
addi $t1, $t1, 1
j divideby105
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

convert5:
addi $sp, $sp, -4
sw $v1, ($sp)
add $v1, $t1, $0
slt $t0, $t1, $s2
add $t1, $0, $0
addi $t2, $t2, 1
beq $t0, $0, divideby105
add $0, $0, $0
beq $t2, 1, addin5
add $0, $0, $0
addi $sp, $sp, -4 
sw $v1, ($sp)
add $t2, $t2, 1
j storeword5
add $0, $0, $0

addin5:
add $sp, $sp, -4
sw $v1, ($sp)
add $t2, $t2, 1
j storeword5
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

storeword5:
beq $s4, 0x2d, addminus5
add $0, $0, $0
resume5:
lb $t3, 0($sp)
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t3, $t3, 0x30
add $sp, $sp, 4
sb $t3, 0($a0)
add $a0, $a0, 1
add $t2, $t2, -1
bne $t2, $0, storeword5
add $0, $0,$0
j done
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

addminus5:
sb $s4, ($a0)
add $a0, $a0, 1
add $s4, $0, $0
j resume5
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedig5:
beq $s4, 0x2d, onedigminus5
add $0, $0, $0
add $v1, $v1, 0x30
sb $v1, ($a0)
j done
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedigminus5:
sb $s4, ($a0)
add $a0, $a0, 1
add $s4, $0, $0
j onedig5
add $0, $0, $0



multiply:
andi $t4, $t5, 1  #get lsb
beq $t2, $0, jump
add $0, $0, $0
beq $t4, $0, next #if 0 go to next
add $0, $0, $0
add $t7, $t7, $t6 #add multiplicand and product
sll $t6, $t6, 1 #shift multiplicand
srl $t5, $t5, 1 #shift multiplier
sub $t2, $t2, $s1 
bne $t2, 0, multiply
jump:
add $0, $0, $0
jr $ra 
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
next: 
sub $t2, $t2, $s1
sll $t6, $t6, 1
srl $t5, $t5, 1
bne $t2, 0, multiply
add $0, $0, $0
jr $ra 
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

done:     #end code 
add $v0, $0, 10
syscall