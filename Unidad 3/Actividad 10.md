# Reto
## OffApp.h

    #pragma once
    #include "ofMain.h"
    
    class ofApp : public ofBaseApp {
    public:
        void setup();
        void update();
        void draw();
        void keyPressed(int key);
    
    private:
        // Cámara 3D
        ofEasyCam cam;
    
        // Vector con posiciones de las esferas
        vector<glm::vec3> spherePositions;
    
        // Parámetros para la distribución de esferas
        float distDiv = 100.0;
        float amplitud = 50.0;
        float xStep = 50, yStep = 50;
    
        // Para manejar la selección de esferas
        bool sphereSelected = false;
        glm::vec3 selectedPosition;
    
        void convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd);
        bool rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint);
    
    };

## OfApp.cpp

    #include "ofApp.h"
    
    vector<glm::vec3> spherePositions; // Vector de posiciones de las esferas
    float distDiv = 100.0;   // Controla la curvatura del patrón
    float amplitud = 50.0;   // Amplitud del desplazamiento en Z
    float xStep = 50, yStep = 50; // Distancia entre esferas en X e Y
    
    ///////////////////////////////////////////////
    
    void ofApp::setup() {
        ofBackground(0);
        cam.setDistance(600); // Posicionar la cámara en el espacio
    
        // Crear la cuadrícula de esferas
        for (int x = -ofGetWidth() / 2; x < ofGetWidth() / 4; x += xStep) {
            for (int y = -ofGetHeight() / 2; y < ofGetHeight() / 6; y += yStep) {
                float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud; // Cálculo de la posición en Z (posicion de la curvatura)
                spherePositions.push_back(glm::vec3(x, y, z)); // Almacenar posición
            }
        }
    }
    
    ///////////////////////////////////////////////
    
    void ofApp::draw() {
        cam.begin(); // Activar la cámara
    
        ofSetColor(2, 35, 0); // Color para las esferas, RGB
        for (auto& pos : spherePositions) {
            ofDrawSphere(pos, 28); // radio de la esfera 
        }
    
        // Dibujar información de la esfera seleccionada
        if (sphereSelected) {
            ofSetColor(255, 0, 0); // Color para la esfera seleccionada
            ofDrawSphere(selectedPosition, 12);
    
            // Mostrar información en pantalla
            ofDrawBitmapString("Selected Sphere Position: " + ofToString(selectedPosition), 20, 20);
        }
    
        cam.end(); // Desactivar la cámara
    }
    
    ///////////////////////////////////////////////
    
    void ofApp::keyPressed(int key) {
        if (key == OF_KEY_UP) amplitud += 5;
        if (key == OF_KEY_DOWN) amplitud -= 5;
        if (key == 'w') distDiv += 5;
        if (key == 's') distDiv -= 5;
        if (key == 'a') xStep -= 5, yStep -= 5;
        if (key == 'd') xStep += 5, yStep += 5;
    
        spherePositions.clear(); // Volver a generar la cuadrícula con los nuevos valores
        setup();
    }
    ///////////////////////////////////////////////
    
    void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd) {
        // Obtener matrices de proyección y modelo/vista de la cámara
        glm::mat4 modelview = cam.getModelViewMatrix();
        glm::mat4 projection = cam.getProjectionMatrix();
        ofRectangle viewport = ofGetCurrentViewport();
    
        // Convertir coordenadas del mouse a Normalized Device Coordinates (NDC)
        float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
        float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;
    
        // Crear el rayo en NDC
        glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f); // Near plane
        glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f);   // Far plane
    
        // Convertir a coordenadas mundiales
        glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
        glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;
    
        rayStartWorld /= rayStartWorld.w;
        rayEndWorld /= rayEndWorld.w;
    
        rayStart = glm::vec3(rayStartWorld);
        rayEnd = glm::vec3(rayEndWorld);
    }
    
    // Detectar si el rayo intersecta una esfera
    bool ofApp::rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint) {
        glm::vec3 oc = rayStart - sphereCenter;
    
        float a = glm::dot(rayDir, rayDir);
        float b = 2.0f * glm::dot(oc, rayDir);
        float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;
    
        float discriminant = b * b - 4 * a * c;
    
        if (discriminant < 0) {
            return false;
        }
        else {
            float t = (-b - sqrt(discriminant)) / (2.0f * a);
            intersectionPoint = rayStart + t * rayDir;
            return true;
        }
    }
    
    void ofApp::update() {
        
    }

    
![image](https://github.com/user-attachments/assets/563e1961-3c06-4648-95e4-4eb1a4fc8685)

## Falta analicis y pegar el video 
