// SPDX-License-Identifier: MIT

pragma solidity 0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testDemo() view public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() view public {
        console.log(fundMe.i_owner());
        console.log(address(this));
        console.log(msg.sender);
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() view public {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }
}
