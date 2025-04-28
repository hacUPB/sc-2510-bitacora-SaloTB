# análisis de un caso de estudio

## Observer en el codigo

    class Observer {
    public:
        virtual void onNotify(const std::string& event) = 0;
    };
Esta parte del codigo define la clase y la interfaz que todos los observadores deberan de seguir 

    void Subject::addObserver(Observer* observer) {
        observers.push_back(observer);
    }
    
    void Subject::notify(const std::string& event) {
        for (Observer* observer : observers) {
            observer->onNotify(event);
        }
    }
En esta parte se puede ver uan lista de observers que avisan con (Notify) cuando pasa algo 

    void Particle::onNotify(const std::string& event) {
        if (event == "attract") { setState(new AttractState()); }
        else if (event == "repel") { setState(new RepelState()); }
        else if (event == "stop") { setState(new StopState()); }
        else if (event == "normal") { setState(new NormalState()); }
    }

Implementacion de observer en la particula donde cada una de estas particuals cambia su estado dependiedo del evento que recibe

    void ofApp::keyPressed(int key) {
        if (key == 's') { notify("stop"); }
        else if (key == 'a') { notify("attract"); }
        else if (key == 'r') { notify("repel"); }
        else if (key == 'n') { notify("normal"); }
    }

Se genera el cambio de comportamiento en las particulas cuando se oprime una tecla (Se enteran gracias a los observers)

## Factory en el codigo
    class ParticleFactory {
    public:
        static Particle* createParticle(const std::string& type);
    };

Al igual que con el observer se crea una clase tipo Factory para definir la interfaz que en este caso se encargara de crear las particulas 

    Particle* ParticleFactory::createParticle(const std::string& type) {
        Particle* particle = new Particle();
        if (type == "star") {
            particle->size = ofRandom(2, 4);
            particle->color = ofColor(255, 0, 0);
        }
        else if (type == "shooting_star") {
            particle->size = ofRandom(3, 6);
            particle->color = ofColor(0, 255, 0);
            particle->velocity *= 3;
        }
        else if (type == "planet") {
            particle->size = ofRandom(5, 8);
            particle->color = ofColor(0, 0, 255);
        }
        return particle;
    }

Este es el codigo de implementacion que permite que segun el Type implementado se configuarran propiedades difernetes gracias al factory

    for (int i = 0; i < 100; ++i) {
        Particle* p = ParticleFactory::createParticle("star");
        particles.push_back(p);
        addObserver(p);
    }
    
Finalmente auqi se llama al factory para poder crear mucho objetos diferentes facilmente (Se usa en ofApp::setup:)

## Estatus en el codigo

    class State {
    public:
        virtual void update(Particle* particle) = 0;
        virtual void onEnter(Particle* particle) {}
        virtual void onExit(Particle* particle) {}
        virtual ~State() = default;
    };
Esta es la interfas base para definir el comportamiento de cada estado para asi cambiar su estado en el compilamiento de forma dinamica y mas sencilla

    void NormalState::update(Particle* particle) {
        particle->position += particle->velocity;
    }
Nomral state, usado en el codigo para el movimeinto 

    void AttractState::update(Particle* particle) {
        ofVec2f mousePosition(((ofApp*)ofGetAppPtr())->mouseX, ((ofApp*)ofGetAppPtr())->mouseY);
        ofVec2f direction = mousePosition - particle->position;
        direction.normalize();
        particle->velocity += direction * 0.05;
        particle->position += particle->velocity * 0.2;
    }
Atract state, este estado contorla el movimiento implementando la posicion y la atraccion al mause 

    void RepelState::update(Particle* particle) {
        ofVec2f mousePosition(((ofApp*)ofGetAppPtr())->mouseX, ((ofApp*)ofGetAppPtr())->mouseY);
        ofVec2f direction = particle->position - mousePosition;
        direction.normalize();
        particle->velocity += direction * 0.05;
        particle->position += particle->velocity * 0.2;
    }

repele state, este estado controla el movimiento implementando la posicion y la repulsion al mause

    void StopState::update(Particle* particle) {
        particle->velocity.x = 0;
        particle->velocity.y = 0;
    }
stop state, estado que detiene la particula 

    void Particle::update() {
        if (state != nullptr) {
            state->update(this);
        }
    }
Cuando la particula se actualiza se delega la logica a su estado actual

## Cambios al codigo
