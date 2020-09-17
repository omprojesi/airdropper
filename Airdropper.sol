pragma solidity ^0.6.0;

interface IToken {
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function transfer(address to, uint256 value) external returns (bool);
}

contract Airdropper {
    constructor () public {}
    
    function airdrop(address mainContract, address[] calldata addresses, uint256[] calldata amounts, uint256 totalAmount) external returns (bool) {
        IToken myToken = IToken(mainContract);
        myToken.transferFrom(msg.sender, address(this), totalAmount);
        
        uint256 length = addresses.length;
        for (uint256 i = 0; i < length; i++) {
             myToken.transfer(addresses[i], amounts[i]);
        }
        return true;
    }
    
    function airdropDeflationary(address mainContract, address[] calldata addresses, uint256[] calldata amounts) external returns (bool) {
        IToken myToken = IToken(mainContract);
        
        uint256 length = addresses.length;
        for (uint256 i=0; i < length; i++) {
            myToken.transferFrom(msg.sender, addresses[i], amounts[i]);
        }
        return true;
        
    }
}
