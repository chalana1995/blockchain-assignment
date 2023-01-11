// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Bicycle {
  address[16] public bicycles;

  event bicycleBuy(uint bicycleid);

  // Rent a bike
  function buyers(uint bicycleid) public returns (uint){
    require(bicycleid >= 0 && bicycleid <=15);
    bicycles[bicycleid] = msg.sender;
    emit bicycleBuy(bicycleid);
    return bicycleid;
  }

  // Retrieving the buyers
  function getBuyers() public view returns (address[16] memory){
    return bicycles;
  }
}