// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Ciclos{

    uint [] listaCorta = [1, 6, 13, 4, 45];
    uint [] listaLarga = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

    // while 
    function whileFunction() public view returns(uint){
        uint a = 2;
        while( a < 5){
            a++;
            return a;
        }
    }

    // do while - the loop will always be executed at least once, even if the condition is false.
    function doWhileFunction() public view returns(uint){
        uint a = 4;
        do{
            return a;
            a++;

        }while( a < 10 );
    }

    // for 
    function forFunction(uint _numero) public view returns(bool){
        bool numeroExiste = false; 
        for(  uint x = 0; x <= listaCorta.length; x++  ) {
            if( _numero == listaCorta[x] ){
                numeroExiste = true;
            }
        }
        return numeroExiste;
    }

    function paresImpares() public view returns(uint){
        uint count = 0;
        for(  uint x = 0; x <= listaLarga.length; x++  ) {
            if( listaLarga[x] % 2 == 0 ){
                count++;
            }
        }
        return count;
    } 

}