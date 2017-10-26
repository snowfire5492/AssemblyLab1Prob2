########################################################################
# Student: Eric Schenck						Date: 10/26/17
# Description: LabOneProblem2.asm - A program to read integers 4, -4,
#		64679, and -64679, and loads them into registers $s0 through $s3, 
#		and without changing the values in registers: print each integer to 
#	    console, add $s2 and $s3 and print result, perform logical "OR" on
#		constant 4 and $s3 and print result, and finally shift $s3 one bit left
#		then print result. 						
#
# Registers Used:
#	$s0: used to save constant value 4
#	$s1: used to save constant value -4  
#	$s2: used to save constant value 64679 
#	$s3: used to save constant value -64679
#
#
########################################################################

		.data
msg0:	.asciiz "\nregister $s0 is: "
msg1:	.asciiz "\nregister $s1 is: "
msg2:	.asciiz "\nregister $s2 is: "
msg3:	.asciiz "\nregister $s3 is: "
msg4: 	.asciiz "\n$s2 + $s3 = "
msg5: 	.asciiz "\nLogical 'or' on constant 4 and $s3: "
msg6:	.asciiz "\nShift $s3 one bit left, value now is: "

		.text
		.globl main
main: 										
		li $s0, 4  					# loading 4 into register $s0
		li $s1, -4					# loading -4 into register $s1
		li $s2, 64679  				# loading 64679 into register $s2
		li $s3, -64679				# loading -64679 into register $s3 
		
		
		li $v0, 4					# $v0 is 4 to print string 
		la $a0, msg0 				# print message
		syscall 
	
		li $v0, 1					# to print value at $s0 
		move $a0, $s0 
		syscall 
		
		li $v0, 4					# $v0 is 4 to print string 
		la $a0, msg1 				# print message
		syscall 
	
		li $v0, 1					# to print integer at $s1
		move $a0, $s1 
		syscall 
			
		li $v0, 4					# $v0 is 4 to print string 
		la $a0, msg2 				# print message
		syscall 
	
		li $v0, 1					# to print value at $s2 
		move $a0, $s2 
		syscall 
		
		li $v0, 4					# $v0 is 4 to print string 
		la $a0, msg3 				# print message
		syscall 
	
		li $v0, 1					# to print integer at $s3
		move $a0, $s3
		syscall 
		
		
		add $t0, $s2, $s3			# adding $s2 and $s3 
		
		li $v0, 4					# $v0 is 4 to print string 
		la $a0, msg4 				# print message
		syscall 
		
		li $v0, 1 					# to print integer at $t0
		move $a0, $t0 
		syscall 
		
		
		ori $t0, $s3, 4 			# or performed on constant 4 and $s3 
		
		li $v0, 4					# $v0 is 4 to print string 
		la $a0, msg5 				# print message
		syscall 
		
		li $v0, 1 					# to print integer at $t0
		move $a0, $t0 
		syscall

		
		sll $t0, $s3, 1				# shift $s3 one bit to the left 
		
		li $v0, 4					# $v0 is 4 to print string 
		la $a0, msg6 				# print message
		syscall 
		
		li $v0, 1 					# to print integer at $t0
		move $a0, $t0 
		syscall

		
	
		
Exit:	li $v0, 10 							# System code to exit
		syscall								# make system call 