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
