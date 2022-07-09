// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Wrapper.sol";

contract WrappedTokenVotes is ERC20, ERC20Permit, ERC20Votes, ERC20Wrapper {
    constructor(
        IERC20 wrappedToken, // contract address of token.
        string memory _name,
        string memory _symbol
    )
        ERC20(_name, _symbol)
        ERC20Permit(_name)
        ERC20Wrapper(wrappedToken)
    {}

    // The functions below are overrides required by Solidity.

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(ERC20, ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }

    function decimals()
        public
        view
        override(ERC20, ERC20Wrapper)
        returns (uint8)
    {
        return ERC20Wrapper.decimals();
    }
}