// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Funciones{
    uint a = 50;

    constructor(){
    }

    function verResutado () public view returns(uint){
        uint b = 4;
        uint resultado = a + b;
        return resultado;
    }
}