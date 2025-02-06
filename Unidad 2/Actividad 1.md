# ¿Qué es la entrada-salida mapeada a memoria?
Un sistema de entrada/salida (E/S) mapeada en memoria es una técnica en la que los dispositivos periféricos, como teclados, impresoras o discos duros, se integran directamente en el espacio de direcciones de memoria de una computadora. Esto significa que la CPU puede comunicarse con estos dispositivos utilizando las mismas instrucciones que emplea para acceder a la memoria, sin necesidad de instrucciones especiales.

En este esquema, se asignan direcciones específicas dentro del espacio de memoria para cada dispositivo de E/S. Cuando la CPU desea interactuar con un periférico, lee o escribe en estas direcciones designadas, y el dispositivo correspondiente responde a esas operaciones. Por ejemplo, escribir en una dirección de memoria particular podría enviar datos a una impresora, mientras que leer de otra dirección podría obtener datos de un teclado.

# ¿Cómo se implementa en la plataforma Hack?
En la plataforma Hack, la entrada/salida (E/S) mapeada en memoria se implementa asignando direcciones específicas del espacio de memoria a dispositivos de E/S, como la pantalla y el teclado. Esto permite que la CPU interactúe con estos periféricos utilizando las mismas instrucciones que emplea para acceder a la memoria.

## Implementación en la plataforma Hack:

Pantalla: Cada posición de memoria representa un píxel en la pantalla; al escribir un valor en estas direcciones, se controla el estado de los píxeles, permitiendo dibujar en la pantalla.

Teclado: Al leer esta posición de memoria, se puede determinar qué tecla se ha presionado, facilitando la interacción con el usuario.

# Inventa un programa que haga uso de la entrada-salida mapeada a memoria.


# Investiga el funcionamiento del programa con el simulador.
