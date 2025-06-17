library ieee;
use ieee.std_logic_1164.all; 
use work.fsm_package.all; 

entity state_register is
    port (
        in_clk              : in std_logic;
        in_reset            : in std_logic;
        in_nextState        : in state_type;
        out_currentState    : out state_type
    );
end entity;

architecture rtl of state_register is
    signal reg_state : state_type := S00;
begin
    process(in_clk, in_reset)
    begin
        if in_reset = '1' then
            reg_state <= S00;
        elsif rising_edge(in_clk) then
            reg_state <= in_nextState;
        end if;
    end process;
    
    out_currentState <= reg_state;
end architecture;