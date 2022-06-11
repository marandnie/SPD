.8086
.model small
.stack 100h
.data
			;ACA VAN LAS VARIABLES
.code
	main proc
		mov ax, @data
		mov ds, ax

			;ACA VA EL CODIGO


		mov ax, 4c00h
		int 21h
	main endp

	end main
