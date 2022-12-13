// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// solidity -> assembly -> etherum virtual machine 

contract AprendeAssembly {

    function agregarEVM() external {
        uint x;
        uint y;

        // creando una variable en assembly 
        assembly{
            let z := add(x,y)
        }
    }

    function agregarEVM2() public view returns(bool succes){

        // creamos tamaño
        uint size;
        // creamos una direccion 
        address direction;

        assembly{
            size := extcodesize(direction)
        }
        if (size >= 0) {
            return true;
        } else {
            return false;
        }
    }

    // cambiando un tipo de byte a otro tipo de byte con assembly 
    function agregarEVM3() external view{
        bytes memory data = new bytes(10);
        bytes32 dataB32;
        assembly{
            dataB32 := mload(add(data, 32))
        }
    }

}