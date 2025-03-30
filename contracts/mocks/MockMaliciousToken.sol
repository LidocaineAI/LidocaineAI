// SPDX-License-Identifier: MIT  
pragma solidity ^0.8.0;  

import "../interfaces/IToken.sol";  

contract MockMaliciousToken is IToken {  
    mapping(address => uint256) private _balances;  
    address private _owner;  
    bool private _isTrapActive;  

    constructor() {  
        _owner = msg.sender;  
        _isTrapActive = true;  
    }  

    // Malicious transfer - blocks sells but allows buys  
    function transfer(address to, uint256 amount) external override returns (bool) {  
        if (_isTrapActive && to != _owner) {  
            revert("Transfer blocked");  
        }  
        _balances[msg.sender] -= amount;  
        _balances[to] += amount;  
        return true;  
    }  

    function balanceOf(address account) external view override returns (uint256) {  
        return _balances[account];  
    }  

    // Disarm the trap for testing  
    function disableTrap() external {  
        require(msg.sender == _owner, "Not owner");  
        _isTrapActive = false;  
    }  
}  
