library ieee;
use ieee.std_logic_1164.all; 
use work.fsm_package.all; 

entity output_logic is
    port (
        in_currentState : in state_type;
        in_prevOutput   : in std_logic;
        out_y           : out std_logic
    );
end entity;

architecture rtl of output_logic is
begin
    process(in_currentState, in_prevOutput)
    begin
        case in_currentState is
            when S00 =>
                out_y <= in_prevOutput ;
            when S01 =>
                out_y <= '0';
            when S11 =>
                out_y <= '1';
            when S10 =>
                out_y <= not in_prevOutput;
            when others =>
                out_y <= in_prevOutput;
        end case;
    end process;
end architecture;
                
