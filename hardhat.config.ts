import 'hardhat-circom'

module.exports = {
  solidity: '0.6.11',
  circom: {
    inputBasePath: "./circuits",
    ptau: "https://hermezptau.blob.core.windows.net/ptau/powersOfTau28_hez_final_15.ptau",
    circuits: [
      {
        name: "base",
        protocol: "groth16",
      },
    ],
  },
};
