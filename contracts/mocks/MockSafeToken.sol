// SPDX-License-Identifier: MIT  
pragma solidity ^0.8.0;  

import "../interfaces/IToken.sol";  

contract MockSafeToken is IToken {  
    mapping(address => uint256) public balances;  

    function transfer(address to, uint256 amount) external override returns (bool) {  
        balances[msg.sender] -= amount;  
        balances[to] += amount;  
        return true;  
    }  

    function balanceOf(address account) external view override returns (uint256) {  
        return balances[account];  
    }  

    // Mint test tokens  
    function mint(address to, uint256 amount) external {  
        balances[to] += amount;  
    }  
}  
