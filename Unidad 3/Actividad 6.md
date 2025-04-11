# Actividad 6 
    #include "ofApp.h"
    
    Sphere::Sphere(float x, float y, float radius) : x(x), y(y), radius(radius) {
        color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
    }
    
    void Sphere::draw() {
        ofSetColor(color);
        ofDrawCircle(x, y, radius);
    }
    
    void Sphere::update(float x, float y) {
        this->x = x;
        this->y = y;
    }
    
    float Sphere::getRadius() {
        return radius;
    }
    
    float Sphere::getX() {
        return x;
    }
    
    float Sphere::getY() {
        return y;
    }
    
    //--------------------------------------------------------------
    void ofApp::setup() {
        ofBackground(0);
    
        for (int i = 0; i < 5; i++) {
            float x = ofRandomWidth();
            float y = ofRandomHeight();
            float radius = ofRandom(20, 50);
            spheres.push_back(new Sphere(x, y, radius));
        }
        selectedSphere = nullptr;
    
    }
    
    //--------------------------------------------------------------
    void ofApp::update() {
        if (selectedSphere != nullptr) {
            selectedSphere->update(ofGetMouseX(), ofGetMouseY());
        }
    }
    
    //--------------------------------------------------------------
    void ofApp::draw() {
        for (auto sphere : spheres) {
            sphere->draw();
        }
    }
    
    
    //--------------------------------------------------------------
    void ofApp::mouseMoved(int x, int y) {
    
    }
    
    //--------------------------------------------------------------
    void ofApp::mousePressed(int x, int y, int button) {
        if (button == OF_MOUSE_BUTTON_LEFT) {
            Sphere* newSelected = nullptr; // Es un puntero que temporalmente almacenara la nueva esfera seleccionada
    
            // Buscar la esfera mas cercana al clic
            for (auto sphere : spheres) {
                float distance = ofDist(x, y, sphere->getX(), sphere->getY());
                if (distance < sphere->getRadius()) {
                    newSelected = sphere;  // Asigna la nueva esfera seleccionada
                    break;
                }
            }
    
            // Cambiar de seleccion
            if (newSelected != selectedSphere) {
                selectedSphere = newSelected;
            }
            else {
                selectedSphere = nullptr; // Si es la misma, se deselecciona
            }
        }
    }
El problema es que no habia una funcion para que al oprimir de nuevo la esfera seleccionada se deseleccionara y tampoco se puede cambiar la esfera ya seleccionada. Para evitar esto se crea una funcion que tenga en cuenta 
Si se hace clic en el fondo o en la misma esfera seleccionada y reinicie la seleccion (selectedSphere = nullptr). 
