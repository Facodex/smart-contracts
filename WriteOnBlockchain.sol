// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract MyContract {
    // my states/variables
    string text;

    // the word calldata is for clarifies that the data is saved as an argument of a function
    function WriteOnBlockchain (string calldata _text) public{
        text = _text;
    }

    function Read() public view returns(string memory){
        return text;
    }

}