// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Counter {

    uint public count;

    function increment () external{
        count +1;
    }
}

// como interactuamos con esto? -> Interfaces!! 

// caracteristicas claves de una interfaz : 
// no puede tener ninguna funcion con implementacion 
// puede heredar de otras interfaces
// las funciones de una interfaz solo pueden ser de tipo external 
// no puede tener constructor 
// no puede tener variables de estado 
// la interfaz puede tener enum, structs, a los que se puede acceder usando la notacion de puntos del nombre de la interfaz 


/* -----INTERFAZ-----*/
interface ICounter {
    
    function count() external view returns(uint);
    function increment() external;

}

// contrato normal para usar la interfaz
contract MiContrato{

    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount( address _counter) external view returns(uint){
        return ICounter(_counter).count();
    }
}

