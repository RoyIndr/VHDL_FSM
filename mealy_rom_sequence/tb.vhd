----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.06.2025 17:11:57
-- Design Name: 
-- Module Name: tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb is
--  Port ( );
end tb;

architecture behavioral of tb is
    signal s_clk, s_reset   : std_logic := '0';
    signal s_out            : std_logic_vector(2 downto 0);
    
    type pattern is array (0 to 5) of std_logic_vector(2 downto 0);
    constant cons_pattern : pattern := ("000", "001", "011", "101", "111", "010");
    
    signal s_cycle : integer := 0;
begin
    uut : entity work.top
        port map(
            in_clk => s_clk,
            in_reset => s_reset,
            out_y => s_out
        );
        
        s_clk <= not s_clk after 10ns;
        
        s_reset <= '1', '0' after 40ns;
        
        process(s_clk)
        begin
            if rising_edge(s_clk) and s_reset = '0' then
                if s_out /= cons_pattern(s_cycle mod 6) then
                    assert s_out = cons_pattern(s_cycle mod 6)
                    report "Mismatch at cycle " & integer'image(s_cycle)
                    severity failure;
                end if;
                
                s_cycle <= s_cycle + 1;
                if s_cycle = 12 then
                    assert false report "Simulation Finished Ok" severity note;
                end if;
            end if;
        end process;
end behavioral;
