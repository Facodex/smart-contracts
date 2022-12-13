// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// ERRORES EN SOLIDITY 
// Cuando sucede un error el estado se revierte a su valor original 
// para manejar errores se pueden hacer comprobaciones : 
/*
assert( bool condition)
require( bool condition) 
require( bool condition, string memory message) 
revert();
revert( string memory reason);*/

contract ManejoErrores{

    bool public sunny = true;
    bool public umbrella = false;
    uint finalCalc = 0;

    function solarCalc() public {
        require(sunny, 'It is not sunny today');
        finalCalc += 3;
        assert(finalCalc != 6);
    }

    function internalTestUnits() public view {
        assert(finalCalc != 6);
    }

    function wheaterChange() public {
        sunny = !sunny;
    }

    function getCalc() public view returns(uint){
        return finalCalc;
    }

    function bringUmbrella() public{
        if( !sunny ){
            umbrella = true;
        }else{
            revert('no need to bring an umbrella today');
        }
    }

}

// solamente el vendedor podra vender este contrato 
contract Vendedor {
    address seller;

    modifier onlySeller(){
        require( msg.sender == seller, 'Only seller could sell this contract');
        _;
    }
    
    // para convertirme en seller 
    function becomeSeller() public {
        seller = msg.sender;
    }

    // entonces si te conviertes en vendedor puedes vender 
    function sell(uint _amount) public payable onlySeller{
        if( _amount > msg.value){
            revert('There is not enough ether provided!');
        }
    }
}