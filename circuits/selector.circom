pragma circom 2.0.0;

template selector() {
    signal input inputs[2];
    signal input x;
    signal output out[2];

    x * (1 - x) === 0;
    out[0] <== (inputs[1] - inputs[0]) * x + inputs[0];
    out[1] <== (inputs[0] - inputs[1]) * x + inputs[1];
}
