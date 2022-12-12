// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// A continuacion veremos diferentes visibilidades entre los contratos 
// Tambien haremos un ejercicio de interaccion entre ellos y sus funciones 
// Trataremos a los contratos como clases y le daremos un valor para instanciarlos y poder usar su propiedades y metodos 

contract A {
    uint data = 10;

    function x() external pure returns(uint){
        uint newData = 25;
        return newData;
    }

    function l() public view returns(uint){
        uint newData = data - 3;
        return newData;
    }

    function y() public view returns(uint){
        return data;
    }

}

contract B {
    A a = new A(); //Aqui interactuamos con el contrato A y lo instanciamos

    function f() public view returns(uint){
        return a.l();
    }
    
}

contract C {
    // declaro variable privada 
    uint private data;
    //declaro variable publica
    uint public info;

    constructor() public {
        info = 10;
    }


    // function private 
    function increment( uint a) private pure returns(uint){
        return a + 1;
    }

    // functions public 
    function updateData( uint a ) public { data = a; } 

    function getData() public view returns( uint ){ return data; } 

    function compute( uint a, uint b) internal pure returns(uint) { return a + b; } 
}

contract D {
    C c = new C();

    function readInfo() public view returns(uint){
        return c.info();
    }
}