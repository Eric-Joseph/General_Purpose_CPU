library verilog;
use verilog.vl_types.all;
entity Lab6Q3 is
    port(
        ID_Output       : out    vl_logic_vector(0 to 6);
        Clock           : in     vl_logic;
        FSM_Data_In     : in     vl_logic;
        FSM_Reset       : in     vl_logic;
        Lower_Output    : out    vl_logic_vector(0 to 6);
        A_Latch_Reset   : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B_Latch_Reset   : in     vl_logic;
        B               : in     vl_logic_vector(7 downto 0);
        Decoder_Enabler : in     vl_logic
    );
end Lab6Q3;
