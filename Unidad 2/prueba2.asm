// Constantes
@24576        // Dirección del teclado
D=A
@KEYBOARD
M=D

@100           // Codigo ASCII de la letra 'D'
D=A
@D_KEY_ASCII
M=D

// Direccion de la funcion de dibujo
@DRAW_FUNCTION
D=A 
M=D 

// Constantes de la pantalla
@SCREEN         // Dirección base de la pantalla
D=A
@SCREEN_BASE
M=D             // Guardar la dirección base de la pantalla

//Loop principal
(MAIN_LOOP)
    // Leer el teclado
    @KEYBOARD
    D=M            // D = valor del teclado

    // Verificar si se presiono la tecla 'D'
    @D_KEY_ASCII
    D=D-M          // D = valor del teclado - codigo ASCII de 'D'
    @DRAW_FUNCTION // Si se presiono 'D', saltar a la funcion de dibujo
    D;JEQ
    // Si no se presiono 'D', volver a leer el teclado
    @MAIN_LOOP
    0;JMP

// Funcion de dibujo
(DRAW)
    // Argument (location)
    @ARG
    D=M
    @LOCATION
    M=D

    // Calculate memAddress = 16384 + location
    @SCREEN_BASE
    D=M
    @LOCATION
    A=M
    D=D+A
    @MEM_ADDRESS
    M=D

    // --- Column 0 ---
      // memAddress + 0
      @MEM_ADDRESS
      D=M
      @0
      A=D+A    // A = memAddress + 0
      D=A
      @R1
      M=D
      @R1
      A=M
      @65472     // -64 (Two's complement)
      D=A
      @R1
      A=M
      M=D

      // memAddress + 32
      @MEM_ADDRESS
      D=M
      @32
      A=D+A    // A = memAddress + 32
      D=A
      @R1
      M=D
      @R1
      A=M
      @32784     // -32656 (Two's complement)
      D=A
      @R1
      A=M
      M=D

      // memAddress + 64
      @MEM_ADDRESS
      D=M
      @64
      A=D+A    // A = memAddress + 64
      D=A
      @R1
      M=D
      @R1
      A=M
      @7180
      D=A
      @R1
      A=M
      M=D

      // memAddress + 96
      @MEM_ADDRESS
      D=M
      @96
      A=D+A    // A = memAddress + 96
      D=A
      @R1
      M=D
      @R1
      A=M
      @7172
      D=A
      @R1
      A=M
      M=D

      // memAddress + 128
      @MEM_ADDRESS
      D=M
      @128
      A=D+A    // A = memAddress + 128
      D=A
      @R1
      M=D
      @R1
      A=M
      @40966     // -25594 (Two's complement)
      D=A
      @R1
      A=M
      M=D

      // memAddress + 160
      @MEM_ADDRESS
      D=M
      @160
      A=D+A    // A = memAddress + 160
      D=A
      @R1
      M=D
      @R1
      A=M
      @57346    // -8190 (Two's complement)
      D=A
      @R1
      A=M
      M=D

      // memAddress + 192
      @MEM_ADDRESS
      D=M
      @192
      A=D+A    // A = memAddress + 192
      D=A
      @R1
      M=D
      @R1
      A=M
      @12291
      D=A
      @R1
      A=M
      M=D

      // memAddress + 224
      @MEM_ADDRESS
      D=M
      @224
      A=D+A    // A = memAddress + 224
      D=A
      @R1
      M=D
      @R1
      A=M
      @4097
      D=A
      @R1
      A=M
      M=D

      // memAddress + 256
      @MEM_ADDRESS
      D=M
      @256
      A=D+A    // A = memAddress + 256
      D=A
      @R1
      M=D
      @R1
      A=M
      @6145
      D=A
      @R1
      A=M
      M=D

      // memAddress + 288
      @MEM_ADDRESS
      D=M
      @288
      A=D+A    // A = memAddress + 288
      D=A
      @R1
      M=D
      @R1
      A=M
      @2049
      D=A
      @R1
      A=M
      M=D

      // memAddress + 320
      @MEM_ADDRESS
      D=M
      @320
      A=D+A    // A = memAddress + 320
      D=A
      @R1
      M=D
      @R1
      A=M
      @2049
      D=A
      @R1
      A=M
      M=D

      // memAddress + 352
      @MEM_ADDRESS
      D=M
      @352
      A=D+A    // A = memAddress + 352
      D=A
      @R1
      M=D
      @R1
      A=M
      @1025
      D=A
      @R1
      A=M
      M=D

      // memAddress + 384
      @MEM_ADDRESS
      D=M
      @384
      A=D+A    // A = memAddress + 384
      D=A
      @R1
      M=D
      @R1
      A=M
      @1025
      D=A
      @R1
      A=M
      M=D

      // memAddress + 416
      @MEM_ADDRESS
      D=M
      @416
      A=D+A    // A = memAddress + 416
      D=A
      @R1
      M=D
      @R1
      A=M
      @1025
      D=A
      @R1
      A=M
      M=D

      // memAddress + 448
      @MEM_ADDRESS
      D=M
      @448
      A=D+A    // A = memAddress + 448
      D=A
      @R1
      M=D
      @R1
      A=M
      @1025
      D=A
      @R1
      A=M
      M=D

      // memAddress + 480
      @MEM_ADDRESS
      D=M
      @480
      A=D+A    // A = memAddress + 480
      D=A
      @R1
      M=D
      @R1
      A=M
      @1025
      D=A
      @R1
      A=M
      M=D

      // memAddress + 512
      @MEM_ADDRESS
      D=M
      @512
      A=D+A    // A = memAddress + 512
      D=A
      @R1
      M=D
      @R1
      A=M
      @1025
      D=A
      @R1
      A=M
      M=D

      // memAddress + 544
      @MEM_ADDRESS
      D=M
      @544
      A=D+A    // A = memAddress + 544
      D=A
      @R1
      M=D
      @R1
      A=M
      @1026
      D=A
      @R1
      A=M
      M=D

      // memAddress + 576
      @MEM_ADDRESS
      D=M
      @576
      A=D+A    // A = memAddress + 576
      D=A
      @R1
      M=D
      @R1
      A=M
      @3074
      D=A
      @R1
      A=M
      M=D

      // memAddress + 608
      @MEM_ADDRESS
      D=M
      @608
      A=D+A    // A = memAddress + 608
      D=A
      @R1
      M=D
      @R1
      A=M
      @14340
      D=A
      @R1
      A=M
      M=D

      // memAddress + 640
      @MEM_ADDRESS
      D=M
      @640
      A=D+A    // A = memAddress + 640
      D=A
      @R1
      M=D
      @R1
      A=M
      @57356     // -8180 (Two's complement)
      D=A
      @R1
      A=M
      M=D

      // memAddress + 672
      @MEM_ADDRESS
      D=M
      @672
      A=D+A    // A = memAddress + 672
      D=A
      @R1
      M=D
      @R1
      A=M
      @24
      D=A
      @R1
      A=M
      M=D

      // memAddress + 704
      @MEM_ADDRESS
      D=M
      @704
      A=D+A    // A = memAddress + 704
      D=A
      @R1
      M=D
      @R1
      A=M
      @48
      D=A
      @R1
      A=M
      M=D

      // memAddress +

