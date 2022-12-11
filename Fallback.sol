// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract FallbackFunction{

    // se ejecutan cuando algo falla 
    // no pueden tener nombre
    // no reciben entradas ni parametros 
    // deben ser declaradas como externas

    // creamos un log 
    event Log(uint gas);

    // aqui la magia del fallback
    fallback() external payable {
        emit Log(gasleft());
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    // esta funcion la pegue por el warning que me mostraba de que esta funcion no estaba recibiendo ether y estaba pidiendo ether en el las demas funciones

    event Received(address, uint);
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }


}

contract SendToFallback{

    function transferToFallBack( address payable _to ) public payable {

        // enviar ether con transfer 
        _to.transfer(msg.value);
    }

    function CallFallback( address payable _to ) public payable {

        (bool sent,) = _to.call{value:msg.value}('');
        require(sent, "Failed to send");
           
    }

}