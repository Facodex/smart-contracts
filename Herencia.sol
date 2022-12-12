// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// HERENCIA, HEREDANDO TODO DE OTROS CONTRATOS 
// FIJEMOSNOS LA SIMILITUD CON LAS CLASES DE JAVASCRIPT

contract A {
    uint innerVal = 100;

    function innerAddTen( uint _val) public pure returns(uint){
        return _val + 10;
    }
}

// HERENCIA 
contract B is A {
    function outerAddTen(uint _val) public pure returns(uint){
        return A.innerAddTen(_val);
    }

    function GetInnerVal() public view returns(uint){
        return A.innerVal;
    }
}
