
section .text

	global  _start


_start:
	
	;Output question
	mov		eax,4				;system call number write
	mov 	ebx,1				;file descriptor stdin
	mov		ecx,msg 			;ques
	mov 	edx,len				;len of question
	int 	80h					;call kernel

	
	;Receive the name 
	mov		edx,100				;message input length			
	mov 	ecx,name			;copy message to ecx register
	mov 	ebx,2				;file descriptor (stdin)
	mov 	eax,3				;system call number (read)
	int 	0x80				;call kernel

                                ;presenting your name
	mov 	eax,4
	mov 	ebx,1
	mov		ecx,res
	mov 	edx,lenres
	int 	80h

	;Output the name

	mov		eax,4
	mov 	ebx,1
	mov		ecx,name
	mov 	edx,100
	int 	80h

	;Output the stars

	mov		eax,4
	mov 	ebx,1
	mov		ecx,stars
	mov 	edx,9
	int 	80h

	mov 	ebx,0
	mov 	eax,1
	int 	0x80

section .bss
name resb 100

section .data
msg db "Enter your name: ",0ax	;Question 
len equ $ - msg 				;length of question
res db "Your name is: "			;presenting your name
lenres equ $ - res
stars times 9 db "*"