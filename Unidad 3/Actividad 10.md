# Reto
## OffApp.h
    
       #pragma once
    #include "ofMain.h"
    
    // MEMORIA GLOBAL 
    ofColor sphereColor = ofColor(2, 35, 0);
    
    class ofApp : public ofBaseApp {
    public:
        void setup();
        void update();
        void draw();
        void keyPressed(int key);
    
    private:
        ofEasyCam cam; // Stack (objeto de clase)
    
        //  Heap: punteros a glm::vec3
        vector<glm::vec3*> spherePointers;
    
        // Stack: Parametros para la cuadricula
        float distDiv = 100.0;
        float amplitud = 50.0;
        float xStep = 50, yStep = 50;
    
        bool sphereSelected = false;
        glm::vec3 selectedPosition;
    
        void convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd);
        bool rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint);
    
        void clearSpheres(); // Limpieza manual de heap
    };


## OfApp.cpp

       #include "ofApp.h"
    
    //--------------------------------------------------------------
    void ofApp::setup() {
        ofBackground(0);
        cam.setDistance(600);
    
        // Crear esferas en el HEAP 
        for (int x = -ofGetWidth() / 2; x < ofGetWidth() / 4; x += xStep) {
            for (int y = -ofGetHeight() / 2; y < ofGetHeight() / 6; y += yStep) {
                float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud; // Stack
                glm::vec3* pos = new glm::vec3(x, y, z); //  Heap
                spherePointers.push_back(pos);
            }
        }
    }
    
    //--------------------------------------------------------------
    void ofApp::draw() {
        cam.begin();
    
        ofSetColor(sphereColor); //  Global color
    
        for (auto& posPtr : spherePointers) {
            ofDrawSphere(*posPtr, 28); // Usamos el puntero → posPtr
        }
    
        if (sphereSelected) {
            ofSetColor(255, 0, 0);
            ofDrawSphere(selectedPosition, 12);
            ofDrawBitmapString("Selected Sphere Position: " + ofToString(selectedPosition), 20, 20);
        }
    
        cam.end();
    }
    
    //--------------------------------------------------------------
    void ofApp::update() {}
    
    //--------------------------------------------------------------
    void ofApp::keyPressed(int key) {
        if (key == OF_KEY_UP) amplitud += 5;
        if (key == OF_KEY_DOWN) amplitud -= 5;
        if (key == 'w') distDiv += 5;
        if (key == 's') distDiv -= 5;
        if (key == 'a') xStep -= 5, yStep -= 5;
        if (key == 'd') xStep += 5, yStep += 5;
    
        clearSpheres(); // Limpiar memoria del heap
        setup();        // Regenerar esferas
    }
    
    //--------------------------------------------------------------
    void ofApp::clearSpheres() {
        for (auto& ptr : spherePointers) {
            delete ptr;  // Liberar memoria manualmente
        }
        spherePointers.clear(); // Limpiar vector (stack)
    }
    
    //--------------------------------------------------------------
    void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd) {
        glm::mat4 modelview = cam.getModelViewMatrix();
        glm::mat4 projection = cam.getProjectionMatrix();
        ofRectangle viewport = ofGetCurrentViewport();
    
        float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
        float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;
    
        glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f);
        glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f);
    
        glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
        glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;
    
        rayStartWorld /= rayStartWorld.w;
        rayEndWorld /= rayEndWorld.w;
    
        rayStart = glm::vec3(rayStartWorld);
        rayEnd = glm::vec3(rayEndWorld);
    }
    
    //--------------------------------------------------------------
    bool ofApp::rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint) {
        glm::vec3 oc = rayStart - sphereCenter;
        float a = glm::dot(rayDir, rayDir);
        float b = 2.0f * glm::dot(oc, rayDir);
        float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;
        float discriminant = b * b - 4 * a * c;
    
        if (discriminant < 0) return false;
    
        float t = (-b - sqrt(discriminant)) / (2.0f * a);
        intersectionPoint = rayStart + t * rayDir;
        return true;
    }


    
![image](https://github.com/user-attachments/assets/563e1961-3c06-4648-95e4-4eb1a4fc8685)
https://www.canva.com/design/DAGgz_KljXc/Krhg17El5jim8dvdZtJ1Xg/edit?utm_content=DAGgz_KljXc&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton 

## Analicis
### Stack
Almacena variables locales y llamadas de funciones (son temporales); En este caso almacena:

cam (la cámara); distDiv, amplitud, xStep, yStep; sphereSelected, selectedPosition; variables locales como x, y, rayStart, rayEnd; porque no requieren compartirse entre funciones o clases, se destruyen automaticamente al finalizar el programa o el método y son pequeñas y rapidas de acceder.

### Heap
El heap se usa para asignación dinámica de memoria, lo que permite crear objetos en tiempo de ejecucion que persisten mas alla del alcance de la función en la que fueron creados. En otras palabras, es como un archivador donde se guardan datos que se quieren usar en cualquier momento:

Las posiciones de las esferas (std::vector<glm::vec3> spherePositions) se guardan aqui porque se usa un vector, que es como una caja que puede crecer o reducirse y asi tener mas control sobre ella

### Global/Estatica
Estos son los  datos que siempre estan disponibles:

Si una variable se define fuera de "setup()" o "draw()" (U otras funciones), siempre se podra acceder a ella en cualquier parte del código, en este caso decidi poner el color como variable global aunque no era obligatorio
hacerlo, unicmaente para tener una global
