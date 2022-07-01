.8086
.model small
.stack 100h 

.data


vaciar     db 2000 dup (20h),24h


saludo 		   db 201, 61 dup (205),187, 0dh, 0ah
			   db 186,("         Bienvenidx al TP Final del grupo 2 (Wordle)         "),186, 0dh, 0ah
			   db 186,("    Somos:                                                   "),186, 0dh, 0ah
			   db 186,(" Sof¡a Morales                                               "),186, 0dh, 0ah
			   db 186,(" Marina Nieto                                                "),186, 0dh, 0ah
			   db 186,(" Tom s Neiro                                                 "),186, 0dh, 0ah
			   db 186,(" Juan Cruz Pelozo                                            "),186, 0dh, 0ah
			   db 200, 61 dup (205),188, 0dh, 0ah, 24h                                                                                                                                                                                                                                                                  
puntaje        db "00000",24h  
puntaje_actual db "000000", 24h

presioneE      db "Presione 'E' para la explicacion del juego", 0dh, 0ah, 24h
presioneEnter db "Presione ENTER para comenzar a jugar, presione ESC para salir:",0dh,0ah,24h

explicacion		db "Adivina la palabra oculta en seis intentos.Cada intento debe ser una palabra v -lida de 5 letras. "
				db "El juego le ir  indicando que letras est  en la palabra       oculta, ya sea en la posicion correcta o no. "
				db "Por favor divi‚rtase, y no se enojecon nosotros si encuentra alg£n error... Suerte :)",0dh, 0ah, 24h


ingrpalabra    db "Ingrese una palabra de 5 letras",0dh,0ah,24h
texto 	   	   db 5 dup ('$'), 0dh, 0ah, 24h
noLetra 	   db "No es letra, ingrese nuevamente:", 0dh, 0ah, 24h
salto		   db 0dh, 0ah, 24h

aciertos       db 0, 0dh, 0ah, 24h

vaciar2        db 1120 dup (20h),24h

palabraDePrueba db "MEDIA", 0dh,0ah,24h
pC  			db "primera letra est , posicion correcta",0dh, 0ah, 24h
pI 				db "primera letra est , posicion incorrecta",0dh, 0ah, 24h

sC 				db "segunda letra est , posicion correcta",0dh, 0ah, 24h
segI 			db "segunda letra est , posicion incorrecta",0dh, 0ah, 24h

tC 				db "tercera letra est , posicion correcta",0dh, 0ah, 24h
tI  			db "tercera letra est , posicion incorrecta",0dh, 0ah, 24h

cC   			db "cuarta letra est , posicion correcta",0dh, 0ah, 24h
cI  			db "cuarta letra est , posicion incorrecta",0dh, 0ah, 24h

qC 				db "quinta letra est , posicion correcta",0dh, 0ah, 24h
qI 			    db "quinta letra est , posicion incorrecta",0dh, 0ah, 24h

muyBien			db "Muy bien!",0dh, 0ah, 24h
perdiste		db "DERROTA!!",0dh, 0ah, 24h
ganaste			db "VICTORIA!!!", 0dh, 0ah, 24h


palabras        db "MEDIASALIRPROSAARTESBONOSCAJASBARRAALGASBROMACALLODULCEFRESABUFONCOBRASALDOBROTACALMOBRUTODICHOERRORBICHOFRITOGATOSPERROCIEGOFLUIRCINCOHECHOHILOSCIRCOTIBIOJARROKILOSLIMONSERIAMITADNARIZOBVIOPARTOQUIENRAMPAPINZAPASTOSABORTABLAUNIONVIAJEFALSOBOLSAVISTO", 0dh, 0ah, 24h


contador        db 0,0dh, 0ah, 24h
contador2       db 0,0dh, 0ah, 24h
auxiliar        db 0, 24h
flag 			db 0,24h
bandera 		db 0,24h
resolucion      db "La pablara oculta era: ", 24h 
muestra			db 5 dup (24h),0dh,0ah,24h

		adios	db "Adios!",0dh, 0ah, 24h

 .code

	main proc
		mov ax, @data
		mov ds, ax 

		lea dx, vaciar
		call imprimir
		
		lea dx, saludo
		call imprimir
