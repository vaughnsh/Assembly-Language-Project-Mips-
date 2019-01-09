.globl main
.globl multiply
.globl secondnum
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

average:
addi $t2, $0, 32 #save counter for multiplication function
addi $s1, $0, 1 # save for subtraction
lui $a0, 0x1000 #first number
add $t0, $0, $0 # counter for powers of 10
counter:  # count up powers of 10
lbu $s2, 0($a0)
beq $s2, 0x2d, skipminus
add $0, $0 $0
add $t0, $t0, 1
addi $a0, $a0, 1
bne $s2, $0, counter
add $0,$0,$0
sub $t0, $t0, $s1  #subtract 2 to get real power
sub $t0, $t0, $s1

lui $a0, 0x1000


stoi:
lbu $s2, 0($a0)  #load first byte into s2
beq $s2, 0x2d, signedskip    #check to see if its a negative number
add $0,$0,$0
addi $t7, $0, 10
add $s3, $t0, $0 #save value of t0 for power function
andi $s2, $s2, 0x0f      #mask with 0x0f for integer
beq $t0, $0, endnum        #if count 0 go to endnum
add $0,$0,$0
bne $t0, $s1, power          # if t0 doesnt equal 1 go to power function
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t7, $0, $0
add $t5, $0, $s2                  #multiply 10 * single digit number in 10s place
addi $t6, $0, 10
addi $t2, $0, 32
jal multiply
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
add $s5, $s5, $t7                  #add product to desired integer
add $a0, $a0, 1
sub $t0, $t0,$s1
j stoi                   #go back to stoi
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

power:           #calculate the power of 10 0f the position
addi $t2, $0, 32    #set parameters for multiplication of powers
addi $t5, $0, 10
add $t6, $t7, $0
add $t7, $0, $0
jal multiply 
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0
sub $s3, $s3, $s1
bne $s3, $s1, power
add $0,$0,$0            #multiply digit by power of 10 previously calculated
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
j stoi                #go back to stoi for next integer in next 10s place
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

endnum:              #add last digit to integer
add $s5, $s5, $s2
beq $s4, 0x2d, twoscomp      #if negative go to twos comp
j secondnum #go to second number
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

skipminus:
add $a0, $a0, 1      #skip over minus for count
j counter
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
signedskip:            #skip minus for loaded value in s2
add $s4, $s2, $0
add $a0, $a0, 1
j stoi          #go back to stoi
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


twoscomp:                    #find twos complement if negative number
nor $s5, $s5, $s5
add $s5, $s5, 1
j secondnum                   # go to second number
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0



secondnum:                    #same process as first number
add $s4, $0, $0
addi $t2, $0, 32 
addi $s1, $0, 1 
lui $a1, 0x1000 
ori $a1, 0x0008
add $t0, $0, $0 
counter2:  
lbu $s2, 0($a1)
beq $s2, 0x2d, skipminus2
add $0, $0 $0
add $t0, $t0, 1
addi $a1, $a1, 1
bne $s2, $0, counter2
add $0,$0,$0
sub $t0, $t0, $s1
sub $t0, $t0, $s1

lui $a1, 0x1000
ori $a1, 0x0008

stoi2:
lbu $s2, 0($a1)
beq $s2, 0x2d, signedskip2
add $0,$0,$0
addi $t7, $0, 10
add $s3, $t0, $0 #save value of t0 for power function
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
add $s6, $s6, $t7
add $a1, $a1, 1
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
add $s6, $s6, $t7
addi $a1, $a1, 1
sub $t0, $t0, $s1
j stoi2
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

endnum2:
add $s6, $s6, $s2
beq $s4, 0x2d, twoscomp2
j thirdnum
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

skipminus2:
add $a1, $a1, 1
j counter2
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
signedskip2:
add $s4, $s2, $0
add $a1, $a1, 1
j stoi2 
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


twoscomp2: 
nor $s6, $s6, $s6
add $s6, $s6, 1
j thirdnum
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


thirdnum:              #same process as first number
add $s4, $0, $0
addi $t2, $0, 32 
addi $s1, $0, 1 
lui $a2, 0x1000 
ori $a2, 0x00010
add $t0, $0, $0 
counter3:  
lbu $s2, 0($a2)
beq $s2, 0x2d, skipminus3
add $0, $0 $0
add $t0, $t0, 1
addi $a2, $a2, 1
bne $s2, $0, counter3
add $0,$0,$0
sub $t0, $t0, $s1
sub $t0, $t0, $s1

lui $a2, 0x1000
ori $a2, 0x00010

