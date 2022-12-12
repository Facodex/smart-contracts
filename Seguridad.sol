// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*el patron de retirada garantiza que no se realice una llamada de transferencia directa
lo que supone una amenaza a la seguridad
Las transacciones son atomicas (ocurre en el mismo instante / todoo o nada)
queremos evitar fallas y hackers

IMPORTANTE: AQUI HAY VARIABLES QUE FALTAN DECLARAR PERO ES PARA TENER UNA IIDEA DE COMO SE VAN REQUIRIENDO COSAS PARA TENER SEGURIDAD
*/

contract Security{

    address public owner; //declaro variable propio (cuenta)

    modifier onlyOwner {
        require(msg.sender == owner);  //este es un modificador que requiere que el sender sea el owner por seguridad
        _;
    }

    constructor() {
        owner = payable(msg.sender); //defino que owner sea la direccion que ejecuta el contrato
    }
    // transfer vs send 
    // transfer nos permite revertir lo que hicimos 
    // send nos permite retornar un valor boleano 

    // EJEMPLO REEMBOLSO DE DINERO SOLO AL DUEÑO QUE HIZO EL ENVIO 

    
    function sendRefund() public onlyOwner returns(bool succes){
        if(!persona.send(amount)){
            //hacer algo con la caracteristica
        }
    }

    function reclamarReembolso() public {
        require(balance[msg.sender] > 0);
        msg.sender.transfer(balance[msg.sender]);
    }

    function retirarFondos(uint _amount) public returns(bool succes){
        require(balance[msg.sender] >= 0); // requiero que el que pide el retiro tenga esa cantidad para retirar
        balance[msg.sender] -= _amount; // le descuento el retiro
        msg.sender.transfer(_amount); //enviamos el dinero
        return true;
    }

}