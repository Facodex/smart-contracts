// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Subasta{

    /*
    tenemos el dinero de una persona pero cuando otra ofrece mas
    entonces al primero se le regresa el dinero y luego se actualiza la subasta con
    el nuevo valor mas alto*/

    address payable public beneficiary;
    uint public auctionEndTime;

    //estado actual de la subasta
    address public highestBidder;    //mejor postor
    uint public highestbid;         //mejor precio
    bool ended;                     //subasta terminada

    mapping( address => uint) pendingReturns;

    // evento que permitira a las personas saber que se ha actualizado la subasta 
    event higestBidIncreased(address bidder, uint amount);

    event auctionEnded(address winner, uint amount); //ganador y cuando aposto

    // iniciamos la subasta 
    constructor( uint _biddingTime, address payable _beneficiary){
        
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;

    }

    // funcion que indica cuando alguien puja
    function bid( uint _newPrice) public payable {
        if( block.timestamp > auctionEndTime) revert('The auction is finished');

        if( _newPrice <= highestbid) revert('Sorry, the bid in not high enough');

        if( highestbid != 0){
            pendingReturns[highestBidder] += highestbid;
        }

        // entonces si pasaron todas las comprobaciones damos el valor al  mejor postor momentaneo 
        highestBidder = msg.sender;
        highestbid = msg.value;
        emit higestBidIncreased(msg.sender, msg.value);
    }

    // retirar los bits perdedores 
    function withdraw() public payable returns(bool){
        uint amount = pendingReturns[msg.sender];
        if(amount > 0 ){
            pendingReturns[msg.sender] = 0;
        }
        if(!payable(msg.sender).send(amount) ){
            pendingReturns[msg.sender] = amount;
        }

        return true;
    }

    // funcion finalizar apuesta y dar los ganadores a todos
    function auctionEnd() public {
        if( block.timestamp > auctionEndTime) revert('The auction has not finished');
        if( ended ) revert('The auction is already over!');

        ended = true;
         
         emit auctionEnded(highestBidder, highestbid);
         // Y aqui se le entrega al dueño de toda la subasta el dinero del mejor postor
         beneficiary.transfer(highestbid); 
    }

}