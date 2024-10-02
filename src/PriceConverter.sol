// SPDX-License-Identifier: MIT

pragma solidity 0.8.27;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice(AggregatorV3Interface priceFeed) public view returns (uint256) {
         (, int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount, AggregatorV3Interface priceFeed) public view returns (uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        uint256 ethAmointInUSD = ethPrice * ethAmount / 1e18;
        return ethAmointInUSD;
    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}
