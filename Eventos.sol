// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// LOS EVENTOS NOS PERMITEN MOSTRAR AL MUNDO EXTERIOR LO QUE HA OCURRIDO EN EL CONTRATO 
// ESTO TAMBIEN NOS PERMITE LEER EL CONTRATO CON OTROS PROGRAMAS POR EJEMPLO WEB3


// ejemplos con eventos de trading 
contract Eventos {

    event NewTrade(
        uint indexed date,
        address from,
        address indexed to,
        uint indexed amount
    );

    // external porque leeremos la info atraves de otros programas 
    function trade( address _to, uint _amount ) external {
        // programas externos pueden leer este contrato a traves de web3.js ejemplo
        emit NewTrade(block.timestamp, msg.sender, _to, _amount );

    }
}