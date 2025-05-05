# Experimetno (Programa)
    #include <iostream>
    #include <vector>
    
    //  Memoria Global: Variable accesible desde cualquier parte del código
    std::vector<int> globalObjects;
    
    void createStackObject() {
        //  Stack: Variable local que se destruye cuando la función termina
        int stackObject = 42;
        std::cout << "Objeto en Stack creado: " << stackObject << std::endl;
    }
    
    void createHeapObject() {
        //  Heap: Se asigna memoria con `new`
        int* heapObject = new int(99);
        std::cout << "Objeto en Heap creado: " << *heapObject << std::endl;
    
        // IMPORTANTE: Hay que liberar la memoria para evitar fugas
        delete heapObject;
    }
    
    int main() {
        //  Memoria Global: Agregamos un valor al vector global
        globalObjects.push_back(7);
        std::cout << "Objeto en Memoria Global: " << globalObjects[0] << std::endl;
    
        //  Stack: Se crea y se destruye automaticamente al salir de la funcion
        createStackObject();
    
        //  Heap: Se crea y hay que eliminarlo manualmente
        createHeapObject();
    
        return 0;
     }
        
## Tipos de Memorias
Stack: Es rápido, automático, desaparece cuando la función termina y se usa para variables temporales dentro de funciones
Heap: Es manual, existe hasta que se borres con "delete" y sirve para datos grandes o que deben durar mas tiempo
Global: siempre esta disponible, pero puede ocupar memoria innecesaria; y se usa para configuraciones o datos compartidos en todo el programa
    
