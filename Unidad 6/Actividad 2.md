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

ofApp.h

    #pragma once
    
    #include "ofMain.h"
    #include <vector>
    #include <string>
    
    class Observer {
    public:
        virtual void onNotify(const std::string& event) = 0;
    };
    
    class Subject {
    public:
        void addObserver(Observer* observer);
        void removeObserver(Observer* observer);
    protected:
        void notify(const std::string& event);
    private:
        std::vector<Observer*> observers;
    };
    
    class Particle;
    
    class State {
    public:
        virtual void update(Particle* particle) = 0;
        virtual void onEnter(Particle* particle) {}
        virtual void onExit(Particle* particle) {}
        virtual ~State() = default;
    };
    
    class Particle : public Observer {
    public:
        Particle();
        ~Particle();
    
        void update();
        void draw();
        void onNotify(const std::string& event) override;
        void setState(State* newState);
    
        ofVec2f position;
        ofVec2f velocity;
        float size;
        ofColor color;
    
    private:
        State* state;
    };
    
    class NormalState : public State {
    public:
        void update(Particle* particle) override;
        void onEnter(Particle* particle) override;
    };
    
    class AttractState : public State {
    public:
        void update(Particle* particle) override;
    };
    
    class RepelState : public State {
    public:
        void update(Particle* particle) override;
    };
    
    class StopState : public State {
    public:
        void update(Particle* particle) override;
    };
    
    class BlinkState : public State {
    public:
        void update(Particle* particle) override;
    };
    
    class ParticleFactory {
    public:
        static Particle* createParticle(const std::string& type);
    };
    
    class ofApp : public ofBaseApp, public Subject {
    public:
        void setup();
        void update();
        void draw();
        void keyPressed(int key);
    private:
        std::vector<Particle*> particles;
    };

ofApp.cpp

    #include "ofApp.h"
    #include <algorithm>
    
    void Subject::addObserver(Observer* observer) {
        observers.push_back(observer);
    }
    
    void Subject::removeObserver(Observer* observer) {
        observers.erase(std::remove(observers.begin(), observers.end(), observer), observers.end());
    }
    
    void Subject::notify(const std::string& event) {
        for (Observer* observer : observers) {
            observer->onNotify(event);
        }
    }
    
    //-----------------------------
    // PARTICLE IMPLEMENTATION
    
    Particle::Particle() {
        position = ofVec2f(ofRandomWidth(), ofRandomHeight());
        velocity = ofVec2f(ofRandom(-0.5f, 0.5f), ofRandom(-0.5f, 0.5f));
        size = ofRandom(2, 5);
        color = ofColor(255);
        state = new NormalState();
    }
    
    Particle::~Particle() {
        delete state;
    }
    
    void Particle::setState(State* newState) {
        if (state != nullptr) {
            state->onExit(this);
            delete state;
        }
        state = newState;
        if (state != nullptr) {
            state->onEnter(this);
        }
    }
    
    void Particle::update() {
        if (state != nullptr) {
            state->update(this);
        }
        if (position.x < 0 || position.x > ofGetWidth()) velocity.x *= -1;
        if (position.y < 0 || position.y > ofGetHeight()) velocity.y *= -1;
    }
    
    void Particle::draw() {
        ofSetColor(color);
        ofDrawCircle(position, size);
    }
    
    void Particle::onNotify(const std::string& event) {
        if (event == "attract") {
            setState(new AttractState());
        }
        else if (event == "repel") {
            setState(new RepelState());
        }
        else if (event == "stop") {
            setState(new StopState());
        }
        else if (event == "normal") {
            setState(new NormalState());
        }
        else if (event == "blink") {
            setState(new BlinkState());
        }
    }
    
    //-----------------------------
    // STATES IMPLEMENTATION
    
    void NormalState::update(Particle* particle) {
        particle->position += particle->velocity;
    }
    
    void NormalState::onEnter(Particle* particle) {
        particle->velocity = ofVec2f(ofRandom(-0.5f, 0.5f), ofRandom(-0.5f, 0.5f));
    }
    
    void AttractState::update(Particle* particle) {
        ofVec2f mousePosition(((ofApp*)ofGetAppPtr())->mouseX, ((ofApp*)ofGetAppPtr())->mouseY);
        ofVec2f direction = mousePosition - particle->position;
        direction.normalize();
        particle->velocity += direction * 0.05;
        ofClamp(particle->velocity.x, -3, 3);
        particle->position += particle->velocity * 0.2;
    }
    
    void RepelState::update(Particle* particle) {
        ofVec2f mousePosition(((ofApp*)ofGetAppPtr())->mouseX, ((ofApp*)ofGetAppPtr())->mouseY);
        ofVec2f direction = particle->position - mousePosition;
        direction.normalize();
        particle->velocity += direction * 0.05;
        ofClamp(particle->velocity.x, -3, 3);
        particle->position += particle->velocity * 0.2;
    }
    
    void StopState::update(Particle* particle) {
        particle->velocity.set(0, 0);
    }
    
    void BlinkState::update(Particle* particle) {
        particle->color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
        particle->position += particle->velocity * 0.5;
    }
    
    //-----------------------------
    // PARTICLE FACTORY
    
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
        else if (type == "comet") {
            particle->size = ofRandom(6, 10);
            particle->color = ofColor(255, 255, 255);
            particle->velocity = ofVec2f(ofRandom(-1.5f, 1.5f), ofRandom(-1.5f, 1.5f));
        }
    
        return particle;
    }
    
    //-----------------------------
    // OFAPP IMPLEMENTATION
    
    void ofApp::setup() {
        ofBackground(0);
    
        for (int i = 0; i < 100; ++i) {
            Particle* p = ParticleFactory::createParticle("star");
            particles.push_back(p);
            addObserver(p);
        }
    
        for (int i = 0; i < 5; ++i) {
            Particle* p = ParticleFactory::createParticle("shooting_star");
            particles.push_back(p);
            addObserver(p);
        }
    
        for (int i = 0; i < 10; ++i) {
            Particle* p = ParticleFactory::createParticle("planet");
            particles.push_back(p);
            addObserver(p);
        }
    
        for (int i = 0; i < 5; ++i) {
            Particle* p = ParticleFactory::createParticle("comet");
            particles.push_back(p);
            addObserver(p);
        }
    }
    
    void ofApp::update() {
        for (Particle* p : particles) {
            p->update();
        }
    }
    
    void ofApp::draw() {
        for (Particle* p : particles) {
            p->draw();
        }
    }
    
    void ofApp::keyPressed(int key) {
        if (key == 's') {
            notify("stop");
        }
        else if (key == 'a') {
            notify("attract");
        }
        else if (key == 'r') {
            notify("repel");
        }
        else if (key == 'n') {
            notify("normal");
        }
        else if (key == 'b') {
            notify("blink");
        }
    }
    
