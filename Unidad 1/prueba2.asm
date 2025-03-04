// Dirección base de la pantalla
@16384
D=A           // D = 16384

// Calcular dirección de la fila 3
@96           // 3 × 32 = 96
D=D+A         // Dirección de la fila 3
A=D           // A apunta a la posición en la memoria

// Leer el valor actual de la memoria
D=M           // D = contenido de la dirección 16480

// Encender el bit 5 usando OR con 32 (0000000000100000)
@32
D=D|A         // OR con 32 para encender el bit 5

// Guardar el nuevo valor en la memoria
@16480
M=D           // Escribir el nuevo valor con el píxel encendido
