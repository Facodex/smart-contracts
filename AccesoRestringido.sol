// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// El acceso restringido a un contrato es una practica comun 
// el estado de un contrato es solo de lectura a menos que se especifique como publico 
// podemos restringir quien puede modificar el contrato o llamar a las funciones de un contrato utilizando mod 
// construyamos un contrato con acceso restringido utilizando las siguientes escrituras comunes 

// onlyBy - solo la persona mensionada puede llamar a esta funcion 
// onlyAfter - llamada despues de cierto periodo de tiempo 
// costs - llama a esta funcion solo si se proporciona cierto valor

contract Restricciones{

    // dueño 
    address public owner = msg.sender;
    // momento exacto que se desplego el contrato
    uint public creationTime = block.timestamp;

    // modificador para que el sender no pueda ser el que interactua
    modifier onlyBy(address _account) {
        require(msg.sender == _account,
        'Sender not authorized');
        _;
    }

    // modificador para que la funcion se ejecute solo despues de cierto tiempo
    modifier onlyAfter( uint _time) {
        require(block.timestamp >= _time,
        'function is called too early');
        _;
    }

    // funcion para cambiar el address del dueño 
    function changeOwner ( address _newOwner) public onlyBy(owner) {
        owner = _newOwner;
    } 

    // funcion para eliminar al owner despues de X tiempo 
    function deleteOwner () onlyBy(owner) onlyAfter(creationTime + 5 weeks) public{
        delete owner;
    } 


    // funcion para cambiar el dueño pero pagar por ello 
    modifier costs (uint _amount) {
        require(msg.value >= _amount,
        "Not enough ether provided" );
        _;
    }
    function forceChainOwner( address _newOwner) payable public costs(100 ether){
        owner = _newOwner;
    }
}