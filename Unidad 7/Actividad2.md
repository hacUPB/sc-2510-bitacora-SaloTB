## Actividad 2

1. Llama los shaders que estan en la carpeta data/shaders, hay dos tipos pues en ocaciones uno no funciona dependiendo del sistema operativo del computador
2. Resultado:
![image](https://github.com/user-attachments/assets/ee4dc730-5aeb-409d-83d1-810861776f54)

3. ¿Estás usando un vertex shader?
Si, se esta usando un sombreado de vertices, estos son las carpetas externas que tienen las caracteristicas necesarias para generar el cambio de color. Es la siguinete parte:

        uniform mat4 modelViewProjectionMatrix;
        in vec4 position;
        
        void main(){
            gl_Position = modelViewProjectionMatrix * position;
        } 
5. ¿Estás usando un fragment shader?
si, se utilizan para determinar los colores de cada píxel en la aplicacion, es esta parte de aqui:

        out vec4 outputColor;
        
        void main()
        {
            // gl_FragCoord contains the window relative coordinate for the fragment.
            // we use gl_FragCoord.x position to control the red color value.
            // we use gl_FragCoord.y position to control the green color value.
            // please note that all r, g, b, a values are between 0 and 1.
        
            float windowWidth = 1024.0;
            float windowHeight = 768.0;
        
            float r = gl_FragCoord.x / windowWidth;
            float g = gl_FragCoord.y / windowHeight;
            float b = 1.0;
            float a = 1.0;
            outputColor = vec4(r, g, b, a);
        }
7. Analiza el código de los shaders. ¿Qué hace cada uno?
### Vertex shader
Es el primer paso en el la etapa de procesamiento de la GPU. Su funcion es transformar las posiciones de los vertices en coordenadas en pantalla, en el ejemplo el vertex shader toma las posiciones de los vertices y las pasa al siguiente paso, el pipeline grafico. (PEro tambien puede tener otras salidas como coordenadas de textura y colores que se mandan al fragment shader)

        #version 150
        
        in vec4 position;
        
        void main() {
            gl_Position = position;
        }
Aqui se asigna la posicion del vertice a gel.position que indica la posicion final del vertice en pantalla

### Fragment shader 
Se necraga de determinar el color de cada fragmento (pixel) que se dibuja en la pantalla. Utiliza la posicion del fragmento en la pantalla gl_FragCoord para calcular un color basado en su ubicacion
        
        #version 150
        
        out vec4 outputColor;
        
        void main() {
            float r = gl_FragCoord.x / windowWidth;
            float g = gl_FragCoord.y / windowHeight;
            float b = 1.0;
            float a = 1.0;
            outputColor = vec4(r, g, b, a);
        }
Este fragment shader en especifico genera un gradiante de color hacia los lados y de arriba y abajo

