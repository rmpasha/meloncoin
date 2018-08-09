/**
 * Created on: August 2018
 * @summary: MelonFarm manages different meloncoins. There will be one
 * deployment of the Meloncoin contract per crop of melon, each with its own
 * ripeness and expiration period
 * @author:
 */
pragma solidity ^0.4.24;

import './Meloncoin.sol';

/**
 * @title: MelonFarm deploys and manages meloncoins
 */
contract MelonFarm {

  Meloncoin[] public deployed;

/**
 * @dev: Creates a new Meloncoin, assigning all tokens to the sender
 * @param uint _initialSupply : How many melon seeds are planted
 * @param uint _plantDate : When the melons are planted
 * @param uint8 _growingPeriod : How long the melons take to grow in days
 * @param uint8 _ripePeriod : The shelf life of the melons in days. This is the
 * period in which meloncoin can be redeemed for an investment-grade melon
 * @return : a new Meloncoin contract
 */
  function launchMeloncoin(uint _initialSupply,
			   uint _plantDate,
			   uint8 _growingPeriod,
			   uint8 _ripePeriod) public returns (Meloncoin) {
    Meloncoin latest = new Meloncoin(_initialSupply, _plantDate, _growingPeriod, _ripePeriod,
				     msg.sender);
    deployed.push(latest);
    return latest;
  }
}
