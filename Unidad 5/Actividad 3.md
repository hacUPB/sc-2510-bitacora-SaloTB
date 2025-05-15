#  implementación Interna de Encapsulamiento, Herencia y Polimorfismo

## Profundizando en el encapsulamiento
El ncapsulamiento es una de las bases de la programacion orientada a objetos, su proposito es ocultar los detalles internos de una clase y controlar que puede acceder a ellos.

En C++ se hace usando:
private: solo la propia clase puede acceder.
protected: la clase y sus hijas pueden acceder.
public: cualquiera puede acceder.

Aunque los objetos aun ocupen un espacio de memoria lo que impide que se pueda acceder a ellos es el compilador el que bloquea el acceso a la hora de compilar dependiendo de como este 

## Hagamos un poco de hackers y rompamos el encapsulamiento

### Resultados del ejemplo para romper el encapsulamiento


### Preguntas 
Teniendo en cuenta el ejemplo realizado junto con la investigacion:

#### ¿Qué es el encapsulamiento y cuál es su propósito en la programación orientada a objetos?
El encapsulamiento en la programacion orientada a objetos es una herramienta para ocultar los datos internos de una clase, ademas permite que solo la clase a la que pertenece sea capaz de 
modificar las caracteristicas de este objeto, sin mencionar que da metodos como setters y getters que permiten acceder o modificar los datos. Todo esto con el proposito de proteger los datos y asegurarse
de que los objetos mantenmgan un estado valido, osea no dejqanod que otras partes del codigo lo modifiquen.

#### ¿Por qué es importante proteger los datos de una clase y restringir el acceso desde fuera de la misma?
Estos e hace como ya mencione antes para evitar modificaciones accidentales desd eotras partes del codigo, o que esto genere estados invalidos o inconsistentes. Como manteine todas las modificaciones restringidas
a un solo lugar es mucho mas facil mantener y mnodificar el objeto. (Todo a base de controlar el acceso)

#### ¿Qué significa reinterpret_cast y cómo afecta la seguridad del programa?
reinterpret_cast es una forma de romper la logica del problema que permite hacer cosas no establecidas en el mismo entre ellas el encapsulamiento, esto puede gerar problemas en la memoria hacer que el encapsulamiento desaparesca
y generar probelmas en la depuracion y en el mantenimiento

#### ¿Por qué crees que se pudo acceder a los miembros privados de MyClass en este experimento, a pesar de que el compilador normalmente lo impediría?
La razon es que en C++ la palabra private solo protege el acceso en el código fuente, es decir, el compilador prohibe escribir:

    std::cout << obj.secret1 << std::endl;  // ¡Error de compilación!
pero una vez que el programa es compilado lo que esta privados siguen estando almacenados de manera contigua en memoria, como si fueran public.

Al usar "reinterpret_cast", se accede a la direccion cruda de memoria, ignorando las reglas de acceso:

    int* ptrInt = reinterpret_cast<int*>(&obj);
Esta linea no pregunta al compilador si es valido o no solo fuerza a tratar la direccion del objeto como si fuera un int* y lee desde alli. Esto debido a que los moificadores como private o protected son renstricciones en 
tiempo de compilacion, no se ejecucion

#### ¿Cuáles podrían ser las consecuencias de utilizar técnicas como las mostradas en este experimento en un programa real?
Algunas de las consecuencias podrian ser 
Corromper datos internos accidentalmente si se escibe en vez de leer, comportamiento indefinido, bugs invisibles y dificiles de depurar y la seguridad comprometida de los objetos y los componentes de las clases. 

#### ¿Qué implicaciones tiene este experimento sobre la confianza en las barreras de encapsulamiento que proporciona C++?
El lenguaje confia en que el programador respete el encapsulamiento; no es una barrera de seguridad. Es una herramienta de organizacion del codigo, no un mecanismo de proteccion real.

