
module INPUT_MAJORITY_CIRCUIT(
    input [4:0] x,
    output z
    );
    wire [9:0] w;
    and and1(w[0],x[2],x[3],x[4]);
    and and2(w[1],x[1],x[3],x[4]);
    and and3(w[2],x[1],x[2],x[4]);
    and and4(w[3],x[1],x[3],x[2]);
    and and5(w[4],x[0],x[3],x[4]);
    and and6(w[5],x[0],x[2],x[4]);
    and and7(w[6],x[0],x[3],x[2]);
    and and8(w[7],x[1],x[0],x[4]);
    and and9(w[8],x[1],x[3],x[0]);
    and and10(w[9],x[1],x[0],x[2]);
    or or1(z,w[0],w[1],w[2],w[3],w[4],w[5],w[6],w[7],w[8],w[9]);
endmodule

