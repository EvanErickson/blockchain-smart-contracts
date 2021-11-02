pragma solidity >=0.7.0 <0.9.0;

//Address is a type  
contract Will {
    address owner;
    uint fortune;
    bool deceased;
    
    constructor() payable public {
        owner = msg.sender;
        fortune = msg.value;
        deceased = false;
    }
    
    //create modifier so that only owner can call contract, and only to allocate funds if person dies.
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    modifier mustBeDeceased {
        require(deceased == true);
        _;
    }   
    
    address payable[] familyWallets;
    
    mapping(address => uint) inheritance;
    
    // Inheritance they are mapping the wallet to the amount
    
    function setInheritance(address payable wallet, uint amount) public onlyOwner {
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }
    
    
    // Pay each family member based on their wallet address.
    function payout() private mustBeDeceased {
        for(uint i=0; i<familyWallets.length; i++){
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    }
    
    // Oracle Switch
    function hasDeceased() public onlyOwner {
        deceased = true;    
        payout();
    }
    
    
    
}
