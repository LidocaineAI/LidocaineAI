// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./interfaces/IScanner.sol";

contract Scanner is IScanner {
    // Risk thresholds
    uint8 public constant HIGH_RISK = 70;
    address public owner;
    
    mapping(address => bool) private whitelist;
    mapping(bytes32 => string) private threatPatterns;

    constructor() {
        owner = msg.sender;
        _initializePatterns();
    }

    function scan(bytes memory bytecode) external override returns (uint8) {
        bytes32 codeHash = keccak256(bytecode);
        uint8 riskScore = _calculateRisk(codeHash);
        
        if (riskScore > HIGH_RISK) {
            emit ThreatDetected(msg.sender, riskScore, threatPatterns[codeHash]);
        }
        
        return riskScore;
    }

    function _calculateRisk(bytes32 codeHash) internal view returns (uint8) {
        // Simplified risk calculation (integrate with your ML model)
        if (bytes(threatPatterns[codeHash]).length > 0) {
            return 90; // Known threat pattern
        }
        return whitelist[msg.sender] ? 5 : 30; // Default scores
    }

    function _initializePatterns() private {
        // Add your YARA-like patterns here
        threatPatterns[keccak256(hex"60606040")] = "SUSPICIOUS_CONSTRUCTOR";
        threatPatterns[keccak256(hex"60806040")] = "PROXY_INIT";
    }

    function isWhitelisted(address contractAddr) external view override returns (bool) {
        return whitelist[contractAddr];
    }

    // Admin functions
    function addThreatPattern(bytes memory bytecode, string calldata patternName) external {
        require(msg.sender == owner, "Unauthorized");
        threatPatterns[keccak256(bytecode)] = patternName;
    }
}
