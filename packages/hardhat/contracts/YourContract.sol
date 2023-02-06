pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

// import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

import "./Bank.sol";

contract YourContract {
  Bank public bankContract;
  
  constructor(address _bankAddress) {
    bankContract = Bank(_bankAddress);
  }

  function myBalance() public view returns (uint256) {
    return bankContract.balances(address(this));
  }

  function depositToBank() public payable {
    bankContract.deposit{value: msg.value}();
  }

  function withdrawFromBank() public {
    bankContract.withdraw();
  }

  receive() external payable {}
  fallback() external payable {}
}
