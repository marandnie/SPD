# SPD
## Primer parcial teórico

1) En los sistemas numéricos posicionales y basados de peso constante, el peso de cada dígito se calcula como:

[] Base elevada a la base.
[] Posición elevada al cuadrado.
[] Posición elevada a la base.
[] Número elevado a la posición.
[] 2 elevada a la posición.
[X] Base elevada a la posición.
[] 10 elevada a la posición.
[] 2 elevada a la base.

2) Una compuerta 3 estados u "Open Collector" se caracteriza por:

[] Su entrada puede estar en alta impedancia.
[X] Su salida puede estar en alta impedancia.
[] Sus entradas están conectadas a masma (potencial de referencia).
[] Su salida está conectada a masa (potencial de referencia).
[] No tiene salidas ni entradas.

3) A la combinación binaria 010111010b de 9 bits le faltan 3 bits. Marcar todas las ternas de 3 bits que podrá agregar para que sea de paridad par:

[] 000.
[X] 100.
[X] 001.
[] 101.
[X] 010.
[] 110.
[] 011.
[X] 111.

4) Si poseemos un dispositivo que a su entrada le entregamos un código binario de n bits y en sus 2 a la n salidas obtenemos un "1" en una sola de ellas correspondiente al valor decimal del binario ingresado, el dispositivo es un...

[] Multiplexor.
[] Conversor de código.
[X] Decodificador.
[] Demultiplexor.
[] Codificador.
[] Transductor.

5) La estructura de un ordenador es:

[X] Buses, E/S, Memoria Principal, CPU.
[] CPU, E/S, Buses, Memoria de Control.
[] Memoria Principal, ALU, Buses, E/S.
[] CPU, ALU, E/S, Buses.

6) Las arquitecturas de Von Neumann y Harvard se enmarcan en la siguiente clasificación de Flynn:

[] MIMD
[] DIMD
[] MISD
[] DISD
[] SIMD
[X] SISD

7) Si digo que una estructura tiene Memoria de control, lógica secuencial y unidad de control de registros y decodificadores, me refiero a:

[] La unidad de entrada/salida.
[] La CPU.
[] La memoria principal.
[] La ALU.
[] El sistema de interconexión.
[] La memoria ROM.
[X] La Unidad de control.
[] La memoria Caché.

8) Existen varios sistemas binarios de numeración con signo, ¿Cuál se utiliza en los cálculos aritméticos de la ALU?

[] Complemento a 1.
[] Signo y magnitud.
[X] Complemento a 2.
[] Exceso 2 a la (n-1).

9) ¿Qué sistema de representación numérica binaria con signo posee el siguiente rango de representación?: {-( 2^(n-1) ) ; +( 2^(n-1) -1) }

[X] Complemento a 2.
[X] Exceso 2 a la (n-1).
[] Signo y magnitud.
[] Complemento a 1.

10) En operaciones binarias dentro de nuestro procesador de estudio, indicar el conjunto de flags que se encienden ("1") indicando que una operación resultó con sobreflujo (overflow):

[] SF = con signo, OF = sin signo.
[] CF = con signo, SF = sin signo.
[X] CF = sin signo, OF = con signo.
[] CF = sin signo, SF = con signo.

11) En operaciones binarias con signo, indicar las operaciones que arrojarán sobreflujo (overflow):

[] 000 + 100
[] 111 + 000
[X] 100 + 100
[X] 010 + 010
[] 111 + 110
[] 001 + 010

12) Las posiciones fraccionarias del sistema binario tienen los siguientes pesos:

[] 0, 1/2, 1/4, 1/8, 1/16, ...
[X] 1/2, 1/4, 1/8, 1/16, ...
[] 0, -1, -2, -4, -8, -16, ...
[] -1, -2, -3, -4, -5, ...

13) Se obtiene el menor error de representación en cifras binarias reales con coma (o punto fijo) si:

[] Truncamos solamente.
[] No redondeamos y truncamos.
[X] Redondeamos y truncamos.
[] No truncamos.

14) ¿Qué señales de un Flip-Flop se utilizan para operarlo en forma sincrónica?

[] SET y CLR.
[] SET y Q.
[] D y Q.
[] CLK y CLR.
[] Q y CLR.
[X] D y CLK.

15) ¿Qué tiempo característico de una memoria indica el que se tarda desde que se realiza un pedido de lectura hasta que el mismo queda satisfecho?

[] Cycle Time (Tiempo de ciclo).
[X] Access Time (Tiempo de acceso).
[] Write Time (Tiempo de escritura).
[] Read Time (Tiempo de lectura).
[] CAS Time (Tiempo de CAS).
[] Hold Time (Tiempo de Establecimiento).

16) Las memorias más rápidas son las:

[] DRAM.
[X] SRAM.
[] SDRAM.
[] NPROM.
[] EEPROM.
[] PROM.

17) Las propiedades de "pipelining" e "interleaving" son características de las memorias:

[] EEPROM.
[] DRAM.
[] SRAM.
[X] DDR.

18) Si decimos que cualquier bloque de la memoria principal puede alojarse en un único renglón de la memoria caché, diremos que su organización es:

[] Mapeo Asociado.
[] Conjuntos Directos.
[] Asociativa.
[X] Mapeo Directo.

19) ¿En qué organización de memoria caché podremos valernos de la ayuda de una memoria asociativa?

[] Mapeo Asociado.
[] Conjuntos Directos.
[X] Asociativa.
[] Mapeo Directo.

20) Un "Page Fault" o fallo de página se dará cuando la página que está buscando la MMU no se encuentra en:

[] La memoria virtual.
[X] La memoria principal.
[] La memoria caché.
[] Los registros.

21) La estructura de las instrucciones de los procesadores se caracteriza por comenzar con un:

[X] Código de operación u operación.
[] Un objeto o dato.
[] Un dato o parámetro.
[] Un parámetro o dirección.

22) Durante la ejecución de la instrucción MOV AX,[200h], el contador de programa o PC se comportará de la siguiente manera para resolver el movimiento el contenido al AX:

[] Habitual.
[X] Indirección.
[] Salto.
[] Condicional.

23) El ciclo de instrucción de nuestro procesador será el siguiente, teniendo en cuenta que la instrucción a ejecutar tiene operandos:

[X] Instruction Fetch > Instruction Decode > Operand Fetch > Execution.
[] Instruction Decode > Operand Fetch > Instruction Fetch > Execution.
[] Instruction Decode > Instruction Fetch > Operand Fetch > Execution.
[] Operand Fetch > Instruction Fetch > Instruction Decode > Execution.

24) Los problemas de los Pipelines son los siguientes:

[X] De datos, control y estructura.
[] De datos, RAW, WAW y WAR.
[] De control, estructura y predicción de saltos.
[] De estructura, control y forwarding.

25) Un procesador con una pequeña cantidad de instrucciones en su SET, instrucciones de un solo clock, registros de propósito general, pocos formatos de direccionamiento, es un procesador:

[] CISC.
[X] RISC.
[] SISD.
[] MISC.