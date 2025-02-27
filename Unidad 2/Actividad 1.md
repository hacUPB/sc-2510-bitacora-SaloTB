# ¿Qué es la entrada-salida mapeada a memoria?
Un sistema de entrada/salida (E/S) mapeada en memoria es una técnica en la que los dispositivos periféricos, como teclados, impresoras o discos duros, se integran directamente en el espacio de direcciones de memoria de una computadora. Esto significa que la CPU puede comunicarse con estos dispositivos utilizando las mismas instrucciones que emplea para acceder a la memoria, sin necesidad de instrucciones especiales.

En este esquema, se asignan direcciones específicas dentro del espacio de memoria para cada dispositivo de E/S. Cuando la CPU desea interactuar con un periférico, lee o escribe en estas direcciones designadas, y el dispositivo correspondiente responde a esas operaciones. Por ejemplo, escribir en una dirección de memoria particular podría enviar datos a una impresora, mientras que leer de otra dirección podría obtener datos de un teclado.

# ¿Cómo se implementa en la plataforma Hack?
En la plataforma Hack, la entrada/salida (E/S) mapeada en memoria se implementa asignando direcciones específicas del espacio de memoria a dispositivos de E/S, como la pantalla y el teclado. Esto permite que la CPU interactúe con estos periféricos utilizando las mismas instrucciones que emplea para acceder a la memoria.

## Implementación en la plataforma Hack:

Pantalla: Cada posición de memoria representa un píxel en la pantalla; al escribir un valor en estas direcciones, se controla el estado de los píxeles, permitiendo dibujar en la pantalla.

Teclado: Al leer esta posición de memoria, se puede determinar qué tecla se ha presionado, facilitando la interacción con el usuario.

# Inventa un programa que haga uso de la entrada-salida mapeada a memoria.

    // Para limpiar la pantalla 
    @24576      // Dirección del teclado
    D=M         // Guarda el valor en D
    @CLEAR      // Si es 0 se limpia la pantalla
    D;JEQ
    
    // Al presionar una tecla poner la pantalla en balnco
    @16384      // Dirección de inicio de la pantalla
    D=A
    @SCREEN_PTR // Se guarda el puntero de la pantalla (PErmite que vaya pixel por pixel pintando la pantalla)
    M=D

    (LOOP_FILL)
        @SCREEN_PTR
        A=M         // Ir a la direccion de la pantalla actual
        M=-1        // Escribe -1 (pone pixel blanco)
        @SCREEN_PTR
        M=M+1       // Avanza a la siguiente celda de la pantalla
        @24576      // Verificar si sigue presionada la tecla
        D=M
        @LOOP_FILL
        D;JNE       // si sigue presionada continua llenando. salta si D es distinto de 0
        
      @INICIO     // Regresar al inicio para seguir leyendo el teclado
      0;JMP
    
    (CLEAR)
        @16384
        D=A
        @SCREEN_PTR
        M=D
    
    (LOOP_CLEAR)
        @SCREEN_PTR
        A=M
        M=0         // Escribir 0 para limpiar la pantalla
        @SCREEN_PTR
        M=M+1
        @24576
        D=M
        @LOOP_CLEAR
        D;JEQ       // Mientras no se presione una tecla, seguir limpiando. Salta si D == 0
        
      @INICIO
      0;JMP       // Regresar al inicio para seguir leyendo el teclado. Salta si o si 
    
    (INICIO)
        @24576
        D=M
        @CLEAR
        D;JEQ       // Si no hay tecla, limpiar pantalla. salta si D == 0
        @LOOP_FILL
        0;JMP       // Si hay tecla, llenar pantalla


## Explicacion del codigo 
1. Si no se presiona ninguna tecla, se ejecuta el bloque CLEAR, que recorre la memoria de la pantalla y la apaga.
2. Si se detecta una tecla presionada, el bloque LOOP_FILL recorre la memoria de la pantalla y la llena de píxeles blancos.
3. El programa se ejecuta en un bucle infinito, actualizando constantemente la pantalla según el estado del teclado.
4. -1 es 1111 1111 1111 1111 en binario.
5. En la pantalla de Hack cada 1 significa un píxel blanco.
6. Al escribir -1, encendemos los 16 píxeles de esa celda de memoria.
7. Para llenar toda la pantalla, se debe escribir -1 en todas las direcciones de memoria de la pantalla.

# Investiga el funcionamiento del programa con el simulador.
Al utilizarlo en el simulador el programa sigue reproduciendose de forma constante en un loop que comprueba constantemente si el usuario esta oprimiendo una tecla o no:
![image](https://github.com/user-attachments/assets/deeb6318-2424-4602-a992-9c14fa96b80e)
Cuando el usuario presiona una tecla, osea el programa lee un numero diferente a 0 en la direccion 24576 (Direccion del teclado) este comenzara a pintar pixel por pixel la pantalla:
![image](https://github.com/user-attachments/assets/b566b41c-f2b1-4422-a9a5-e4a044cf6835)


