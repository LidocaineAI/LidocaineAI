// SPDX-License-Identifier: MIT  
pragma solidity ^0.8.0;  

import "../interfaces/IScanner.sol";  

contract MockScanner is IScanner {  
    uint8 public constant RISK_SCORE = 85; // Default high risk  
    string public constant THREAT_TYPE = "RugPull";  

    function scan(bytes memory) external pure override returns (uint8) {  
        return RISK_SCORE;  
    }  

    function isWhitelisted(address) external pure override returns (bool) {  
        return false;  
    }  
}  
