pragma circom 2.0.0;

template selector() {
    signal input inputs[2];
    signal input i;
    signal output out[2];

    i * (1 - s) === 0;
    out[0] <== (in[1] - in[0]) * i + in[0];
    out[1] <== (in[0] - in[1]) * i + in[1];
}
