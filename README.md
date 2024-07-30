# CandleAuction

## Overview
This contract implements a Candle Auction. The contract allows users to place bids, tracks the highest bidder, and finalizes the auction when it ends.

## Features

1. Auction Duration: Set at contract deployment.
2. Minimum Bid Increment: Ensures each new bid is significantly higher than the previous one.
3. Highest Bidder Tracking: Keeps record of the current highest bidder and bid amount.
4. Auction End Time: Determined at contract deployment.
5. Finalization: Only the highest bidder can finalize the auction by paying the bid amount.

## Contract Structure

### Events
there are 2 events that are emited
- HighestBidIncreased: Emitted when a new highest bid is placed
- AuctionEnded: Emitted when the auction is finalized

### Modifiers
3 modifiers
- onlyBefore: Ensures a function is called before a specific time
- onlyAfter: Ensures a function is called after a specific time
- onlyOwner: Restricts function access to the contract owner

### Functions
4 main functions used
1. constructor: Initializes the auction with bidding time and minimum increment
2. bid: Allows users to place bids
3. isAuctionEnded: Checks if the auction has ended
4. finalize: Allows the highest bidder to finalize the auction and transfer funds

## Optimization

Previously, the contract required bidders to send Ether with each bid, which was then returned if outbid. This approach wasted gas on unnecessary transactions.

The current implementation optimizes gas usage by:

1. Not requiring Ether to be sent with bids
2. Only requiring the winning bidder to send Ether when finalizing the auction

This optimization significantly reduces gas costs for bidders and prevents capital from being locked in the contract during the bidding process.

## Deployment
The contract is deployed and verified on sepolia testnet.
Deployed Address - 0x44a3FddA51F410A76FfE844e7DAd3b6ae7235f05

Here is the link of deployed address on etherscan - https://sepolia.etherscan.io/address/0x44a3FddA51F410A76FfE844e7DAd3b6ae7235f05#code