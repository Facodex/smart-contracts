// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// view pure public private returns() etc 

contract Modificadores{

    uint value = 5;

    // con view no se modifica ningun estado, es solo de lectura
    function getResult() public view returns(uint){

        uint a = 1;
        uint _product = a + value;
        return _product;
    }
    /*
    La función de vista se puede declarar vista, en cuyo caso prometen no modificar el estado. pueden ver la variable de estado pero no pueden modificarla
    La función pura declara que no se cambiará ni leerá ninguna variable de estado*/

    // esta funcion no puede acceder al estado value 
    function getValue() public pure returns(uint){
        uint a = 1;
        uint b = 2;
        uint _product = a * b;
        return _product;
    }

}