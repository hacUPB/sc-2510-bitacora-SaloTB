# Actividad 9 
## ¿Qué sucede cuando presionas la tecla “f”?
Cuando presionas la tecla 'f', el programa elimina la ultima bolita de "happy memory" osea el último objeto almacenado en el heap
![image](https://github.com/user-attachments/assets/2197a601-60b3-4554-ba05-d38e89baae8c)

    
    if(!heapObjects.empty()) {   //  Verifica si hay elementos en el vector
        delete heapObjects.back(); // libera la memoria del ultimo objeto en el heap
        heapObjects.pop_back();   // elimina el puntero del vector
    }
    
Se verifica que hay objetos en heapObjects
Se obtiene el último objeto en el vector y se libera su memoria (delete)
Se elimina el puntero del vector (pop_back)
Si sigues presionando "f", se eliminan más objetos hasta que el vector quede vacío

Antes de intentar eliminar algo el codigo verifica que el vector heapObjects no este vacio, si intentas se intenta acceder a un vector vacio y llamar a la funcion heapObjects.back() se crearia un crasheo en el programa

Después de liberar la memoria con "delete", este comando elimina el puntero del vector, en caso de que esto no sehiciese el vector seguiría almacenando un puntero a memoria que ya no existe, lo que podría causar errores. 
