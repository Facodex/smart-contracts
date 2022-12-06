// SPDX-License-Identifier: MIT

//Interactuan contratos mediante sus constructores

pragma solidity >=0.7.0 <0.9.0;

contract Member {

    string name;
    uint age;

    constructor(string memory _name, uint _age) public{
        
        name = _name;
        age = _age;
    }
}


// heredo las propiedades del contrato Member y le paso parametros estáticos
contract Instructor is Member ("Facundo", 24) {
    function getName() public view returns(string memory){
        return name;
    }
}

//heredo y aqui pedire mediante input datos dinamicos (lo ideal)
contract otherInstructor is Member{
    constructor(string memory n, uint a) Member(n, a) public {}

    function getName() public view returns(string memory){
        return name;

    }
}