## Herencia y la Relación en Memoria
La memoria de un objeto de una clase derivada se organiza de la siguiente manera: Primero se reservan los atributos que pertenecen a la clase base (Base) y luego, despues de ellos, se reservan los atributos que pertenecen
a la clase derivada (Derived). Esto teniendo en cuenta que primero se colocan todos los atributos de la clase base (de arriba hacia abajo en la jerarquia) y Despues se colocan los atributos de la clase derivada para asi
garantizar que si se accede a un objeto de tipo Derived a traves de un puntero a Base, siempre encontraras la parte base exactamente en la posicion esperada.

Por loq ue isguiendo esta logica si se genran mas niveles de herencia estos se organizaran de forma jerarquica. Esta jerarquia siendo importante pues C++ necesita garantizar que si se usa un puntero o referencia a una clase base, 
la subestructura de la base este en la misma posicion que si fuera un objeto base.

### Experimento

#### 1
    #include <iostream>
    
    class Base {
    public:
        int baseVar;
    };
    
    class Derived : public Base {
    public:
        int derivedVar;
    };
    
    int main() {
        Derived d;
    
        std::cout << "Dirección del objeto d:        " << &d << std::endl;
        std::cout << "Dirección de d.baseVar:        " << &(d.baseVar) << std::endl;
        std::cout << "Dirección de d.derivedVar:     " << &(d.derivedVar) << std::endl;
    
        return 0;
    }

EN este experimento se puede notar que: 

1. Derived hereda de Base, y por tanto, tiene todos los miembros de Base mas los suyos propios.
2. Derived contiene dos int: baseVar (de Base) y derivedVar (propio)
3. Se imprime la direccion en memoria del objeto completo (d) y la direccion de cada atributo individual


Se obtienen lso resultados: 

    Dirección del objeto d:        0x7ffeee30a010
    Dirección de d.baseVar:        0x7ffeee30a010
    Dirección de d.derivedVar:     0x7ffeee30a014

Donde se puede ver que: el objeto Derived comienza con los miembros de Base y luego 4 bytes luego que es lo que ocupa un int esta derivedVar

Con este experimento se puede evidenciar que un objeto de clase derivada contiene primero los datos de la clase base, y luego los suyos, ordenandose de forma jerarquica.

## Polimorfismo y Vtables en detalle

### ¿Cómo utiliza el programa las vtables para el polimorfismo? ¿Cuál es el impacto en el rendimiento?
Para que pueda haber polimorfismo se necesitan las Vtables que permiten que las llamadas se resuelvan en tiempo de compilacion, si se utiliza en ejecución, el programa accede al vptr del objeto, y este apunta a la vtable de la clase real
para que finalmente el metodo se busca en la vtable y se llame a la funcion correcta.

Con rspecto al rendimiento si no se usa el polimorfismo, osea se resuelve desde la compilacion y no la ejecucion esto puede llegar a ser mas rapido. 

### Experimentacion

    class Animal {
    public:
        virtual void makeSound() {
            std::cout << "Some generic sound" << std::endl;
        }
    };
    class Dog : public Animal {
    public:
        void makeSound() override {
            std::cout << "Bark" << std::endl;
        }
    };
    class Cat : public Animal {
    public:
        void makeSound() override {
            std::cout << "Meow" << std::endl;
        }
    };

Este codigo trabaja con una jerarquia de clases con un metodo virtual.

Algunas caracteristicas son: 

1. Aunque a1 y a2 son punteros a Animal, llaman al método correcto según el tipo real del objeto apuntado
2. se sigue la logica de una virtual table: "" a (Animal*) → accede a vptr → busca funcion → llama a Dog::makeSound ""
3. no se usa Vtable para los sonidos genericos y se resuelve en tiempo de compilacion 

        Animal* a = new Dog();
        a->makeSound();  // Metodo virtual
   
Ne esta parte en especifico la llamada al Makesaund no se resuleve en tiempo de compilacion lo que implica utilizar una vtable y por ende un puntero "fantasma" que aumentaria le tamaño del objeto unos cuantos bytes, lo que poria afectar al rendimiento.

