// SPDX-License-Identifer: MIT

pragma solidity >0.5.0 <0.6.0;

contract Faucet {

    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);

    uint daily_payout = 100000000000000000;

    // give out ether to anyone who asks
    function withdraw() public {
        // check for sufficient funds
        require(address(this).balance >= daily_payout, "Faucet: Insufficient balance for withdrawal request");
        msg.sender.transfer(daily_payout);
        emit Withdrawal(msg.sender, daily_payout);
    }

    function () external payable {
        emit Deposit(msg.sender, msg.value);
    }
}
