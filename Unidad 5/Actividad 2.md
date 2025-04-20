# Ubicacion en memodia de datos y metodos

## Metodos virtuales y Vtable
un metodo virtual es un metodo de una clase base que puede ser reescrito o redefinido en las clases derivadas y "vtable" o "Virtual Table" 
se utiliza para gestionar la llamada de la version correcta del metodo.

Al crear una clase con metodos virtuales se crea la Vtable (Una tabla de punteros o funciones) para la clase y Cada objeto de esa clase guarda 
un puntero oculto a la vtable. 

Como ejemplos:

    class Derived : public Base {
    public:
        void display() override {
            std::cout << "Derived display" << std::endl;
        }
    };

Si se tiene una variable de tipo Base* o Base& apuntando a un Derived, la llamada a display() ira a la version correcta de Derived 
usando esa vtable. (Derived tambien tendra su propia vtable)

    Base b;
    Derived d;
    std::cout << "Vtable de Base: " << *(void**)&b << std::endl;
    std::cout << "Vtable de Derived: " << *(void**)&d << std::endl;

En este ejemplo se puede ver como toma la dirección de b y d forzandola a void** y desreferenciandola para asi dar la dirección de la vtable 
para cada objeto. Demostrando que ambos objetos contienen un puntero oculto que apunta a su tabla de metodos virtuales, y que dependiendo
de su tipo, el puntero es diferente.

### ¿Donde se almacenan las vtables?

Las vtables se guardan en el segmento de datos globales del programa (igual que las variables estaticas, funciones y constantes), ademas cada 
clase que tenga al menos un metodo virtual tendra su propia vtable y cada objeto de esa clase guarda un puntero a esa vtable en su primer espacio 
de memoria.

###  ¿Afecta esto el tamaño de un objeto?
si, en una clase sin metodos virtuales, solo se ocupa espacio por sus atributos y ademas siempre tendra +1 puntero oculto 

### ¿Qué papel juegan las vtables en el polimorfismo?
Permiten que la funcion a llamar se determine en tiempo de ejecucion, en lugar de en tiempo de compilacion, lo que permite una mayor flexibilidad
en el comportamiento de los objetos.



