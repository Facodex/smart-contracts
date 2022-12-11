// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// solidity ofrece varias funciones criptograficas para hashes 

// keccak256(bytes memory) devuelve bytes32 - calcula el hash Keccak-256 de la entrada 
// sha256(bytes memory) devuelve bytes32 - calcula el hash SHA-256 de la entrada
// ripemd160(bytes memory) devuelve bytes20 - calcula el hash RIPEMD-160 de la entrada

contract Oraculo{

    address admin;
    uint public rand;

    constructor() public {
        admin = msg.sender;
    }

    function feedRand( uint _rand ) external {
        require(msg.sender == admin );
        rand = _rand;
    }

}

contract GenerateRandomNumber{

    Oraculo oraculo;

    constructor( address oraculoAddress){
        oraculo = Oraculo(oraculoAddress);
    }

    // crear numero aleatorio 
    function RandomMod(uint range) external view returns(uint){
        return uint(keccak256(abi.encodePacked(oraculo.rand(), block.timestamp, block.difficulty, msg.sender))) % range;
    }
}