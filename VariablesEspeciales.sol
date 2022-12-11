// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Especiales {

    //las variables especiales estan disponibles globalmente y 
    // proporcionan informacion sobre la blockchain 

    mapping (address => uint) balance;

    function updateBalance(uint _newBalance) public {
        balance[msg.sender] = _newBalance;
    }

    // resultado: balance[0x43231341(mi adress)] = _newBalance
}