// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LIDO is ERC20 {
    address public governance;
    uint256 public constant MAX_SUPPLY = 1_000_000_000 * 10**18;

    constructor() ERC20("Lidocaine AI", "LIDO") {
        _mint(msg.sender, MAX_SUPPLY);
        governance = msg.sender;
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    modifier onlyGovernance() {
        require(msg.sender == governance, "Not authorized");
        _;
    }
}
