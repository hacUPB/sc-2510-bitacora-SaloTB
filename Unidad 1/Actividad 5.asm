#1 Carga en D el valor 1978.
@1978
D=A

#2 Guarda en la posición 100 de la RAM el número 69.
@69
D=A
@100
M=D

#3 Guarda en la posición 200 de la RAM el contenido de la posición 24 de la RAM
@24
D=M
@200
M=D 

#4 Lee lo que hay en la posición 100 de la RAM, resta 15 y guarda el resultado en la posición 100 de la RAM
@100
D=M
@15
D=D-A
@100
M=D

#5 Suma el contenido de la posición 0 de la RAM, el contenido de la posición 1 de la RAM y con la constante 69. Guarda el resultado en la posición 2 de la RAM.
@0
D=M 
@1
D=D+M
@69
D=D+A
@2
M=D

#6 Si el valor almacenado en D es igual a 0 salta a la posición 100 de la ROM.
@100
D;JEQ

#7 Si el valor almacenado en la posición 100 de la RAM es menor a 100 salta a la posición 20 de la ROM.
@100
D=M 
@100
D=D-A 
@20
D;JLT 

#8 Consideracion de porgrama
"@var1
D = M
@var2
D = D + M
@var3
M = D"
Este programa suma el valor almacenado en la RAM de dos puntos aleatorios llamados var1 y var2, y mueve el resultado de esta suma a la posicion var3 en la RAM 
var1, var2 y var3 se encuentran en las posiciones 16, 17 y 18 correspodientemente, esto pues las posiciones de la 0 a la 15 son espcios reservados de la RAM 

#9 Consideracion del programa
"i = 1
sum = 0
sum = sum + i
i = i + 1"
Este codigo suma la cantidad existente en la RAM de la primera variable en la segunda 
i y sum son las variables 16 y 17 respectivamente por la misma razon anterior.

Optimizacion de:

"// i = i + 1"
@i
M=M+1

#10 Las posiciones de memoria RAM de 0 a 15 tienen los nombres simbólico R0 a R15. Escribe un programa en lenguaje ensamblador que guarde en R1 la operación 2 * R0
@0
D=M 
@4 
M=D 
@4
D=D+M
@1
M=D

# 11 Considera el siguiente programa:

// i = 1000
@1000
D=A
@i
M=D
(LOOP)
// if (i == 0) goto CONT
@i
D=M
@CONT
D;JEQ
// i = i - 1
@i
M=M-1
// goto LOOP
@LOOP
0;JMP
(CONT)

Este programa guarda en D una cantidad, en este caso 1000, pone esta cantidad en la pocision 16 y luego compara si la cantidad es igual a 0, si la condicion no se cumple sigue bajando, y se le resta a este 1000
un uno, luego baja a la condicion 0;JMP que lo envia a la posicion nombrada anteriormente en la ROM osea @4, repitienod asi el proceso hasta que la condicion D;JEQ se cumpla y asi pueda seguir en la linea @12 
(Primera linea tras el bucle).

La i esta almacenada en la memoria @16 de la RAM

La exprecion i = 1000 esta almacenado en las posiciones @0, @1, @2 y @3 de la ROM ya que se divide en varias lineas de almacenamiento en lenguaje ensamblador 

La primera instruccion del programa es guardar en A el valor de 1000, este valor guardado en la ROM en @0

CONT contiene el bit que se ha desplazado o rotado fuera de un registro o posición de memoria
LOOP representa la repeticion del codigo como us nombre lo indica

La i es una posicion cualquiera de las posiciones posibles en la RAm, mientras que CONT es la posicion fuera del registro de memoria 

# 12 Implementar en lenguaje ensamblador:

"R4 = R1 + R2 + 69"

@2
D=M 
@3 
M=D 
@2 
D=M 
@3 
D=D+M 
@69 
D=D+A 
@4 
M=D 

Donde @4 es R4, @2 es R2, @1 es R1

# 13 Implementar en lenguaje ensamblador:

" if R0 >= 0 then R1 = 1
else R1 = –1

(LOOP)
goto LOOP "

@0 
D=M 
@9 
D;JLT 
@1 
D=A 
@1 
M=D 
@0
0;JMP
@1 
D=A 
@2 
D=D-A 
@1 
M=D 
@0
0;JMP

# 14 Implementar en lenguaje ensamblador:

"R4 = RAM[R1]"











