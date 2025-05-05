#  profundización teórica de patrones de diseño

## Factory method
Este metodo proporciona una interfaz para la creacion de objetos en una clase base y al msimo tiempo permite que las subclases alternen el tipo de objetos que se crearan. En otras palabras En vez de crear objetos
directamente (new), se delega la creacion a metodos especializados.

Este patron se utiliza en situaciones en las que se necesita desacoplar el codigo de los objetos del codigo que los crea, para facilitar la extencion, pues se pueden crear nuevas clases sin tener que dañar las claszes 
ya existentes y ademas cuando se necesitan instancias flexibles. En otras palabras es ideal utilizarlo cuando no se conozca de antemano los tipos exactos y las dependencias de los objetos con los que deberia trabajar 
el codigo. Finalmente se utiliza cuando se desean ahorrar recursos del sistema reutilizando objetos existentes en lugar de reconstruirlos cada vez.

## Observer
En este patron hay una observador que es el encargado de enviar una notificacion de cmabio a lo que sea que este observando al usuario, pro ejemplo si se tiene una suscripcion el observador estara ahi de forma constante
y cuando esta subscripcion genere algun tipo de cambio esto sera detectado por el observador que informara de los cambios establecido solo en la suscripciona la que le usuario ademas puede acceder y dejar de seguir, asi
se evita resivir informacion no deseada.

Este patron se utiliza generalmente cuando los cambios en el estado de un objeto puedan requerir cambiar otros objetos y el conjunto real de objetos se desconoce de antemano o cambia dinamicamente y cuando algunos objetos de
su aplicacion deben observar a otros, pero solo por un tiempo limitado o en casos especificos.
 
## State

LAs maquinas de estado permiten que el estado del objeto cambie dependiendo del tipo de estado en el que este, para estas maquinas de estado se pueden utilizar condicionales como if o switch que determinan el comportamiento adecuado
que debe de tener cada uno de los objetos para determinar cuando debe de cambair de estado. En este caso los estados son concientes el uno del otro.

el patron de estados se utiliza generalmente cuando se tiene un objeto que se comporta de manera diferente según su estado actual, la cantidad de estados sea enorme y el código específico del estado cambie con frecuencia, 
cuando tiene una clase contaminada con condicionales masivos que alteran el modo en que la clase se comporta según los valores actuales de los campos de la clase y finalmente cuando se tiene mucho código duplicado en estados y 
transiciones similares de una máquina de estados basada en condiciones.
