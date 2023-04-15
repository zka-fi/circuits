pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/poseidon.circom";
include "./selector.circom";

template treeCheck(levels) {
  signal input root;
  signal input leaf;
  signal input pathElements[levels];
  signal input pathIndices[levels];

  component selector;
  component hash;

  for (var i = 0; i < levels; i++) {
    selectors[i] = selector();
    selectors[i].inputs[0] <== i == 0 ? leaf : hash[i - 1].out;
    selectors[i].inputs[1] <== pathElements[i];
    selectors[i].i <== pathIndices[i];

    hash[i] = Poseidon(2);
    hash[i].inputs[0] <== selectors[i].out[0];
    hash[i].inputs[1] <== selectors[i].out[1];

    //TODO: delete this part after debugging
    log("selector-left", selectors[i].out[0]);
    log("selector-right", selectors[i].out[1]);
    log("Hash Result:", hash[i].out);
    }
}
