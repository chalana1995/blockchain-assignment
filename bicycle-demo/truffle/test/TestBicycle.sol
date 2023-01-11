// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Bicycle.sol";

contract TestBicycle {

  Bicycle bicycle = Bicycle(DeployedAddresses.Bicycle());

  uint expectedBicycleId = 3;

  address expectedBicycle = address(this);

  // Testing the buyers() function
  function testUserCanBuyBicycle() public {
    uint returnedId = bicycle.buyers(expectedBicycleId);
    Assert.equal(returnedId, expectedBicycleId, "Buying bicycle should match what is returned.");
  }

  function testGetBuyerAddressByBicycleId() public {
    address bike = bicycle.bicycles(expectedBicycleId);
    Assert.equal(bike, expectedBicycle, "Owner of the expected bicycle should be this contract.");
  }

  // Testing retrieval of all buyer owners
  function testGetBuyerAddressByBicycleIdInArray() public {
    // store buyer in memory
    address[16] memory bikes = bicycle.getBuyers();
    Assert.equal(bikes[expectedBicycleId], expectedBicycle, "Owner of the expected bicycle should be this contract.");
  }

}