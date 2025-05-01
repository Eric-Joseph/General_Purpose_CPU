library verilog;
use verilog.vl_types.all;
entity Lab6V3_vlg_check_tst is
    port(
        ID_Output       : in     vl_logic_vector(0 to 6);
        Lower_Output    : in     vl_logic_vector(0 to 6);
        Negative        : in     vl_logic_vector(0 to 6);
        Upper_Output    : in     vl_logic_vector(0 to 6);
        sampler_rx      : in     vl_logic
    );
end Lab6V3_vlg_check_tst;
