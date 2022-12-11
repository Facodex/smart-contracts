// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Overloading{
    // son funciones que se declaran con el mismo nombre pero reciben diferentes paramentros 

    // un ejemplo
    /*
    function x ( uint lightSwitch, uint wallet) public {

    }

    function x (uint wallet) public {
        
    }
    */

    // otro ejemplo 
    function getSum( uint _a, uint _b ) public pure returns(uint){
        return _a + _b;
    }
    function getSum( uint _a, uint _b, uint _c ) public pure returns(uint){
        return _a + _b + _c;
    }
    
    // y aca es donde se aplica el uso  
    function getSumTwoArgs() public pure returns(uint){

        return getSum(2 , 3);
    }
    function getSumThreeArgs() public pure returns(uint){

        return getSum(2 , 3, 7);
    }
}