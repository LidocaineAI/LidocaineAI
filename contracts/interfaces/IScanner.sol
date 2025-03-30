// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IScanner {
    /// @notice Scans contract bytecode for threats
    /// @param bytecode The raw bytecode to analyze
    /// @return riskScore A 0-100 risk score (100 = highest risk)
    function scan(bytes memory bytecode) external returns (uint8 riskScore);

    /// @notice Checks if a contract is whitelisted
    /// @param contractAddress The address to verify
    /// @return isSafe True if contract passed audits
    function isWhitelisted(address contractAddress) external view returns (bool);

    /// @notice Emitted when new threats are detected
    event ThreatDetected(
        address indexed contractAddress,
        uint8 riskScore,
        string threatType
    );
}
