// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

library Search {
    // queremos loopear para retornar el valor de un indice
    function indexOf(uint[] storage self, uint _value) public view returns(uint){

        for ( uint i = 0; i < self.length ; i++ ) if(self[i]==_value) return i;

    }
}


contract TestToLibrary{
    
    // usamos Libreria en otro contrato
    uint [] data;
    constructor() public{
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
    }

    function TomaElValor( uint _val ) external view  returns(uint){
        uint value = _val;
        uint index = Search.indexOf(data, value); //aqui usamos la libreria
        return index;
    }
}