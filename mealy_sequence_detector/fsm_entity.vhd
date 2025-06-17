library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fsm_package.all;

entity fsm_entity is
port(
    in_clk     : in std_logic;
    in_reset   : in std_logic;
    in_a       : in std_logic;
    out_y      : out std_logic;
    reg_count  : out std_logic_vector(3 downto 0)
);
end entity;

architecture structural of fsm_entity is 

    signal reg_state, reg_nextState : state_type;
    signal reg_count_1s : unsigned(3 downto 0) := (others => '0'); 

begin

    -- PROCESS 1 : State Register 
    process(in_clk, in_reset)
    begin 
        if in_reset = '1' then
            reg_state <= S0;
            reg_count_1s <= (others => '0');
        elsif rising_edge(in_clk) then
            reg_state <= reg_nextState;
            if in_a = '1' then
                reg_count_1s <= reg_count_1s + 1;
            end if;
        end if;
    end process;
    
    --PROCESS 2 : Next State Logic
    process(reg_state, in_a)
    begin
        case reg_state is 
            when S0 =>
                if in_a = '1' then
                    reg_nextState <= S1;
                else
                    reg_nextState <= S0;
                end if;
            when S1 =>
                if in_a = '1' then
                    reg_nextState <= S2;
                else
                    reg_nextState <= S1;
                end if;
            when S2 =>
                if in_a = '1' then
                    reg_nextState <= S0;
                else
                    reg_nextState <= S2;
                end if;
        end case;
    end process;
    
    -- PRCESS 3 : Output Logic Mealy
    process(reg_state, in_a)
    begin
        case reg_state is
            when S0 =>
                if in_a = '1' then
                    if reg_count_1s /= 0 then
                        out_y <= '1';
                    end if;
                else 
                    out_y <= '0';
                end if;
            when others =>
                out_y <= '0';
        end case;
    end process;
        
    reg_count <= std_logic_vector(reg_count_1s); 
    
end architecture;