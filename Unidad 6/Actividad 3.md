# revisión de la teoría y caso de estudio

## Patron de fabrica 

### lo que entiendo

El patron de fabrica es una herramienta de diseño para permitirle al codigo tener varios objetos que estan basadosd en la misma interfaz o siguen la smismas intrucciones, se usa en especial para ayudar a los clientes a elegir
sinq ue se tengan que preocupar por como se crean. el ejemplo de la pagina me quedo muy claro pro ejemplo, una pagina que envia cosas, el cliente solo quiere que lo que pidio llegue al lugar destinado, pero hay varias formas de
que ese objeto llegue, por tierra o por agua, y de eso se encarga la fabrica, con la misma accion depedienod de caracteristicas extras del objeto lo enviara por diferentes medios. 

### Como aplicarlo a codigo

Utilice un ejemplo general para entender la base del patron fabrica:

Una blase base (interfaz comun):

    class Animal {
    public:
        virtual void speak() = 0; // Metodo que todos los animales implementaran
        virtual ~Animal() = default;
    };

  Varias clases hijas que heredan de la base:

      class Dog : public Animal {
    public:
        void speak() override { std::cout << "Guau!\n"; }
    };
    
    class Cat : public Animal {
    public:
        void speak() override { std::cout << "Miau!\n"; }
    };
Fabrica: Clase que tiene una funcion para crear objetos por ti

    class AnimalFactory {
    public:
        static Animal* createAnimal(const std::string& type) {
            if (type == "dog") return new Dog();
            else if (type == "cat") return new Cat();
            else return nullptr; // Si no se reconoce el tipo
        }
    };

gracias a esto el codigo que usa animales ya no tiene que preocuparse por como se crean:

    Animal* a = AnimalFactory::createAnimal("dog"); // polimorfismo
    a->speak(); // Dice: Guau!
    delete a;

### En el segundo punto




## Patron de observer

### lo que entiendo

El observer como su nombre lo indica se encarga de observar siertos objetos (sujetos) y cuando estos tengan un cambio este cambio sera notificado de inmeditao. el ejemplo dado de la subscripcion tambien es muy util para entender este
patron, facilita que solo llegue la 2notificacion" del objeto deseado que es el observado, al tiempo que permite que esa informacion llegue al punto adecuado. 

### Como aplicarlo a codigo
con un ejemplo general voy a entender la estructura base de el patron observer
Clase del observadorprincipal, cualquier clase que quiera observar un evento debe usar Onnotify:

    class Observer {
    public:
        virtual void onNotify(const std::string& event) = 0;
        virtual ~Observer() = default;
    };
Calse sujeto: tiene una lista de observadores que avisan cuando algo pasa 

    #include <vector>
    #include <algorithm>
    
    class Subject {
    private:
        std::vector<Observer*> observers;
    
    public:
        void addObserver(Observer* obs) {
            observers.push_back(obs);
        }
    
        void removeObserver(Observer* obs) {
            observers.erase(std::remove(observers.begin(), observers.end(), obs), observers.end());
        }
    
    protected:
        void notify(const std::string& event) {
            for (Observer* obs : observers) {
                obs->onNotify(event); // Aqui se notifica a todos los observadores
            }
        }
    };
logger seria la clase que escucha los eventos:

    #include <iostream>
    
    class Logger : public Observer {
    public:
        void onNotify(const std::string& event) override {
            std::cout << "Logger recibio el evento: " << event << std::endl;
        }
    };
La clase que genera los eventos que hereda del sujeto:
    
    class Button : public Subject {
    public:
        void click() {
            std::cout << "Boton clicado\n";
            notify("click");  // Notifica a los observadores que hubo un click
        }
    };

  su implementacion en Main:
  
      int main() {
        Button button;
        Logger logger;
    
        button.addObserver(&logger); // logger esta escuchando al boton
    
        button.click(); // Dispara el evento
        return 0;
    }

### En el segundo punto





## Patron de estado

### lo que entiendo

el patron de estado es similar a las maquinas de estado, cumplen la misma funcion de hacer que un minso boton pro ejemplo pueda cambair de estado y realizar diferentes acciones dependiendo del estado, la diferencia sin emabrgo es que
el patron de estado separa los estados por clases haciendo que el objeto cambie de clase y asi se evitan usar demasiados ocndicionales que puedan complicar el codigo y volverlo demasiado pesado y dificil de cambair en el futuro. 

### Como aplicarlo a codigo

Aqui utilizare un codigo generico para entender como funcionan los estados 

Se define la clase principal del estado, lo que puede hacer:

    class Context; // Se declara antes porque se usara dentro de State
    
    class State {
    public:
        virtual void handle(Context* context) = 0;
        virtual ~State() = default;
    };
Clase context, la que posee el estado:

    class Context {
    private:
        State* currentState; // puntero state a current state
    
    public:
        Context(State* initialState) : currentState(initialState) {} // genera el estado incial 
    
        void setState(State* newState) { // metodo que permite cambiar el estado del contexto
            currentState = newState;
        }
    
        void request() {
            currentState->handle(this);  // delega el comportamiento al estado actual
        }
    };

Clases genericas que representan diferentes estados:

    #include <iostream>
    
    class StateA : public State {
    public:
        void handle(Context* context) override;
    };
    
    class StateB : public State {
    public:
        void handle(Context* context) override;
    };

implementacion de los estados (acciones que realizaran)

    void StateA::handle(Context* context) {
        std::cout << "Estado A: haciendo algo... cambiando a Estado B\n";
        context->setState(new StateB());  // cambia de estado
    }
    
    void StateB::handle(Context* context) {
        std::cout << "Estado B: haciendo algo... cambiando a Estado A\n";
        context->setState(new StateA());  // cambia de estado
    }

Main (lo que se ejecuta)

    int main() {
        Context context(new StateA()); // empieza con el estado A
    
        context.request(); // Estado A maneja esto
        context.request(); // Ahora Estado B lo maneja
        context.request(); // Estado A de nuevo
    
        return 0;
    }

### En el segundo punto
