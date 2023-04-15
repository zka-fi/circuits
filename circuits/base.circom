pragma circom 2.0.0;

include "./tree.circom";
include "../node_modules/circomlib/circuits/comparators.circom";
include "../node_modules/circomlib/circuits/poseidon.circom";

template cred(levels) {
  signal input accountRoot;
  signal input path[levels];
  signal input idx[levels];
  signal input certValue;
  signal input borrowAmount;

  // amout check: borrow and cert value
  component amountCheck = GreaterThan(252);
  amountCheck.in[0] <== certValue;
  amountCheck.in[1] <== borrowAmount;
  amountCheck.out === 1;
  // leaf index
  component leafIndexNum = Bits2Num(levels);
  for (var i = 0; i < levels; i++) {
      leafIndexNum.in[i] <== idx[i];
  }
  // 1. verify user account exist
  component userLeaf = Poseidon(1);
  userLeaf.inputs[0] <== certValue;
  log("certValue Hash", userLeaf.out);

  // 2. verify user account include
  component userTree = treeCheck(levels);
  userTree.root <== accountRoot;
  userTree.leaf <== userLeaf.out;
  for(var i = 0; i < levels; i++) {
      userTree.pathElements[i] <== path[i];
      userTree.pathIndices[i] <== idx[i];
  }
}

component main{public [accountRoot, borrowAmount]} = cred(3);