pragma solidity >=0.7.0 <0.9.0;

contract AddressWallets {
    address payable[] investorWallets;
    mapping(address => uint) public investors;

    function payInvestors(address payable _address, uint _amount) public {
        if (investors[_address] == 0){
            investorWallets.push(_address);
        }
        investors[_address] += amount;
    }

    function checkInvestors() public view returns (uint) {
        return investorWallets.length;
    }

    function payout() public {
        for (uint i = 0; i < investorWallets.length; i++){
            investorWallets[i].transfer(investors[investorWallets[i]])
        }
    }
}
