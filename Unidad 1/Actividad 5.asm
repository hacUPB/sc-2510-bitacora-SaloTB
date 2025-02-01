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

# 15 Implementa en ensamblador el siguiente problema. En la posición R0 está almacenada la dirección inicial de una región de 
memoria. En la posición R1 está almacenado el tamaño de la región de memoria. Almacena un -1 en esa región de memoria.

@R0          
D=A          
@R1         
D=D+A       (fin de la región)
(LOOP)       
@R0        
D=M        
M=-1       
@R0        
D=M       
D=D+1      
@R0        
M=D       
@END       
D;JLT      
@END      
0;JMP      

# 16  (suma de los primeros diez números enteros)

@0        
M=0        
@1          
M=1         
@2          
M=2         
@3         
M=3         
@4         
M=4        
@5        
M=5        
@6         
M=6         
@7         
M=7        
@8          
M=8        
@9         
M=9        
@10         
M=0        
@0          
D=A         
(LOOP)
D=M          
@10         
M=M+D         
@0           
D=D+1        
@10           
D=M           
@10          
D=D+1        
@20          
D;JLT LOOP  

# 17 

# 18
function void draw(int location) {
	var int memAddress; 
	let memAddress = 16384+location;
	// column 0
	do Memory.poke(memAddress, -64);
	do Memory.poke(memAddress +32, -32656);
	do Memory.poke(memAddress +64, 7180);
	do Memory.poke(memAddress +96, 7172);
	do Memory.poke(memAddress +128, -25594);
	do Memory.poke(memAddress +160, -8190);
	do Memory.poke(memAddress +192, 12291);
	do Memory.poke(memAddress +224, 4097);
	do Memory.poke(memAddress +256, 6145);
	do Memory.poke(memAddress +288, 2049);
	do Memory.poke(memAddress +320, 2049);
	do Memory.poke(memAddress +352, 1025);
	do Memory.poke(memAddress +384, 1025);
	do Memory.poke(memAddress +416, 1025);
	do Memory.poke(memAddress +448, 1025);
	do Memory.poke(memAddress +480, 1025);
	do Memory.poke(memAddress +512, 1025);
	do Memory.poke(memAddress +544, 1026);
	do Memory.poke(memAddress +576, 3074);
	do Memory.poke(memAddress +608, 14340);
	do Memory.poke(memAddress +640, -8180);
	do Memory.poke(memAddress +672, 24);
	do Memory.poke(memAddress +704, 48);
	do Memory.poke(memAddress +736, 224);
	do Memory.poke(memAddress +768, -256);
	// column 1
	do Memory.poke(memAddress +33, 7);
	do Memory.poke(memAddress +65, 12);
	do Memory.poke(memAddress +97, 24);
	do Memory.poke(memAddress +129, 31);
	do Memory.poke(memAddress +161, 48);
	do Memory.poke(memAddress +225, 1022);
	do Memory.poke(memAddress +257, 1539);
	do Memory.poke(memAddress +289, 1025);
	do Memory.poke(memAddress +321, 1161);
	do Memory.poke(memAddress +353, 1137);
	do Memory.poke(memAddress +385, 1137);
	do Memory.poke(memAddress +417, 1027);
	do Memory.poke(memAddress +449, 1419);
	do Memory.poke(memAddress +481, 1501);
	do Memory.poke(memAddress +513, 1655);
	do Memory.poke(memAddress +545, 1536);
	do Memory.poke(memAddress +577, 128);
	do Memory.poke(memAddress +609, 192);
	do Memory.poke(memAddress +641, 255);
	do Memory.poke(memAddress +673, 96);
	do Memory.poke(memAddress +705, 48);
	do Memory.poke(memAddress +737, 14);
	do Memory.poke(memAddress +769, 1);
	return;

#19
1.  0100000000000000  // @0
2.  1110110000010000  // D = D + A
3.  0000000000010000  // @32
4.  1110001100001000  // M = M + D
5.  0110000000000000  // @0
6.  1111110000010000  // D = D - 1
7.  0000000000010011  // @35
8.  1110001100000101  // M = M - D
9.  0000000000010000  // @32
10. 1111110000010000  // D = D - 1
11. 0100000000000000  // @0
12. 1110010011010000  // M = M + D
13. 0000000000000100  // @4
14. 1110001100000110  // M = M + D
15. 0000000000010000  // @32
16. 1111110010101000  // D = D - A
17. 1110101010001000  // A = A + D
18. 0000000000000100  // @4
19. 1110101010000111  // A = A + D
20. 0000000000010000  // @32
21. 1111110000010000  // D = D - A
22. 0110000000000000  // @0
23. 1110010011010000  // M = M + D
24. 0000000000000100  // @4
25. 1110001100000011  // M = M + D
26. 0000000000010000   // @32 
27. 1111111000100000   // D = D - A 
28. 1110111010001000   // A = A + D 
29.  0000000000000100  // @4
30.  1110101010001000  // A = A + D
31.  0000000000010000  // @32
32.  1111110000010000  // D = D - A
33.  0110000000000000  // @0
34.  1110010011010000  // M = M + D
35.  0000000000000100  // @4
36.  1110001100000011  // M = M + D
37.  0000000000010000  // @32
38.  1111111000100000  // D = D - A
39.  1110111010001000  // A = A + D

El programa parece estar realizando una serie de operaciones sobre registros y posiciones de memoria, específicamente:
Inicializa ciertos valores en registros y posiciones de memoria
Realiza operaciones de suma y resta en bucles
Actualiza valores en direcciones específicas de RAM (como las direcciones 0, 4, y 32) utilizando los cálculos realizados

# 20 Implementa un programa en lenguaje ensamblador que dibuje el bitmap que diseñaste en la pantalla solo si se presiona la 
tecla “d”.

// Dirección base para el bitmap
@16384
D=A          // D = 16384 (dirección base)

// Leer la entrada del teclado
@KBD         // Cargar la dirección del teclado
D=M          // D = valor del teclado

// Comparar si D es igual a 'd' (ASCII 100)
@100         // Cargar el valor ASCII de 'd'
D=D-A        // D = D - 100
@DRAW        // Si D == 0, saltar a la etiqueta DRAW
D;JEQ        // Salta si D es igual a 0

// Fin del programa si no se presiona 'd'
@END
0;JMP

(DRAW)
    // Llamar a la función draw(location)
    @0          // Asumimos que location es 0 para simplificar
    D=A         // D = location
    @CALL_DRAW  // Saltar a la función draw
    0;JMP

(END)
    // Aquí puedes agregar código para finalizar el programa o un bucle infinito.
    @END
    0;JMP

(CALL_DRAW)
    // Aquí colocamos el código de la función draw(int location)
    @16384      // Cargar la dirección base para el bitmap
    D=A         // D = dirección base
    
    // Column 0 (Ejemplo)
    @0          // Poner aquí el valor real que quieres dibujar
    M=-64       // Memory.poke(memAddress, -64);
    
    @32
    M=-32656    // Memory.poke(memAddress + 32, -32656);
    
    @64
    M=7180     // Memory.poke(memAddress + 64, 7180);
    
    @96
    M=7172     // Memory.poke(memAddress + 96, 7172);
    
    @128
    M=-25594   // Memory.poke(memAddress + 128, -25594);
    
    @160
    M=-8190     // Memory.poke(memAddress + 160, -8190);
    
    @192
    M=12291     // Memory.poke(memAddress + 192, 12291);
    
    @224
    M=4097      // Memory.poke(memAddress + 224, 4097);
    
    @256
    M=6145      // Memory.poke(memAddress + 256, 6145);
    
    @288
    M=2049      // Memory.poke(memAddress + 288, 2049);
    
    @320
    M=2049      // Memory.poke(memAddress + 320, 2049);
    
    @352
    M=1025      // Memory.poke(memAddress + 352, 1025);
    
    @384
    M=1025      // Memory.poke(memAddress + 384, 1025);
    
    @416
    M=1025      // Memory.poke(memAddress + 416, 1025);
    
    @448
    M=1025      // Memory.poke(memAddress + 448, 1025);
    
    @480
    M=1025      // Memory.poke(memAddress + 480, 1025);
    
    @512
    M=1025      // Memory.poke(memAddress + 512, 1025);
    
    @544
    M=1026      // Memory.poke(memAddress + 544, 1026);
    
    @576
    M=3074      // Memory.poke(memAddress + 576, 3074);
    
    @608
    M=14340     // Memory.poke(memAddress + 608, 14340);
    
    @640
    M=-8180     // Memory.poke(memAddress + 640, -8180);
    
    @672
    M=24        // Memory.poke(memAddress + 672, 24);
    
    @704
    M=48        // Memory.poke(memAddress + 704, 48);
    
    @736
    M=224       // Memory.poke(memAddress + 736, 224);
    
    @768
    M=-256      // Memory.poke(memAddress + 768, -256);

   ...

   (FIN DE LA FUNCIÓN DRAW)






