library verilog;
use verilog.vl_types.all;
entity Lab6Q3_vlg_check_tst is
    port(
        ID_Output       : in     vl_logic_vector(0 to 6);
        Lower_Output    : in     vl_logic_vector(0 to 6);
        sampler_rx      : in     vl_logic
    );
end Lab6Q3_vlg_check_tst;
