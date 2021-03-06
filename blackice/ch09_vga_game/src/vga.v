`default_nettype none

module vga(
    input CLK,  // BlackIce 100MHz
    output HS, VS,
    output [9:0] x,
    output reg [9:0] y,
    output blank
    );

reg [15:0] prescaler;

reg [9:0] xc;
 
// Horizontal 640 + fp 16 + HS 96 + bp 48 = 800 pixel clocks
// Vertical, 480 + fp 11 lines + VS 2 lines + bp 31 lines = 524 lines
assign blank = ((xc < 160) | (xc > 800) | (y > 479));
assign HS = ~ ((xc > 16) & (xc < 112));
assign VS = ~ ((y > 491) & (y < 494));
assign x = ((xc < 160)?0:(xc - 160));

always @(posedge CLK)
begin

  prescaler <= prescaler + 1;

  if (prescaler == 3)
  begin
    prescaler <= 0;
    if (xc == 800)
    begin
      xc <= 0;
      y <= y + 1;
    end
    else begin
      xc <= xc + 1;
    end
    if (y == 524)
    begin
      y <= 0; 
    end
  end
end

endmodule
