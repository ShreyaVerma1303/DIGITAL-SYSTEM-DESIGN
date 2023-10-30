module gcd_fsm (
  input wire clk,
  input wire reset,
  input wire start,
  input wire [31:0] a,
  input wire [31:0] b,
  output wire [31:0] gcd
);

  typedef enum logic [3:0] {
    IDLE = 4'b0000,
    SUBTRACT = 4'b0001,
    COMPARE = 4'b0010,
    OUTPUT = 4'b0011
  } state_t;

  reg [3:0] state, next_state;
  reg [31:0] a_reg, b_reg, gcd_reg;

  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      state <= IDLE;
    else
      state <= next_state;
  end

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      a_reg <= 32'h0;
      b_reg <= 32'h0;
      gcd_reg <= 32'h0;
    end else begin
      case (state)
        IDLE: begin
          a_reg <= a;
          b_reg <= b;
          gcd_reg <= 32'h0;
        end
        SUBTRACT: begin
          if (a_reg > b_reg)
            a_reg <= a_reg - b_reg;
          else
            b_reg <= b_reg - a_reg;
        end
        COMPARE: begin
          if (a_reg == b_reg)
            gcd_reg <= a_reg;
        end
        OUTPUT: begin
          gcd_reg <= a_reg;
        end
        default: begin
          a_reg <= a;
          b_reg <= b;
          gcd_reg <= 32'h0;
        end
      endcase
    end
  end

  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      next_state <= IDLE;
    else
      next_state <= state;
  end

  always_comb begin
    case (state)
      IDLE: next_state = start ? SUBTRACT : IDLE;
      SUBTRACT: next_state = SUBTRACT;
      COMPARE: next_state = COMPARE;
      OUTPUT: next_state = OUTPUT;
      default: next_state = IDLE;
    endcase
  end

  assign gcd = gcd_reg;

endmodule

module gcd_fsm_testbench;
  reg clk;
  reg reset;
  reg start;
  reg [31:0] a;
  reg [31:0] b;
  wire [31:0] gcd;
  gcd_fsm uut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .a(a),
    .b(b),
    .gcd(gcd)
  );
  always begin
    #5 clk = ~clk;
  end
  initial begin
    clk = 0;
    reset = 0;
    start = 1;
    a = 48;
    b = 18;
    #10 reset = 1;
    #10 reset = 0;
    #10 start = 1;
    #10 start = 0;
    $finish  end
  always @(posedge clk) begin
    $display("GCD: %d", gcd);
  end
endmodule


