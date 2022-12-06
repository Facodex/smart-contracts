// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//Los enums le dicen a una variable que pueden tener solamente ciertos valores predefinidos
// Ej la variable vaso puede ser solo "chico - mediado - grande "
// Lo que devuelven estas funciones son los indices, no las palabras SMALL, MEDIUM, LARGE

contract Enum {
   enum FreshJuiceSize{ SMALL, MEDIUM, LARGE }
   FreshJuiceSize choice;
   FreshJuiceSize constant defaultChoice = FreshJuiceSize.MEDIUM;

   function setLarge() public {
      choice = FreshJuiceSize.LARGE;
   }
   function getChoice() public view returns (FreshJuiceSize) {
      return choice;
   }
   function getDefaultChoice() public pure returns (uint) {
      return uint(defaultChoice);
   }
}