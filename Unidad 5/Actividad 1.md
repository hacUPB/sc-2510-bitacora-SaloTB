# Objetos y Clases en C++
Una clase en C++ es un modelo que define que datos (Atributos) va a tener un objeto y que operaciones (Metodos se pueden hacer con esos datos 
(La clase como tal no ocupa memoria hasta que se crea un objeto)

EN el ejemplo dado: 

    class Particle {
    public:
        float x, y; // Atributos: posicion de la particula
        void move(float dx, float dy) {  // Metodo: mover la particula
            x += dx;
            y += dy;
        }
    };

"x" y "y" son variables que guardan la posicion de la particula mientras que "move(dx, dy)" es una funcion que permite modificar "x" y "y" para
mover dicha particula

Por otro lado un Objeto es una instancia real en una clase, un ejemplo aplicado a la vida real de este concepto podria ser:

(Clase) Carro: Tiene: Ruedas, Manurio, Sillas...

(Objeto) Mi Carro: Un carro especifico 

Utilizando el ejemplo: 

    Particle p1;
    p1.x = 10;
    p1.y = 20;
    p1.move(5, -3);  // mueve p1 a (15,17)

    Particle p2;
    p2.x = 100;
    p2.y = 50;
    p2.move(-10, 5);  // p2 se moverá a (90,55)
p1 es un objeto creado a partir de Particle; al llamarse "p1.move(5, -3);", el objeto p1 modifica su propio "x" y "y" Ademas
cada objeto puede tener valores independientes.

En este caso Tanto "p1" como P2" son objetos diferentes que vienen de la misma clase.

## Objetos en la memoria
EN este caso tanto p1 como p2 estan almacenados en la memoria "stak" pues no se utilizo "new" ademas de esto cada objeto guarda su propia
copia de los atributos "x" y "y" 

Con la siguiente linea de codigo se da a entender que cada objeto ocupa 8 bytes 

    std::cout << "Tamaño de Particle: " << sizeof(Particle) << " bytes" << std::endl;
Se puede ademas saber que los atributos estan almacenados de morma contigua en la memoria con el siguinete codigo:

    std::cout << "Dirección de p1.x: " << &(p1.x) << std::endl;
    std::cout << "Dirección de p1.y: " << &(p1.y) << std::endl;

Esto porque ambos son float que ocupan 4 bytes cada uno lo que muestra por tanto que p1.y esta exactamente esos 4 bytes despues de p1.x

Cuando tenemos dos instancias su memoria tendra varias acracteristicas como: la memoria de los atributos de los objetos estan juntos a diferencia
de como los mismos objetos incluso si pertenecen a la msima clase no lo estan, en cambio pueden estar contiguos el uno con el otro y por tanto
cada uno tiene su propio espacio de memoria separado 

el tamaño del objeto habla de su estructura interna pues el "sizeof(Particle)" es la suma de sus atributos mas las posibles alineaciones, en este caso
se tiene el uso de dos "float" y por ende se ocupan 8 Bytes

## Analisis de diferencias
LAs variables estaticas son comartidas por todas las instancias de las clases, no pertenecen a un objeto individual y se almacenan en una zona especial de la memoria, generalmente en el segment de datos estatios
mientras que las variables dinamicas son punteros que apuntan a memoria asignada en tiempo de ejcucion, la memoria no forma parte directa del objeto en cambio se almacena en el heap y se accede mediante punteros.

en resumen: Las variables estaticas no aumentan el tamaño de cada objeto y existen una sola vez en memoria, sin importar cuantos objetos se creen.
En cambio las variables dinamicas: Solo agregan el espacio del puntero al objeto y los datos que apuntan estan fuera del objeto, en el heap.









