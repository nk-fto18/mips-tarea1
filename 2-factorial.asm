.data
ingreso: .asciiz "Ingrese un numero: "

.text
.globl main
main:
	li $t1, 1			

	li $v0, 4			
	la $a0, ingreso		
	syscall				

	li $v0, 5			
	syscall				
	move $t0, $v0		

loop:
	beq $t0, $zero, finalizar		#while(t0 != 0){
	mul $t1, $t1, $t0				#	t1 *= t0;
	addi $t0, $t0, -1				#	t0--;
	j loop							#}

finalizar:
	li $v0, 1		
	move $a0, $t1	
	syscall			
  
exit:
li  $v0, 10				
syscall					
