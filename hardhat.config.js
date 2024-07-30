require("@nomicfoundation/hardhat-toolbox");


const ALCHEMY_RPC = "https://eth-sepolia.g.alchemy.com/v2/1op69Jv9sNHqgEj019xkt1n6-72zCJgE"
const sepolia_private_key= "eee78bc460e45b64ea3913db899f3ed14cdc4b0e32f968e02017169c4f7cfca8"
const ETHERSCAN_API_KEY = "MC36K712I1CG23STNK7HW1QB9SX4QBUPJF"

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks:{
    sepolia:{
      url: `${ALCHEMY_RPC}`,
      accounts:[`${sepolia_private_key}`],
    }
  },
  etherscan: {
    apiKey: {
      sepolia: ETHERSCAN_API_KEY,
    },
}
};
