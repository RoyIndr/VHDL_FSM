library ieee;use ieee.std_logic_1164.all;
use work.fsm_package.all; 

entity top_fsm is
    port(
        in_clk      : in std_logic;
        in_reset    : in std_logic;
        in_a        : in std_logic_vector(1 downto 0);
        out_y       : out std_logic
    );
end entity;


architecture structural of top_fsm is
    signal reg_currentState, reg_nextState : state_type;
    signal s_y_internal                    : std_logic;
    signal s_y_output                      : std_logic := '0';
begin

   reg_isnt : entity work.state_register
        port map(
            in_clk => in_clk,
            in_reset => in_reset,
            in_nextState => reg_nextState,
            out_currentState => reg_currentState
        );
    
    next_inst : entity work.next_state_logic
        port map(
            in_a => in_a,
            in_currentState => reg_currentState,
            out_nextState => reg_nextState
        );
        
    out_inst : entity work.output_logic
        port map(
            in_currentState => reg_currentState,
            in_prevOutput => s_y_output,
            out_y => s_y_internal
        );
    
    process(in_clk, in_reset)
    begin
        if in_reset = '1' then
            s_y_output <= '0';
        elsif rising_edge(in_clk) then
            s_y_output <= s_y_internal;
        end if;
    end process;
        
    out_y <= s_y_output;
end architecture;