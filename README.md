# Error-handling-using-solidity

This solidity program demonstrates the a simple prototype of implementing a token sharing mechanism using error handling methods. This program helps the user to understand the working of tokens and error handling methods in solidity.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. This program consists of multiple functions and allows a user to interact with the code and can use its functionality to mint and burn the desired tokens created by themself. Through this program , user will be able to understand how a token works along with the error handling functions.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., TokenSharing.sol). Copy and paste the following code into the file:

```Solidity

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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the "Compile TokenSharing.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "TokenSharing" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the setTokenName function which will give token a name and will make the name creating account as the owner of the contract and then their is a function called as setTokeAmount which will generate a certain amount of token to the owner's account and add them to Total Supply also. Then the owner can mint token to another account and any account can transfer certain amount of token to any account and there is also a burnToken function which will delete a certain a amount of token from the account which will call that function.

In all of these functions, some of the error handling functions are used which will be targeted when their condition is violated by the owenr or any other account.

## Authors

Jatin Dhakar


## License

This project is unlicensed.
