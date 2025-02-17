# Retos
## Reto 1
    @0
    D=A
    @sum
    M=D          // sum = 0
    
    @1
    D=A
    @i
    M=D          // i = 1
    
    (LOOP) //Bucle
        @i
        D=M
        @100
        D=D-A
        @END
        D;JGE      // Si i > 100, salir del bucle
    
        // sum = sum + i
        @i
        D=M
        @sum
        M=D+M
    
        // i = i + 1
        @i
        M=M+1
    
        @LOOP
        0;JMP      // Repetir el bucle
    
    (END)
        @END
        0;JMP      // Loop infinito para detener el programa
        
1. Las variables i y sum están implementadas como posiciones en la RAM en el simulador
2. En lenguaje ensamblador las variables se almacenan a partir de la dirección de memoria RAM16 en adelante por lo que si "sum" es la primera variable declarada e "i" la segunda, sus direcciones serian 16 y 17
3. El ciclo while se implementa con los saltos condicionales JGE, JMP que son los que general en bucle o loop
4. La variable i se almacena en  la memoria RAM y se cambia usando "M=M+1" para sumarla y se usan comparaciones para controlar el ciclo y cuando este mismo termina
5. Como mencionado anteriormente se almacenaria en la posicion 17
6. Una variable es un espacio en la memoria RAM que almacena un valor que puede cambiar durante la ejecución del programa con instrucciones
7. La dirección de una variable es el número de la RAM donde se guarda su valor
8. El contenido de una variable es el valor almacenado en su dirección de memoria 

## Reto 2
        @0
        D=A
        @sum
        M=D          // sum = 0
    
        @1
        D=A
        @i
        M=D          // i = 1 (Inicialización antes del bucle)
    
    (FOR_COND)
        @i
        D=M
        @100
        D=D-A
        @END
        D;JGT      // Si i > 100, salir del bucle
    
        // sum += i
        @i
        D=M
        @sum
        M=M+D
    
        // i++ (actualización al final del bucle)
        @i
        M=M+1
    
        @FOR_COND
        0;JMP      // Volver a comprobar la condición
    
    (END)
        @END
        0;JMP      // Loop infinito para detener el programa
        
En ensamblador ambos bucles terminan implementándose de manera casi identica, La diferencia es que "while" es más flexible porque no obliga a que la inicialización e incremento estén en lugares fijos; mientras que 
"for" sigue una estructura más clara, asegurando que la inicialización, condición y actualización estén organizadas de manera predecible.

## Reto 3

## Reto 4

    "int a = 10;
    int *p;
    p = &a;
    *p = 20;"
    
1. ¿Cómo se declara un puntero en C++?
   Se usa el "*"
2. ¿Cómo se define un puntero en C++?
   Asignando la dirección de otra variable
   
        @a
        D=A
        @p
        M=D   // p = &a

3. ¿Cómo se almacena en C++ la dirección de memoria de una variable?
   Usando "&"

       @a
        D=A
        @p // p almacena la dirección de a
        M=D
4. ¿Cómo se escribe el contenido de la variable a la que apunta un puntero?
    usando *p

        @p
        A=M    // A ahora apunta a la dirección de a
        M=20   // *p = 20

-- Los punteros en ensamblador son simplemente direcciones de memoria almacenadas en registros o variables. Para modificar una variable a través de un puntero --

## Reto 5 

   
   
