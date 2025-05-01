library verilog;
use verilog.vl_types.all;
entity Lab6Q3_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        A_Latch_Reset   : in     vl_logic;
        B               : in     vl_logic_vector(7 downto 0);
        B_Latch_Reset   : in     vl_logic;
        Clock           : in     vl_logic;
        Decoder_Enabler : in     vl_logic;
        FSM_Data_In     : in     vl_logic;
        FSM_Reset       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Lab6Q3_vlg_sample_tst;
