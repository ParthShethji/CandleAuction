// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CandleAuction {
    address public owner;
    address public highestBidder;
    uint public highestBid;
    uint public auctionEndTime;
    uint public minIncrement;
    bool public ended;

    event HighestBidIncreased(address indexed bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    modifier onlyBefore(uint _time) {
        require(block.timestamp < _time, "Action not allowed after specified time.");
        _;
    }

    modifier onlyAfter(uint _time) {
        require(block.timestamp > _time, "Action not allowed before specified time.");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    constructor(uint _biddingTime, uint _minIncrement) {
        owner = msg.sender;
        auctionEndTime = block.timestamp + _biddingTime;
        minIncrement = _minIncrement;
    }

    function bid(uint amount) external onlyBefore(auctionEndTime) {
        require(amount > highestBid + minIncrement, "Bid is too low.");
        
        highestBidder = msg.sender;
        highestBid = amount;
        emit HighestBidIncreased(msg.sender, amount);
    }

    function isAuctionEnded() public view returns (bool) {
        return block.timestamp > auctionEndTime || ended;
    }

    // function endAuction() external {
    //     require(isAuctionEnded(), "Auction not yet ended or already ended.");
    //     require(!ended, "Auction has already been ended.");
    //     ended = true;
    //     emit AuctionEnded(highestBidder, highestBid);
    // }

    function finalize() external payable {
        require(isAuctionEnded(), "Auction not yet ended.");
        require(msg.sender == highestBidder, "Only the highest bidder can finalize the auction.");
        require(msg.value == highestBid, "Incorrect payment amount.");
        require(!ended, "Auction has already been finalized.");

        ended = true;  // ensures auction is marked ended before transferring funds
        payable(owner).transfer(msg.value);
    }
}
