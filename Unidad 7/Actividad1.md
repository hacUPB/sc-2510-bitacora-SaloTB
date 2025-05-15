# Actividad 1

- ¿Qué son los vértices?
- Los vertices son los puntos de los triangulos, cada una de las conecciones de las lineas que forman los triangulos que forman las imagenes en 3D
- ¿Con qué figura geométrica se dibuja en 3D?
- Triangulos
- ¿Qué es un shader?
- El calculo de la sombre o luz que golpea al objeto dependiendo de su posicion con respectoa  la luz
- ¿Cómo se le llaman a los grupos de píxeles de un mismo triángulo?
- Resteritation
- ¿Qué es un fragment shader?
- Es uno de los pasos principales que se sigue en la GPU para poder mostrar la imagen final que toma la camara
- ¿Qué es un vertex shader?
- Es uno de los porceso bases (el primero) de la GPU para mostrar la imagen 3D de forma 2D leyendo los vertices su direccion y posicion en el mundo y el objeto
- ¿Al proceso de determinr qué pixels del display va a cubrir cada triángulo de una mesh se le llama?
- Resteritation
- ¿Qué es el render pipeline?
- Es la parte que tiene en cuenta la posicion de los objetosgracias tambien a la misma direccion de los objetos esta vez en Z lo que determina siu deben mostrarse por
delante o detras dependiendo de la popsicion de la camra (Esto es el Z-buffer)
- ¿Hay alguna diferencia entre aplicar un color a una superficie de una mesh o aplicar una textura?
- El color no aplica la direccion de la luz ni las caracteristicas como el tipo de material que el objeto va a tener para asi ponerle realismo a la imagen
- ¿Cuál es la diferencia entre una textura y un material?
- Una textura es tan solo el como se ve, por ejemplo la textura de la madera o metyal del tren, el material es lo que finalmente influye en la refleccion y reaccion de este material a su entorno, en otras palabras
el material es lo que permite que reaccione a la luz 
- ¿Qué transformaciones se requieren para mover un vértice del 3D world al View Screen?
- se calcula el promedio de las normales del objeto teneindo en cuenta su direccion y posicion con respecto al objeto, al mundo y a la camara, todos los triangulos son enviados entonces para ser leidos por 
- ¿Al proceso de convertir los triángulos en fragmentos se le llama?
- SSAA super sampling anti aliasing
- ¿Qué es el framebuffer?
- La informacion de todos los pixeles en una imagen 
- ¿Para qué se usa el Z-buffer o depth buffer en el render pipeline?
- determina si los objetos deben mostrarse por delante o detras dependiendo de la popsicion de la camra
