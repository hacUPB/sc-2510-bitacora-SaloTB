# Reto 3 
Vas a implementar y simular una modificación al reto 20 de la unidad anterior. Si se presiona la letra “d” muestras la imagen que diseñaste en el reto 18. Si no se presiona ninguna tecla, borrarás la imagen.

    // LIMPIAR 
    @LIMPIAR
    D=M
    D;JNE


    // Letra d
     
    
    // Constants
    @SCREEN         // Base address of the screen
    D=A
    @SCREEN_BASE
    M=D             // Store screen base address
    
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
    
      // memAddress + 736
      @MEM_ADDRESS
      D=M
      @736
      A=D+A    // A = memAddress + 736
      D=A
      @R1
      M=D
      @R1
      A=M
      @224
      D=A
      @R1
      A=M
      M=D
    
      // memAddress + 768
      @MEM_ADDRESS
      D=M
      @768
      A=D+A    // A = memAddress + 768
      D=A
      @R1
      M=D
      @R1
      A=M
      @65280     // -256 (Two's complement)
      D=A
      @R1
      A=M
      M=D
    
    // --- Column 1 ---
      // memAddress + 33
      @MEM_ADDRESS
      D=M
      @33
      A=D+A    // A = memAddress + 33
      D=A
      @R1
      M=D
      @R1
      A=M
      @7
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @65
      A=D+A    // A = memAddress + 65
      D=A
      @R1
      M=D
      @R1
      A=M
      @12
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @97
      A=D+A    // A = memAddress + 97
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
    
      @MEM_ADDRESS
      D=M
      @129
      A=D+A    // A = memAddress + 129
      D=A
      @R1
      M=D
      @R1
      A=M
      @31
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @161
      A=D+A    // A = memAddress + 161
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
    
      @MEM_ADDRESS
      D=M
      @225
      A=D+A    // A = memAddress + 225
      D=A
      @R1
      M=D
      @R1
      A=M
      @1022
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @257
      A=D+A    // A = memAddress + 257
      D=A
      @R1
      M=D
      @R1
      A=M
      @1539
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @289
      A=D+A    // A = memAddress + 289
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
    
      @MEM_ADDRESS
      D=M
      @321
      A=D+A    // A = memAddress + 321
      D=A
      @R1
      M=D
      @R1
      A=M
      @1161
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @353
      A=D+A    // A = memAddress + 353
      D=A
      @R1
      M=D
      @R1
      A=M
      @1137
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @385
      A=D+A    // A = memAddress + 385
      D=A
      @R1
      M=D
      @R1
      A=M
      @1137
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @417
      A=D+A    // A = memAddress + 417
      D=A
      @R1
      M=D
      @R1
      A=M
      @1027
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @449
      A=D+A    // A = memAddress + 449
      D=A
      @R1
      M=D
      @R1
      A=M
      @1419
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @481
      A=D+A    // A = memAddress + 481
      D=A
      @R1
      M=D
      @R1
      A=M
      @1501
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @513
      A=D+A    // A = memAddress + 513
      D=A
      @R1
      M=D
      @R1
      A=M
      @1655
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @545
      A=D+A    // A = memAddress + 545
      D=A
      @R1
      M=D
      @R1
      A=M
      @1536
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @577
      A=D+A    // A = memAddress + 577
      D=A
      @R1
      M=D
      @R1
      A=M
      @128
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @609
      A=D+A    // A = memAddress + 609
      D=A
      @R1
      M=D
      @R1
      A=M
      @192
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @641
      A=D+A    // A = memAddress + 641
      D=A
      @R1
      M=D
      @R1
      A=M
      @255
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @673
      A=D+A    // A = memAddress + 673
      D=A
      @R1
      M=D
      @R1
      A=M
      @96
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @705
      A=D+A    // A = memAddress + 705
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
    
      @MEM_ADDRESS
      D=M
      @737
      A=D+A    // A = memAddress + 737
      D=A
      @R1
      M=D
      @R1
      A=M
      @14
      D=A
      @R1
      A=M
      M=D
    
      @MEM_ADDRESS
      D=M
      @769
      A=D+A    // A = memAddress + 769
      D=A
      @R1
      M=D
      @R1
      A=M
      @1
      D=A
      @R1
      A=M
      M=D
      
    (LIMPIAR)
    @

    
    // End
    (END)
      @END
      0;JMP
