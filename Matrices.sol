// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//Las matrices son arrays, y cada elemento dentro tiene un indice
//Una matriz en solidity puede ser de tamaño indefinido o fijo

contract Matrices{
    uint[] public miMatriz1;
    uint[] public miMatriz2;
    uint[50] public miMatriz3;
    
    //push
    function pushMatriz( uint _number) public {
        miMatriz1.push(_number);
    }

    //pop elimina el ultimo valor
    function matrizPop() public {
        miMatriz1.pop();
    }

    //length
    function matrizLength() public view returns(uint) {
        return miMatriz1.length;
    }

    // delete debemos tener un indice para poder borrar
    // Este codigo lo hizo el profesor pero para mi no funciona correctamente
    // Para mi no botta el elemento _index que le pasemos, solo elimina el úlitmo
    // Tengo que corregirlo (tarea)

    uint [] public cambiarMatriz;
    function deleteInMatriz( uint _index) public {
        cambiarMatriz[_index] = cambiarMatriz[cambiarMatriz.length - 1];
        cambiarMatriz.pop();
    }

}