### Imagen antes de los cambios:

![image](https://github.com/user-attachments/assets/741e42af-2e1e-4de8-af03-41d4304cfa07)

### Despues de los cambios:

https://www.canva.com/design/DAGmPdayfy8/mKwhE0Sx5jOX-KHqRevzPQ/edit?utm_content=DAGmPdayfy8&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton 

## Explicacion de cmbios
Agregue un nuevo estado llamado "Blinktate" en el que se simulaun "parpadeo" de las particulas cambiandola srapidanmente de color

offApp.h

    class BlinkState : public State {
    public:
        void update(Particle* particle) override;
    };

offApp.cpp

    void BlinkState::update(Particle* particle) {
        // Cambia color aleatoriamente
        particle->color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
        particle->position += particle->velocity * 0.5;
    }
Esta parte del codigo es la que se encarga de cambair el color de forma aleatoria y disminuye la velocidad de la particula

Finalmente se agrega el nuevo estado a notify y la nueva tecla que sera la que active este estado en key:pressed 

    else if (event == "blink") {
        setState(new BlinkState());
    }

    else if (key == 'b') {
        notify("blink");
    }

Tambien demas de este estado aregue un nuevo tipo de particula llamada "Comet" haciendo refernecia a su vlocidad superior coparada a las otras particulas, para esto agregue en "ParticleFactory::createParticle" lo siguiente:

    else if (type == "comet") {
        particle->size = ofRandom(6, 10);
        particle->color = ofColor(255, 255, 255);
        particle->velocity = ofVec2f(ofRandom(-1.5f, 1.5f), ofRandom(-1.5f, 1.5f));
    }
Aqui se deterina su velocidad, color incial antes del blink y su tamaño (Ciendo superior a las demas particulas tambien)

se crean los cometas en setup() (Se crean 5)

    for (int i = 0; i < 5; ++i) {
        Particle* p = ParticleFactory::createParticle("comet");
        particles.push_back(p);
        addObserver(p);
    }




