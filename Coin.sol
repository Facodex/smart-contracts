// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract FacodexCoin {

    // definimos la direccion del contrato de la criptomoneda
    address public minter;
    mapping( address => uint) public balances;

    // los parametros del evento son: de donde, hacia donde y cuanto enviamos 
    event Sent(address from, address to, uint amount);

    constructor(){
        minter = msg.sender; //obtenemos el address del usuario que esta interactuando con el contrato
    }


    // envia cantidad de coin creado a la dirreccion especifica
    function mint( address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }


    // funcion por si el balance es insuficiente 
    error InsufficientBalance(uint requested, uint available);
    // function para enviar moneda que ya existe 
    function sendCoin( address receiver, uint amount ) public {
        // si no tiene fondos 
        if(amount > balances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });

        // si tiene fondos enviamos
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);

    }
}

// IMPORTANTE, PARA QUE FUNCIONE SENDCOIN TENGO QUE ESTAR USANDO LA CUENTA DEL CREADOR DE LA CRIPTOMONEDA