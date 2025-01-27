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

#11 