inicio:
	mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
	mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
	mov bl, 3   ;ELIJO EL COLOR
	mov cx, 42    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
	int 10h

	lea dx, presioneE
	call imprimir

	mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
	mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
	mov bl, 135   ;ELIJO EL COLOR
	mov cx, 62    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
	int 10h

	lea dx, presioneEnter
	call imprimir

	lea dx, vaciar2
	call imprimir

deNuevo:
	mov ah, 8
	int 21h 

	cmp al, 0dh
	jne noEsEnter
	jmp ingresePalabra

noEsEnter:
	cmp al, 45h
	je explica
	cmp al, 65h
	je explica
	cmp al, 1Bh
	jne deNuevo
seDespide:
	lea dx, adios
	call imprimir
	jmp escape

explica:

	lea dx, explicacion
	call imprimir
	jmp inicio

ingresePalabra:
	cmp aciertos, 3     ;contador de aciertos llega a 3 gana (Lo mejor es que sea hasta 10)
	je victorioso
	lea dx, ingrpalabra
	call imprimir
	jmp intentos

victorioso:
	mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
	mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
	mov bl, 2   ;ELIJO EL COLOR
	mov cx, 11    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
	int 10h

	lea dx, ganaste
	call imprimir
	jmp escape

intentos:
mov bx, 0
lea dx, vaciar2
call imprimir
mov contador, 0
carga:
		mov ah, 1 
		int 21h
		jmp comprobar
sigo:
		mov texto[bx], al 
		cmp bx, 4
		je finCarga

	inc bx
	jmp carga


comprobar:
		call compruebo
							;compruebo si es un caracter

		cmp dl, 0
		je sigo

		jmp ingresePalabra
		
finCarga:

	lea dx, salto
	call imprimir

	lea dx, texto
	call imprimir

	call comparaCadena

	cmp contador, 5
	jae acertaste

	add contador2, 1
	cmp contador2, 6       ;contador para intentos
	je derrota
	jmp intentos

acertaste:
	mov contador2, 0

	mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
	mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
	mov bl, 14   ;ELIJO EL COLOR
	mov cx, 9    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
	int 10h

	lea dx, muyBien
	call imprimir

	add aciertos, 1
	mov flag, 0
	jmp ingresePalabra

derrota:
	mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
	mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
	mov bl, 4   ;ELIJO EL COLOR
	mov cx, 9    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
	int 10h

	lea dx, perdiste
	call imprimir
	lea dx, resolucion
	call imprimir

	mov ah, 9     ;IMPRIMO UN CARACTER CON COLOR
	mov bh, 0     ;ELIJO EN QUE PAGINA IMPRIMIR
	mov bl, 137   ;ELIJO EL COLOR
	mov cx, 5    ;CANTIDAD DE VECES QUE IMPRIMO ESE CARACTER
	int 10h

	lea dx, muestra 
	call imprimir
	jmp seDespide

escape:
	lea dx, vaciar2
	call imprimir

	mov ax, 4c00h
	int 21h
main endp


;=================================================Funcion para Imprimir carteles===============================================================================

imprimir proc
	 mov ah, 9
	 int 21h
 ret
imprimir endp



;====================================Funcion para comprobar si es letra y mayusculizar las minusculas===============================================================================

compruebo proc

comparo:
	cmp al, 41h
	jb noEsLetra
	cmp al, 7ah
	ja noEsLetra
	cmp al, 5bh
	jb esLetraMayus
	cmp al, 60h
	ja esMinuscula

esMinuscula:
	sub al, 20h
	jmp esLetraMayus	

esLetraMayus:
	mov dl, 0
	jmp final

noEsLetra:
	lea dx, noLetra
	call imprimir
	mov dl, 1
	jmp final

final:

ret
compruebo endp

;=================================================Funcion para comparar texto======================================================================================

comparaCadena proc

	lea bx, texto
	cmp flag, 1     ;si el FLAG es 1, no va randomizar de nuevo, para que no salga una palabra nueva
	je noRandom
	call random
	push ax
	pop di
	mov si, 0