stoi3:
lbu $s2, 0($a2)
beq $s2, 0x2d, signedskip3
add $0,$0,$0
addi $t7, $0, 10
add $s3, $t0, $0 #save value of t0 for power function
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
add $s7, $s7, $t7
add $a2, $a2, 1
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
add $s7, $s7, $t7
addi $a2, $a2, 1
sub $t0, $t0, $s1
j stoi3
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

endnum3:
add $s7, $s7, $s2
beq $s4, 0x2d, twoscomp3
j numaverage 
add $0,$0,$0
add $0,$0,$0
add $0,$0,$0

skipminus3:
add $a2, $a2, 1
j counter3
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
signedskip3:
add $s4, $s2, $0
add $a2, $a2, 1
j stoi3
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


twoscomp3: 
nor $s7, $s7, $s7
add $s7, $s7, 1
j numaverage 
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0


numaverage:   #take average
lui $a3, 0x1000           #address where average is stored as string
ori $a3, 0x0018
add $v0, $s5, $s6
add $v0, $v0, $s7
addi $s3, $0, 3  # saved 3
addi $s4, $0, -3 #saved -3
add $t1, $0, $0 #counter
slti $t0, $v0, 0
beq $t0, 1, signeddiv3     #go to signed division if negative
divideby3: #divide by 3 by subtraction loop
slt $t0, $v0, $s3
bne $t0, $0, itos
add $0, $0,$0
sub $v0, $v0, $s3
addi $t1, $t1, 1
j divideby3
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t2, $0, $0


signeddiv3: #seperate division for signed average add 3 loop
slt $t0, $s4, $v0 
bne $t0, $0, itossigned    #go to itossigned to show its still a signed number
add $0, $0, $0
add $v0, $v0, $s3
add $t1, $t1, 1
j signeddiv3
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

itossigned:
addi $s4, $0, 0x2d

itos:          #integer to string
add $v0, $t1, $0   #store division counter in v0 as average
add $t1, $0, $0
addi $s0, $0, 10
add $v1, $v0, $0 #place average in v1 to manipulate back to string
slt $t0, $v1, $s0 
bne $t0, $0, onedig   #if one digit go to onedig
add $0, $0, $0
divideby10:    #division by 10 to find remainders as single digits
slt $t0, $v1, $s0    
bne $t0, $0, convert   #goes to convert when v1 is less than 10
add $0, $0,$0
sub $v1, $v1, $s0   #subtract 10
addi $t1, $t1, 1   #number resulting from integer divided by 10
j divideby10    #repeat 
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

convert:           #convert each integer to string
addi $sp, $sp, -4     #add remainder to stack
sw $v1, ($sp)
add $v1, $t1, $0      #make previos integer current number to be divided by 10
slt $t0, $t1, $s0      #determine if less than 10
add $t1, $0, $0
addi $t2, $t2, 1       #increment t2 as place counter
beq $t0, $0, divideby10  # if t1 is not less than 10 go back to divide by 10
add $0, $0, $0
beq $t2, 1, addin         #if t2 equals one(10s place) and t1 is less than 10 on the first count skip to addin
add $0, $0, $0
addi $sp, $sp, -4 
sw $v1, ($sp)
add $t2, $t2, 1
j storeword
add $0, $0, $0

addin:                   #add final digit to stack
add $sp, $sp, -4
sw $v1, ($sp)
add $t2, $t2, 1 #increment stack counter

storeword:               #store word at desired spot in memory
beq $s4, 0x2d, addminus   #if negative to to addminus
resume:
lb $t3, 0($sp)           #load from stack to register
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0
add $t3, $t3, 0x30        #add 0x30 for ascii code
add $sp, $sp, 4           #ascend stack
sb $t3, 0($a3)           #store byte from register to memory
add $a3, $a3, 1
add $t2, $t2, -1          #decrease
bne $t2, $0, storeword      #if #t2 doesnt equal 0 go back to store word   
add $0, $0,$0
j done                     #go to done
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

addminus:                 #if negative add minus from $s4
sb $s4, ($a3)
add $a3, $a3, 1
add $s4, $0, $0
j resume                 #resume
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedig:            #if one digit just add to memory
beq $s4, 0x2d, onedigminus
add $0, $0, $0
add $v1, $v1, 0x30
sb $v1, ($a3)
j done
add $0, $0, $0
add $0, $0, $0
add $0, $0, $0

onedigminus:    #if one digit is signed add to memory and increment address
sb $s4, ($a3)
add $a3, $a3, 1
add $s4, $0, $0
j onedig
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

done:     #end code and align pointers $v0 holds value before system is exited
lui $a0, 0x1000
lui $a1, 0x1000
ori $a1, 0x0008
lui $a2, 0x1000
ori $a2, 0x0010
lui $a3, 0x1000
ori $a3, 0x0018
add $v0, $0, 10
syscall