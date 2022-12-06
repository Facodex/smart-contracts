// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Cadenas {

    string nombre = "Facundo Benitez";
    string nacionalidad = "Argentina";


    // las cadenas no se pueden concatenar en solidity
    //memory nos sirve para guardar datos temporalmente hasat que el programa se cierre
    function verNombre() public view returns(string memory){
        return nombre;
    }

    // cambiando el string nombre a bytes, que seria su longitud
    function obtenerByte() public view returns(uint){
        bytes memory bytesDeCadena = bytes(nombre);
        return bytesDeCadena.length;
    }

}