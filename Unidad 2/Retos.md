# Retos
## 1
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

## 2
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

En lenguaje ensamblado a diferencia del lengauje de alto nivel el bucle es el mismo. La diferencia de "while"y "for"en lenguaje de alto nivel es que "for" ya sabe cuantas veces va a realizar el loop, mientras que "While"
Tan solo realiza esta accion hasta que un requisito se cumpla. enlenguaje nesamblador no se puede determinar un valor o una cantidad de ciclos dependiendo de estos, por lo que en si mismo es su propiotipo de ciclo, en el 
que las condiciones se compruebas constantemente para determinar si el ciclo deberia de terminar o no dependiendo de estas mismas. Un procesomas largo, pero a mi parecer mucho mas cercano a los loops creados por "While"
que tambien se basa en las condiciones que en "for" quien ya tiene una condicion inicial.

## 3