cargaMuestra:
	cmp si, 5
	je terminaMuestra
	mov al, palabras[di]
	mov muestra[si], al
	inc si 
	add di, 1
	jmp cargaMuestra
terminaMuestra:
	sub di, 5
noRandom:
	mov si, di
	mov al, byte ptr[bx]
	mov cl, 0

comparaPrimera:
		cmp cl, 5
		jae compara2


		cmp al, palabras[si]      
		je estaPrimera	

sigo1:
		inc si
		inc cl
		jmp comparaPrimera

estaPrimera:
		cmp cl, 0
		jne primeraIncorrecta

		add contador, 1  ;contador para saber cuando acierta

		lea dx, pC
		call imprimir

		jmp compara2     

primeraIncorrecta:		 	
		
		lea dx, pI 
		call imprimir
		jmp compara2

compara2:
		inc bx
		mov al, byte ptr[bx]
		mov si, di
		
		mov cl, 0

comparaSegunda:
		cmp cl, 5
		jae continua3
		cmp al, palabras[si]
		je estaSegunda
sigo2:
		inc si
		inc cl
		jmp comparaSegunda

estaSegunda:
		cmp cl, 1 
		jne segundaIncorrecta

		add contador, 1
		lea dx, sC
		call imprimir
		jmp compara3

segundaIncorrecta:
		mov bandera, 1
		jmp sigo2
inco2:
		lea dx, segI 
		call imprimir
		jmp compara3

continua3:
		cmp bandera, 1
		je inco2

compara3:
		mov bandera, 0
		inc bx
		mov al, byte ptr[bx]
		mov si, di
		mov cl, 0

comparaTercera:				
		cmp cl, 5
		jae continua4
		cmp al, palabras[si]
		je estaTercera
sigo3:
		inc si
		inc cl
		jmp comparaTercera

estaTercera:
		cmp cl, 2 
		jne terceraIncorrecta

		add contador, 1
		lea dx, tC
		call imprimir
		jmp compara4

terceraIncorrecta:
		mov bandera, 1
		jmp sigo3
inco3:
		lea dx, tI 
		call imprimir
		jmp compara4

continua4:
		cmp bandera, 1
		je inco3
compara4:
		mov bandera, 0
		inc bx
		mov al, byte ptr[bx]
		mov si, di
		mov cl, 0

comparaCuarta:
		cmp cl, 5
		jae continua5
		cmp al, palabras[si]
		je estaCuarta
sigo4:
		inc si
		inc cl
		jmp comparaCuarta

estaCuarta:
		cmp cl, 3
		jne cuartaIncorrecta
		add contador, 1
		lea dx, cC
		call imprimir
		jmp compara5

cuartaIncorrecta:
		mov bandera, 1
		jmp sigo4
inco4:		
		lea dx, cI 
		call imprimir
		jmp compara5
continua5:
		cmp bandera, 1
		je inco4

compara5:
		mov bandera, 0
		inc bx
		mov al, byte ptr[bx]
		mov si, di
		mov cl, 0

comparaQuinta:
		cmp cl, 5
		jae atajo
		cmp al, palabras[si]
		je estaQuinta
sigo5:
		inc si
		inc cl
		jmp comparaQuinta
atajo:	
		cmp bandera, 1
		je inco5
		jmp chau

estaQuinta:
		cmp cl, 4 
		jne quintaIncorrecta

		add contador, 1
		lea dx, qC
		call imprimir
		jmp chau

quintaIncorrecta:
		mov bandera, 1
		jmp sigo5
inco5:
		lea dx, qI 
		call imprimir
		

chau:




ret

comparaCadena endp

;=================================================Funcion para randomizar======================================================================================

random proc
	push cx
	push dx
	mov ah, 2ch
	int 21h
	xor ax, ax
	mov al, dl
	mov cl, 5
	mul cl
	cmp ax, 255
	ja sePasa
	xor ah, ah
	jmp finRandom

sePasa:
	sub ax, 255


finRandom:
	mov flag, 1    ;FLAG que avisa que ya entr¢
	pop dx
	pop cx
	ret
random endp




end
