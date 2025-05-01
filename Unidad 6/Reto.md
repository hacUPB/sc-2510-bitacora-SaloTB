# Reto
Decidi crear un codigo que hiciera que dos esferas "Main" se movieran libremente rebotando por el espacio y que cuando a estas se les
toca con el mause comenzaran a poner mas esferas "hija" en la pantalla, si se oprime una letra, en este caso la "g" las dos juntas crearan 
estas particulas, la idea incial era que las particulas que crearan se movieran en la pantalla con las "main" pero al final solo son manchas 
en la pantalla. Fianlemnte todo se peude limpiar a exepcion de la sdos principales con otra letra, en este caso "c"

ofApp.cpp

    #include "ofApp.h"
    
    // ---------- Subject ----------
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
    
    // ---------- MainSphere ----------
    
    MainSphere::MainSphere() {
        position = ofVec2f(ofRandomWidth(), ofRandomHeight());
        velocity = ofVec2f(ofRandom(-2, 2), ofRandom(-2, 2));
        color = ofColor::white;
        currentState = new NormalState(); // Estado inicial
    }
    
    void MainSphere::update() {
        if (currentState) currentState->update(this);
    
        // Rebotar contra los bordes
        if (position.x < 0 || position.x > ofGetWidth()) velocity.x *= -1;
        if (position.y < 0 || position.y > ofGetHeight()) velocity.y *= -1;
    
        position += velocity;
    }
    
    void MainSphere::draw() {
        ofSetColor(color);
        ofDrawCircle(position, 20);
    
        for (const auto& c : children) {
            ofSetColor(100, 255, 100);
            ofDrawCircle(c, 5);
        }
    }
    
    void MainSphere::onNotify(const std::string& event) {
        if (event == "generate") {
            setState(new GeneratingState());
        }
        else if (event == "normal") {
            setState(new NormalState());
        }
        else if (event == "clear") {
            clearChildren();
        }
    }
    
    void MainSphere::setState(State* newState) {
        if (currentState) {
            currentState->onExit(this);
            delete currentState;
        }
        currentState = newState;
        if (currentState) currentState->onEnter(this);
    }
    
    void MainSphere::generateChildren() {
        for (int i = 0; i < 10; ++i) {
            ofVec2f offset(ofRandom(-20, 20), ofRandom(-20, 20));
            children.push_back(getPosition() + offset);
        }
    }
    
    void MainSphere::clearChildren() {
        children.clear();
    }
    
    ofVec2f MainSphere::getPosition() const {
        return position;
    }
    
    // ---------- Estado ----------
    
    void GeneratingState::onEnter(MainSphere* sphere) {
        sphere->generateChildren();
    }
    
    // ---------- Fábrica ----------
    MainSphere* SphereFactory::createSphere() {
        return new MainSphere();
    }
    
    // ---------- ofApp ----------
    void ofApp::setup() {
        ofBackground(0);
        for (int i = 0; i < 2; ++i) {
            MainSphere* s = SphereFactory::createSphere();
            spheres.push_back(s);
            addObserver(s);
        }
    }
    
    void ofApp::update() {
        for (auto* s : spheres) {
            s->update();
        }
    }
    
    void ofApp::draw() {
        for (auto* s : spheres) {
            s->draw();
        }
    }
    
    void ofApp::keyPressed(int key) {
        if (key == 'g') {
            notify("generate"); // ambas esferas generan al mismo tiempo
        }
        else if (key == 'c') {
            notify("clear");    // ambas limpian sus esferas pequeñas
        }
    }
    
    void ofApp::mouseMoved(int x, int y) {
        for (auto* s : spheres) {
            if (ofDist(x, y, s->getPosition().x, s->getPosition().y) < 20) {
                s->setState(new GeneratingState());
            }
        }
    }

  ofApp.h

      #pragma once
    
    #include "ofMain.h"
    #include <vector>
    #include <string>
    
    // Interface de Observer
    class Observer {
    public:
        virtual void onNotify(const std::string& event) = 0;
    };
    
    // Sujeto que maneja los observadores
    class Subject {
    public:
        void addObserver(Observer* observer);
        void removeObserver(Observer* observer);
    protected:
        void notify(const std::string& event);
    private:
        std::vector<Observer*> observers;
    };
    
    class MainSphere; // declaration para usar en State
    
    // Clase base para Estados
    class State {
    public:
        virtual void update(MainSphere* sphere) = 0;
        virtual void onEnter(MainSphere* sphere) {}
        virtual void onExit(MainSphere* sphere) {}
        virtual ~State() = default;
    };
    
    // Esfera principal que cambia de estado
    class MainSphere : public Observer {
    public:
        MainSphere();
    
        void update();
        void draw();
        void onNotify(const std::string& event) override;
        void setState(State* newState);
    
        void generateChildren();         // Genera esferas pequeñas
        void clearChildren();            // Elimina esferas pequeñas
        ofVec2f getPosition() const;     // Getter para la posicion
    
    private:
        ofVec2f position;
        ofVec2f velocity;
        State* currentState;
    public:
        std::vector<ofVec2f> children;
        ofColor color;
    };
    
    // Estado cuando genera esferas pequeñas
    class GeneratingState : public State {
    public:
        void onEnter(MainSphere* sphere) override;
    };
    
    // Fábrica para crear esferas
    class SphereFactory {
    public:
        static MainSphere* createSphere();
    };
    
    // Aplicación principal
    class ofApp : public ofBaseApp, public Subject {
    public:
        void setup();
        void update();
        void draw();
        void keyPressed(int key);
        void mouseMoved(int x, int y);
    
    private:
        std::vector<MainSphere*> spheres;
    };

## Video de funcionamiento 

https://www.canva.com/design/DAGmPdayfy8/mKwhE0Sx5jOX-KHqRevzPQ/edit?utm_content=DAGmPdayfy8&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton

(Es el segundo video)
