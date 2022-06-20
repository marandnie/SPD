.8086
.model small
.stack 100h 
.data
	;variables
bienvenida db  "|*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\|",0dh,0ah,24h
bienvenida1 db "|/*\*/|  bienvenidx al tp final de spd del grupo 2 (Wordle)    |/*\*/|",0dh, 0ah,24h
bienvenida2 db "|/*\*/|somos:                                                  |/*\*/|",0dh, 0ah,24h
bienvenida3 db "|/*\*/| Tomas Neiro                                            |/*\*/|",0dh, 0ah,24h 
bienvenida4 db "|/*\*/| Juan Cruz Pelozo                                       |/*\*/|",0dh, 0ah,24h 
bienvenida5 db "|/*\*/| Marina Nieto                                           |/*\*/|" ,0dh, 0ah,24h 
bienvenida6 db "|/*\*/| Sofia Morales                                          |/*\*/|",0dh, 0ah,24h 
bienvenida7 db "|*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\|",0dh, 0ah,24h                                                                                                                                                                                                                                                                                                                     
puntaje db "00000",24h ;aca desp ponemos que le ponga 10, 20 y vaya sumando 
puntaje_actual db "000000", 24h
palabra db 5 dup(24h)
palabra_actual db 5 dup(24h)
teclado db  27 dup("qwertyuiopasdfghjklñzxcvbnm"), 24h
letra_actual db 0
letra_reg db 0 ;esto es lo q pondria en el cartelito para q se guarde y se quedew
color1 db 0 ;ta ok
color2 db 0 ;ta en otro lugar
color3 db 0 ; no ta 

.code
	main proc
		mov ax, @data
		mov ds, ax 

	mov ah,9
	mov dx, offset bienvenida
	int 21h
	mov ah,9
	mov dx, offset bienvenida1
	int 21h
	mov ah, 9 	
	mov dx, offset bienvenida2
	int 21h
	mov ah,9
	mov dx, offset bienvenida3
	int 21h
	mov ah, 9
	mov dx, offset bienvenida4
	int 21h
	mov ah,9
	mov dx, offset bienvenida5
	int 21h
	mov ah,9
	mov dx, offset bienvenida6
	int 21h
	mov ah,9
	mov dx, offset bienvenida7
	int 21h

	mov ax,4c00h
	int 21h 
	main endp
end
