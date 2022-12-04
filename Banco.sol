// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;


//Esto es con solidity en 2018
//owner es el que ejecuta la funcion del contrato
//this == el contrato y sus propiedades
//Para que se pueda incrementar balance al contrato hay que pasar lo mimso por input que por parametro de funcion

contract Banco {

    address public owner; //declaro variable propio (cuenta)

    modifier onlyOwner {
        require(msg.sender == owner);  //este es un modificador que requiere que el sender sea el owner por seguridad
        _;
    }

    function newOwner (address _newOwner) public onlyOwner { //esta es una funcion para cambiar el owner, para que podamos poner otro address en el caso que despues queramos vender el contrato a otra persona y pueda retirar
        //solamente el dueño (con el address del dueño) puede generar un nuevo dueño
        owner = _newOwner; //cambiamos el owner para darle otro address
    }

    function getOwner() view public returns(address) { //aqui queremos retornar el owner (el que hizo el deploy del contrato)
        return owner;
    }

    function getBalance() view public returns(uint256) {
        return address(this).balance; // retorna el balance de este contrato
    }

    constructor() {
        owner = payable(msg.sender); //defino que owner sea la direccion que ejecuta el contrato
    }

    function incrementBalance(uint256 amount) payable public {
        // cualquier address puede incrementar el balance de este contrato en este caso porque solo requiero que el monto sea igual al parametro 
        require(msg.value == amount); //aqui requiero que el monto a agregar sea igual que el monto del parametro de la funcion
    }

    function withdrawBalance() public onlyOwner {
        //con onlyOwner me aseguro que vaya al que esta desplegando la funcion del contrato
        payable(msg.sender).transfer(address(this).balance); //transfiere al address que ejecuta esto el balance de this
    }

}

/*
    Que hace este contrato:
    -Declaro la variable owner que contendra la cuenta que sera dueña del balance y de las funciones "manejan sus datos"
    -En el constructor le doy el valor a esa variable
    -Creo un modifier onlyOwner que obliga que el sender sea el owner por seguridad
    -Creo la funcion newOwner que solo la puede manejar el owner dueño del contrato en ese momento y que el puede nombrar a otro nuevo owner
    -Creo la funcion getBalance que trae el valor del contrato y cualquiera puede acceder a ella al ser view
    -Creo la funcion incrementBalance que recibe un monto y lo asigna al contrato
    -Creo la funcion withdrawBalance que el onlyUser(owner) pueda retirar el balance del contrato 
*/