pragma solidity ^0.4.11; 

uint minimumBet; 
uint totalBet; 
uint numberOfBets; 
uint maxAmountOfBets = 100; 
address[] players; 

struct Player {
    uint amountBet; 
    uint numberSelected; 
}

mapping(address => Player) playerInfo; 

contract Casino {
    address owner;

    function Casino(uint _minimumBet){
        owner = msg.sender; 
        if(_minimumBet != 0) minimumBet = _minimumBet; 
    }

    function Casion() {
        owner = msg.sender; 
    }

    function kill() {
        if(msg.sender == owner)
            selfdestruct(owner) 
    }

    function bet(uint number) payable {
        assert(checkPlayerExists(msg.sender) == false); 
        assert(number >= 1 && number <= 10);
        assert(msg.value >= minimumBet); 

        playerInfo[msg.sender].amountBet = msg.value; 
        playerInfo[msg.sender].numberSelected = number; 
        numberOfBets += 1; 
        players.push(msg.sender);
        totalBet += msg.value; 
    }
}