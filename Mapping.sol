// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Recordemos que tenemos el mapping de la aplicacion blockchain de tareas como otro ejemplo aqui
// https://github.com/Facodex/Dapp-Tasks-Blockchain/blob/main/contracts/TasksContract.sol

contract AprendiendoMapping {

    // esto quiere decir que lo que guardaremos en address(cuentas) X uint(montos).
    // pero las cuentas no son cuentas reales si no que representan un indice en el mapping Balances
    // mapping(_KeyType => _ValueType)
    mapping (address => uint) public Balances;

    function darBalance(address _account, uint _amount) public {
        Balances[_account] = _amount;
    }

    function verBalance(address _account) public view returns(uint){
        return Balances[_account];
    }

    function deleteBalance(address _account) public{
        delete Balances[_account];
    }

}