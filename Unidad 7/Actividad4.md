# Actividad 4

El codigo del ejemplo crea una maya que cambia de color al igual que la anterior cuando mueves el mause d eun lado a otro con tonos en la mitad haciendo que ambos se combinen, ademas de esto añade una ezfera que se
mueve con el mause dando el efecto de que la maya se levanta y se ve en 3D:

![image](https://github.com/user-attachments/assets/d60bc860-f895-4a94-b7ca-b5185712a009)
![image](https://github.com/user-attachments/assets/e6643e03-5307-42a2-95fd-12bed6526795)

## ¿Cómo funciona el código de aplicación, los shaders y cómo se comunican estos?
OffApp.cpp se comunica con los shaders (.vert y .frag) mediante uniforms que en este caso se utilizan para transmitir informacion como la posicióon del mouse, el tiempo transcurrido y colores dinamicos. El vertex shader en este caso se esta encargando de cambiar la posicion de los vertices con respecto a la posicion del mause, mientras que e fragment shader asigna un color a cada fragmento utilizando el color calculado. 

Inicio del shader:

    shader.begin();
Calculo de la posicion del mause:

    float cx = ofGetWidth() / 2.0;
    float cy = ofGetHeight() / 2.0;
    float mx = mouseX - cx;
    float my = mouseY - cy;
Envio de unifrmos al shader:

    shader.setUniform1f("mouseRange", 150);
    shader.setUniform2f("mousePos", mx, my);
Interpolacion del color segun la posicion del mause: 

    float percentX = mouseX / (float)ofGetWidth();
    percentX = ofClamp(percentX, 0, 1);
    ofFloatColor colorLeft = ofColor::magenta;
    ofFloatColor colorRight = ofColor::blue;
    ofFloatColor colorMix = colorLeft.getLerped(colorRight, percentX);
    float mouseColor[4] = {colorMix.r, colorMix.g, colorMix.b, colorMix.a};
    shader.setUniform4fv("mouseColor", &mouseColor[0]);

Transformacione sy dibujo del plano:

    ofTranslate(cx, cy);
    plane.drawWireframe();
Finalizacion del shader:

    shader.end();

## modificaciones a ofApp.cpp, al vertex shader y al fragment shader
Realice modificaciones en la parte de draw y setup donde se incia el shader jugando un poco con los colores, la opacidad y las carcateristicas de las esferas, agregue mas esferas que se mueven junto con el mause y se ven en conjunto 

Setup

    // Configurar los offsets (distancia) para las bolitas
    ballOffsets[0] = 0.8f;
    ballOffsets[1] = 1.0f;
    ballOffsets[2] = 1.2f;
    ballOffsets[3] = 1.4f;
    ballOffsets[4] = 1.6f;
        void ofApp::draw() {
 Draw 
 
    	shader.begin();
    
    	// center screen.
    	float cx = ofGetWidth() / 2.0;
    	float cy = ofGetHeight() / 2.0;
    
    	// the plane is being position in the middle of the screen,
    	// so we have to apply the same offset to the mouse coordinates before passing into the shader.
    	float mx = mouseX - cx;
    	float my = mouseY - cy;
    
    	// we can pass in a single value into the shader by using the setUniform1 function.
    	// if you want to pass in a float value, use setUniform1f.
    	// if you want to pass in a integer value, use setUniform1i.
    	shader.setUniform1f("mouseRange", 100);
    
    	// we can pass in two values into the shader at the same time by using the setUniform2 function.
    	// inside the shader these two values are set inside a vec2 object.
    	shader.setUniform2f("mousePos", mx, my);

         shader.setUniform2f("mousePos", mx, my);
    shader.setUniform1f("mouseRange", 150.0f);
    shader.setUniform4f("mouseColor", 1.0f, 0.5f, 0.0f, 1.0f); // Color naranja
    shader.setUniform1fv("ballOffsets", ballOffsets, 5);
    
    ofTranslate(cx, cy);
    plane.drawWireframe();
    
    	// color changes from magenta to blue when moving the mouse from left to right.
    	float percentX = mouseX / (float)ofGetWidth();
    	percentX = ofClamp(percentX, 0, 1);
    	ofFloatColor colorLeft = ofColor::greenYellow;
    	ofFloatColor colorRight = ofColor::orangeRed;
    	ofFloatColor colorMix = colorRight.getLerped(colorLeft, percentX);
    
    	// create a float array with the color values.
    	float mouseColor[5] = { colorMix.r, colorMix.g, colorMix.b, colorMix.b };
    
    	// we can pass in four values into the shader at the same time as a float array.
    	// we do this by passing a pointer reference to the first element in the array.
    	// inside the shader these four values are set inside a vec4 object.
    	shader.setUniform4fv("mouseColor", mouseColor);
    
    	ofTranslate(cx, cy);
    
    	plane.drawWireframe();
    
    	shader.end();
    }

  Vertex
Se realizo para ambas verciones, tiene la posicon, el rango, el color y la adicion la distancia entre las bolitas (Balloffset), tambien tiene para defintir el numero de bolitas a las cuales se les calcula un desplazamiento dependiendo de la posicion del mause. Direccion y distancia se calculan desde la posicon del mause al vertice, tambien esta la escala del efecto que solo afecta a aquellos vertices dentro del "Mause Range" y finalmente esta el gradianteque hace que el efecto sea mas proinente en el centro

      #version 120
    
    uniform float mouseRange;
    uniform vec2 mousePos;
    uniform vec4 mouseColor;
    
    #define NUM_BALLS 5
    uniform float ballOffsets[NUM_BALLS];
    
    void main()
        {
            vec4 pos = gl_Vertex;
        
            // Itera sobre cada "bolita"
            for (int i = 0; i < NUM_BALLS; i++) {
                // Calcula la posición de cada bolita en función del mouse y el offset
                vec2 offsetPos = mousePos * ballOffsets[i];
                vec2 dir = pos.xy - offsetPos;
                float dist = length(dir);
                
                // Solo afecta a vértices dentro del rango del mouse
                if (dist > 0.0 && dist < mouseRange) {
                    float distNorm = dist / mouseRange;
                    distNorm = 1.0 - distNorm;
                    dir *= distNorm;
                    pos.x += dir.x;
                    pos.y += dir.y;
                }
            }
        
            // Aplica las transformaciones al vértice
            gl_Position = gl_ModelViewProjectionMatrix * pos;
        }


  Fragment 
Al fragment solo le hice un pequeño cambio, haciendo que parpadee cada tanto (No supe que mas agregar) 

     // Añade un pequeño efecto de parpadeo basado en el tiempo
        gl_FragColor = mouseColor * abs(sin(time));

![image](https://github.com/user-attachments/assets/60c3073c-2e89-452e-a56b-a19057e53c10)

![image](https://github.com/user-attachments/assets/39838598-14c4-4fe4-b0ce-0d713f98424e)

(Estos son dos intentos diferentes en diferentes etapas del codigo, una es cuando solo estaba experimentando con el cpp y la otra cuando experimente con los shaders)
