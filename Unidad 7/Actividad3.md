# Actividad 3 
## ¿Qué es un uniform?
Los uniforms son valores constantes enviados al shader para determinar ciertas caracteristicas del mismo, en otras palabras son variables que permiten modificar el shader sin necesidad de modificar su codigo directamente.
## ¿Cómo funciona el código de aplicación, los shaders y cómo se comunican estos?
    //--------------------------------------------------------------
    void ofApp::setup() {
    	if (ofIsGLProgrammableRenderer()) {
    		shader.load("shadersGL3/shader");
    	}
    	else {
    		shader.load("shadersGL2/shader");
    	}
    
    	float planeScale = 0.68;
    	int planeWidth = ofGetWidth() * planeScale;
    	int planeHeight = ofGetHeight() * planeScale;
    	int planeGridSize = 30;
    	int planeColums = planeWidth / planeGridSize;
    	int planeRows = planeHeight / planeGridSize;
    
    	plane.set(planeWidth, planeHeight, planeColums, planeRows, OF_PRIMITIVE_TRIANGLES);
    }
    
    //--------------------------------------------------------------
    void ofApp::update() {
    
    }
    
    //--------------------------------------------------------------
    void ofApp::draw() {
    
    	float percentX = mouseX / (float)ofGetWidth();
    	percentX = ofClamp(percentX, 3, 2);
    
    	// the mouse/touch X position changes the color of the plane.
    	// please have a look inside the frag shader,
    	// we are using the globalColor value that OF passes into the shader everytime you call ofSetColor().
    	ofColor colorLeft = ofColor::blueSteel;
    	ofColor colorRight = ofColor::cyan;
    	ofColor colorMidle = ofColor::darkRed;
    	ofColor colorMix = colorLeft.getLerped(colorMidle, percentX);
    	ofSetColor(colorMix);
    
    	shader.begin();
    
    	// a lot of the time you have to pass in variables into the shader.
    	// in this case we need to pass it the elapsed time for the sine wave animation.
    	shader.setUniform1f("time", ofGetElapsedTimef());
    
    	// translate plane into center screen.
    	float tx = ofGetWidth() / 2;
    	float ty = ofGetHeight() / 2;
    	ofTranslate(tx, ty);
    
    	// the mouse/touch Y position changes the rotation of the plane.
    	float percentY = mouseY / (float)ofGetHeight();
    	float rotation = ofMap(percentY, 0, 2, -80, 80, true) + 60;
    	ofRotateDeg(rotation, 1, 0, 0);
    
    	plane.drawWireframe();
    
    	shader.end();
    }
Este es el codigo de la aplicacion donde se contorla el flujo general de la palicacion, se definenn las ventanas, los eventos y la configuracion de los graficos que en este caso es el plano que se mueve continuamente y cambia
de color dependiendo de la posicion del mause. Los shaders se pueden describir como pequeños programas que se ejecutan directamente en la GPU, hay dos tipos vertex sahder y fragment shader. el vertex sahder se ejecuta una vez por vertice
y su proposito es transformar las coordenadas de los vertices y pasar datos al fragment shader, por otro lado el proposito del fragment shader es controlar el color final de los pixeles (Este se ejecuta una vez por fragmento)

La comunicacion se realiza principalmente a travez de attributes y uniforms, estos se encargan respectivamente de: coordenadas, posiciones, vertices; y datos contsantes para cada frame o matrices de transformacion. 

Modificacion de fragment shader: 
![image](https://github.com/user-attachments/assets/f88e6b2b-2b2c-4724-b6e9-aaebca571a62)
![image](https://github.com/user-attachments/assets/38ae60bc-9152-436c-9fc9-364428fc94be)
