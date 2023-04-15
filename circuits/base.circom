pragma circom 2.0.0;

include "./tree.circom";
include "../node_modules/circomlib/circuits/comparators.circom";

template cred(levels) {
  signal input accountRoot;
  signal input leaf;
  // signal input path[levels];
  signal input idx[levels];
  signal input certValue;
  signal input borrowAmount;

  // amout check: borrow and cert value
  component amountCheck = GreaterThan(252);
  amountCheck.in[0] <== certValue;
  amountCheck.in[1] <== borrowAmount;
  amountCheck.out === 1;
  component leafIndexNum = Bits2Num(levels);
  for (var i = 0; i < levels; i++) {
      leafIndexNum.in[i] <== idx[i];
  }
}

component main{public [accountRoot, borrowAmount]} = cred(3);