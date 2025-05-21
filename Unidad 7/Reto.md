## Reto 

### Cpp

    #include "ofApp.h"
    
    //--------------------------------------------------------------
    void ofApp::setup() {
        // Carga el shader 
        if (ofIsGLProgrammableRenderer()) {
            shader.load("shadersGL3/shader");
        }
        else {
            shader.load("shadersGL2/shader");
        }
    
        // Crea una malla tipo plano que se dibuja en la pantalla
        int planeWidth = ofGetWidth();
        int planeHeight = ofGetHeight();
        int planeGridSize = 20;
        int planeColumns = planeWidth / planeGridSize;
        int planeRows = planeHeight / planeGridSize;
        plane.set(planeWidth, planeHeight, planeColumns, planeRows, OF_PRIMITIVE_TRIANGLES);
    }
    
    //--------------------------------------------------------------
    void ofApp::update() {
      
    }
    
    //--------------------------------------------------------------
    void ofApp::draw() {
        shader.begin();
    
        // Centro de la pantalla
        float cx = ofGetWidth() / 2.0f;
        float cy = ofGetHeight() / 2.0f;
    
        // Coordenadas del mouse 
        float mx = mouseX - cx;
        float my = mouseY - cy;
    
        // se pasan uniformes al shader
        shader.setUniform2f("mousePos", mx, my);          // posicion del mouse
        shader.setUniform1f("mouseRange", 150.0f);        // rango de influencia
        shader.setUniform1f("time", ofGetElapsedTimef()); // tiempo global
        shader.setUniform4f("baseColor", 1.0, 0.0, 0.5, 1.0); // color base (rosado)
    
        // centrar el plano
        ofTranslate(cx, cy);
        plane.draw();
    
        shader.end();
    }


### .h

    #pragma once
    
    #include "ofMain.h"
    
    class ofApp : public ofBaseApp {
    public:
        void setup();
        void update();
        void draw();
        void mousePressed(int x, int y, int button);
    
        ofShader shader;             // Shader que se usa
        ofPlanePrimitive plane;      // Malla tipo plano que se dibuja en la pantalla
    };


### Main

    #include "ofMain.h"
    #include "ofApp.h"
    
    //========================================================================
    int main() {
        ofGLWindowSettings settings;
        settings.setGLVersion(3, 2); // OpenGL 3.2 para shadersGL3
        settings.setSize(1024, 768);
    
        ofCreateWindow(settings);
        return ofRunApp(new ofApp());
    }


### vertex shader 

    // shader.vert
    OF_GLSL_SHADER_HEADER
    
    // Uniformes recibidos desde C++
    uniform mat4 modelViewProjectionMatrix;
    in vec4 position;
    
    uniform vec2 mousePos;
    uniform float mouseRange;
    
    void main() {
        vec4 pos = position;
    
        // direccion desde el mouse hasta el vertice
        vec2 dir = pos.xy - mousePos;
    
        // se calcula lamdistancia y se hace una pequeña deforaicon
        float dist = length(dir);
        if(dist < mouseRange) {
            float strength = (mouseRange - dist) / mouseRange;
            dir *= strength * 0.5;
            pos.xy += dir;
        }
    
        gl_Position = modelViewProjectionMatrix * pos;
    }


### fragmnet srahder 

    // shader.frag
    OF_GLSL_SHADER_HEADER
    
    uniform vec4 baseColor;
    uniform vec2 mousePos;
    uniform float mouseRange;
    uniform float time;
    
    out vec4 outputColor;
    
    void main() {
        // Coordenadas de la pantalla
        vec2 st = gl_FragCoord.xy - mousePos;
        float dist = length(st);
    
        // Calcular intensidad segun distancia al mouse
        float intensity = smoothstep(mouseRange, 0.0, dist);
    
        // Efecto parpadeante con el tiempo
        float pulse = 0.5 + 0.5 * sin(time * 3.0);
    
        // Color final
        vec3 color = mix(baseColor.rgb, vec3(0.0, 1.0, 1.0), intensity) * pulse;
        outputColor = vec4(color, 1.0);
    }

### Video
https://www.canva.com/design/DAGoGGeZw68/cRE9mNV3z7Ro-Cct00ZCiQ/edit?utm_content=DAGoGGeZw68&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton
