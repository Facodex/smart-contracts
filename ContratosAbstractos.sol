// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Los contratos abstractos son aquellos que tienen funciones que no estan siendo usadas
// Se pueden usar para luego hacer herencia, sencillo
// la funcion del contrato abstracto la debemos marcar como virtual

abstract contract ContratoAbstracto{
    
    function y() public view virtual returns(string memory);
}

contract Y is ContratoAbstracto{
    function y() public override view returns(string memory){
        return 'hola';
    }
}