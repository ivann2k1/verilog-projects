
module fifo #(
    parameter data_width = 8,                    
    parameter data_depth = 8                    
)(
    input clk,                                   
    input reset,                                 
    input [data_width-1:0] data_in,              
    output reg [data_width-1:0] data_out,       
    output full,                               
    output empty,                                
    input rd_enable,                            
    input wr_enable                              
);

    reg [data_width-1:0] memory [0:data_depth-1]; 

    reg [$clog2(data_depth)-1:0] wr_ptr;         
    reg [$clog2(data_depth)-1:0] rd_ptr;         
    reg [$clog2(data_depth+1)-1:0] count;        

    assign full = (count == data_depth);        
    assign empty = (count == 0);                


    always @(posedge clk) begin                 

        if(reset) begin                          
            wr_ptr <= 0;                        
            rd_ptr <= 0;                         
            data_out <= 0;                      
        end
        else begin                               
            if(!full && wr_enable) begin         
                memory[wr_ptr] <= data_in;      
                if(wr_ptr == data_depth-1) begin 
                    wr_ptr <= 0;                
                end

                else begin
                    wr_ptr <= wr_ptr + 1;      
                end
            end
            if(!empty && rd_enable) begin        
                data_out <= memory[rd_ptr];      

                if(rd_ptr == data_depth-1) begin 
                    rd_ptr <= 0;                 
                end

                else begin
                    rd_ptr <= rd_ptr + 1;        
                end

            end

        end

    end
    always @(posedge clk) begin                 

        if(reset) begin                         
            count <= 0;                          
        end

        else if(!rd_enable && !full && wr_enable) begin 
            count <= count + 1;                 
        end

        else if(rd_enable && !empty && !wr_enable) begin
            count <= count - 1;                
        end

    end

endmodule
