import fs from "fs"
// @ts-ignore
import { groth16 } from "snarkjs"
import { BigNumber } from "ethers"

export async function generateProof(circuitInputs: any, filePathWASM: any, filePathZKEY: any) {
  const { proof, publicSignals } = await groth16.fullProve(
    circuitInputs,
    filePathWASM,
    filePathZKEY
  )

  return proof;
}
// TODO: generate proof for test circuit
async function main() {
  const WASM_FILE_PATH = "circuits/base.wasm"
  const ZKEY_FILE_PATH = "circuits/base.zkey"

  const circuitInputs = {
    accountRoot: "0x27d7d6e3a855c2cff1234b9c249f25c97efaa6e1f67309dbe9f3c1983e3302d6",
    certValue: 9527,
    path: [
      "0x2a09a9fd93c590c26b91effbb2499f07e8f7aa12e2b4940a3aed2411cb65e11c",
      "0x231be438cf8d6a322f51a7182ae96fb67aa3a7d1673abecc96955fa51f6d7168",
      "0x2258b1ae87b52b884ce173eb875bd74d675401aa4dc20c8989f080ce517f4c30"
    ],
    idx: [ 0, 0, 1 ],
    borrowAmount: 100,
  }

  const proofData = await generateProof(
    circuitInputs,
    WASM_FILE_PATH,
    ZKEY_FILE_PATH
  )
  console.log(proofData)
}

main()