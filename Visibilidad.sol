// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Visibilidad{

    uint private data1 = 300; //NO esta disponible para leer desde afuera, solo desde aqui del contrato
    uint public data2 = 150;  //SI esta disponible como informacion del contrato y se puede consultar desde afuera
    string internal propietario = "Facundo Benitez"; //Este valor solo estara disponible para usarlo dentro de este contrato

    // con public podemos ver data desde afuera pero con private no 
    function x() private view returns(uint) {

        uint data = 9;

        return data;
    }

    // esta es una manera de acceder desde afuera a una funcion privada
    function y() public view returns(uint){
        return x();
    }


}
