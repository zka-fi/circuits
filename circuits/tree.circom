pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/poseidon.circom";

template treeCheck(levels) {
  signal input root;
  signal input leaf;
  signal input pathElements[levels];
  signal input pathIndices[levels];

  component hasher = Poseidon(1);
  for (var i = 0; i < levels; i++) {
    hasher[i] = Poseidon(2);
    hasher
    log(hashers[i].out);
    }
}
