library ieee;
use ieee.std_logic_1164.all;
use work.fsm_package.all; 

entity next_state_logic is
    port(
        in_a            : in std_logic_vector(1 downto 0);
        in_currentState : in state_type;
        out_nextState   : out state_type
    );
end entity;

architecture rtl of next_state_logic is
begin
    process(in_currentState, in_a)
    begin
        out_nextState <= S00;
        case in_currentState is
            when S00 =>
                case in_a is
                    when "01" => out_nextState <= S01;
                    when "11" => out_nextState <= S11;
                    when "10" => out_nextState <= S10;
                    when others => out_nextState <= S00;
                end case;
            
            when S01 =>
                if in_a = "00" then
                    out_nextState <= S00;
                else 
                    out_nextState <= S01;
                end if;
                
            when S11 =>
                if in_a = "00" then
                    out_nextState <= S00;
                else 
                    out_nextState <= S11;
                end if;
                
            when S10 =>
                if in_a = "00" then
                    out_nextState <= S00;
                else 
                    out_nextState <= S10;
                end if;
            
            when others =>
                out_nextState <= S00;
                
        end case;
    end process;
end architecture;