library ieee;
use ieee.std_logic_1164.all; 

entity reg3 is 
    port(
        in_clk      : in std_logic;
        in_reset    : in std_logic;
        in_d        : in std_logic_vector(2 downto 0);
        out_q       : out std_logic_vector(2 downto 0)
    );
end entity;

architecture rtl of reg3 is
    signal s_r : std_logic_vector(2 downto 0);
begin
    process(in_clk, in_reset)
    begin
        if in_reset = '1' then
            s_r <= (others => '0');
        elsif rising_edge(in_clk) then
            s_r <= in_d;
        end if;
    end process;
    
    out_q <= s_r;
end architecture;