// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// los bits son un valor, y son el valor que va despues de uint 
contract Bits{

    uint numero = 4;

    // conversiones: recorta los valores de alto orden 

    // de 32 a 16
    uint32 a = 0x12345678; //este gasta mas poque es mas grande    
    uint16 b = uint16(a);   //b = 0x5678 -> este gasta menos porque es mas chico

    // de 16 a 32
    uint16 c = 0x1234;
    uint32 d = uint32(c); // d = 0x00001234

    // de 2 bytes a 1 
    bytes2 e = 0x1234;
    bytes1 f = bytes1(e); // f = 0x12 queda mas corto

    // de 2 bytes a 4 
    bytes2 g = 0x1234;
    bytes4 h = bytes4(g); //h = 0x12340000
}