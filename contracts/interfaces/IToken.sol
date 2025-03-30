// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IToken {
    /// @notice Standard ERC-20 interface
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);

    /// @notice Lidocaine-specific functions
    /// @param scannerAddress The security scanner contract
    function setScanner(address scannerAddress) external;

    /// @notice Emitted when tokens are minted via staking
    event Mint(address indexed minter, uint256 amount);
    
    /// @notice Emitted when scanner contract changes
    event ScannerUpdated(address newScanner);
}
