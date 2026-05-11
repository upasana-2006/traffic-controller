module tb_traffic;
reg clk;
reg reset;
reg emergency;
wire [2:0] NS;
wire [2:0] EW;

trafficcontrol uut(
    .clk(clk),
    .reset(reset),
    .emergency(emergency),
    .NS(NS),
    .EW(EW)
);
// Clock generation
always #5 clk = ~clk;
initial
begin
    // Initialize inputs
    clk = 0;
    reset = 1;
    emergency = 0;
    // Release reset
    #20 reset = 0;
    // Normal operation for some time
    #120;
    // Trigger emergency
    emergency = 1;
    // Emergency active duration
    #50;
    // Remove emergency
    emergency = 0;
    // Continue simulation
    #200;
    $stop;
end
endmodule
