pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/poseidon.circom";

template cred() {
  signal input accountRoot;

  component poseidon = Poseidon(1);
  poseidon.inputs[0] <== accountRoot;
  log(poseidon.out);
}

component main{public [accountRoot]} = cred();