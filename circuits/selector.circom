pragma circom 2.0.0;

template selector() {
    signal input inputs[2];
    signal input i;
    signal output out[2];

    i * (1 - s) === 0;
    out[0] <== (inputs[1] - inputs[0]) * i + inputs[0];
    out[1] <== (inputs[0] - inputs[1]) * i + inputs[1];
}
