module trafficcontrol(
    input clk,
    input reset,
    input emergency,
    output reg [2:0] NS,
    output reg [2:0] EW
);

parameter RED    = 3'b100;
parameter YELLOW = 3'b010;
parameter GREEN  = 3'b001;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

reg [1:0] state;
reg [3:0] timer;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= S0;
        timer <= 0;
    end

    else if(!emergency)
    begin
        case(state)

        S0:
        begin
            if(timer == 10)
            begin
                state <= S1;
                timer <= 0;
            end
            else
                timer <= timer + 1;
        end

        S1:
        begin
            if(timer == 3)
            begin
                state <= S2;
                timer <= 0;
            end
            else
                timer <= timer + 1;
        end

        S2:
        begin
            if(timer == 10)
            begin
                state <= S3;
                timer <= 0;
            end
            else
                timer <= timer + 1;
        end

        S3:
        begin
            if(timer == 3)
            begin
                state <= S0;
                timer <= 0;
            end
            else
                timer <= timer + 1;
        end

        endcase
    end
end


always @(*)
begin

    if(emergency)
    begin
        NS = GREEN;
        EW = RED;
    end

    else
    begin
        case(state)

        S0:
        begin
            NS = GREEN;
            EW = RED;
        end

        S1:
        begin
            NS = YELLOW;
            EW = RED;
        end

        S2:
        begin
            NS = RED;
            EW = GREEN;
        end

        S3:
        begin
            NS = RED;
            EW = YELLOW;
        end

        default:
        begin
            NS = RED;
            EW = RED;
        end

        endcase
    end
end

endmodule
