// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Condicionales{

    uint balance = 300;

    constructor(){
    }

    // condicion if else 
    function comprobarBalance () public view returns(bool){
        if( balance == 300){
            return true;
        }else{
            return false;
        }
    }

    // condicion ternaria 
    function cambiarBalance() public view returns(uint){
        uint nuevoBalance = ( balance <= 300 ? balance + 200 : balance);
        return nuevoBalance;
    }
}