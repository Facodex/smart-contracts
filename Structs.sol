// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Los structs se utilizan para llevar un registro 
//Supongamos que tenemos libros pero queremos llevar registro de los atributos de los libros

contract Structs {

    struct Libro {
        string titlo;
        string tema;
        uint id_libro;
        string autor;
    }

    Libro libro;

    function setBook() public{
        libro = Libro('Harry Potter', 'Ficcion', 1 ,'J. K. Rowling');
    }

    function getIdBook() public view returns(uint){
        return libro.id_libro;
    }
}