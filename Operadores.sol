// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Operadores{

    constructor(){
    }

    function operacion () public view returns(uint) {
        uint a = 5;
        uint b = 4;
        uint resultado = a + b;
        return resultado;
    }
}

// operadores aritmeticos +, -, *, /, %, ++, --
// operadores comparacion == , !=, >=, <= , &&, || 
// operadores de asignacion = , += , -=