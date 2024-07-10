// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

contract TokenSharing 
{
    string public token;
    address public owner;
    uint public totalSupply;
    uint oneTimeUse = 0 ;
    mapping (address => uint) balance;

    function A_setTokenName (string memory tokenName) public returns (string memory )
    {
        token = tokenName;
        owner = msg.sender;
        return ("The account who have the the token name has became the owner of the contract");
    }

    function B_setTokenAmount(uint TokenNo) public 
    {
        if(oneTimeUse == 0)
        {
        balance[owner] = TokenNo;
        totalSupply = TokenNo;
        oneTimeUse = 1;
        }

        else {
            revert ("Token amount can not be set twice");
        }
    }

    function F_FindBalance (address account) public view returns (uint)
    {
        return balance[account];
    }

    function C_mintToken ( address reciever , uint amount) public 
    {
        require (msg.sender == owner , "Only owner can mint the tokens");
        require (amount > 0 , "Required amount can not be negative or zero");
        balance[owner] -= amount;
        balance[reciever] += amount;
    }

    function D_transferToken ( address reciever , uint amount) public 
    {
        assert(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        balance[reciever] += amount;
    }

    function E_burnToken(uint amount) public 
    {
        if(balance[msg.sender] < amount || amount == 0)
        {
            revert("invalid amount of token to be burnt");
        }

        else {
            balance[msg.sender] -= amount;
        }
    }
}