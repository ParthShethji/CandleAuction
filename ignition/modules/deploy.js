
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
const { ethers } = require("hardhat");

const Three_MIN = 180; 

module.exports = buildModule("CandleAuctionModule", (m) => {
  const biddingTime = m.getParameter("biddingTime", Three_MIN); 
  const minIncrement = m.getParameter("minIncrement", ethers.parseEther("0.01")); 

  const auction = m.contract("CandleAuction", [biddingTime, minIncrement]);

  return { auction };
});


// deployed at  - 0x44a3FddA51F410A76FfE844e7DAd3b6ae7235f05