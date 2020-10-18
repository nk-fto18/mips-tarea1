.data
salto: .asciiz "\n"	

.text
.globl main
main:
	li $t0, 1					
	li $s0, 101					

verificar:						
	beq $t0, $s0, exit			
	rem $t1, $t0, 5				
	beq $t1, $zero, multiplos	
	rem $t1, $t0, 3				
	beq $t1, $zero, multiplos	

	#Si no se cumple nada de lo anterior, entonces t0 no es multiplo de 3 o 5. Pasar al siguiente numero
	addi $t0, $t0, 1			

	j verificar					

multiplos:						
	li $v0, 1					
	add $a0, $t0, $zero			
	syscall						

	li $v0, 4					
	la $a0, salto 				
	syscall						

	addi $t0, $t0, 1			
	j verificar					
  
exit:
	li $v0, 10
	syscall
