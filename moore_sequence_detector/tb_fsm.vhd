library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use work.fsm_package.all;

entity tb_fsm is
end entity;

architecture test of tb_fsm is

    --Component
    component top_fsm is
        port (
            in_clk      : in std_logic;
            in_reset    : in std_logic;
            in_a        : in std_logic_vector(1 downto 0); 
            out_y       : out std_logic 
        );
    end component;
    
    --Test
    signal tb_clk       : std_logic := '0';
    signal tb_reset     : std_logic := '1';
    signal tb_a         : std_logic_vector(1 downto 0) := "00";
    signal tb_y         : std_logic;
    
    constant clk_period : time := 20 ns;
    
begin

    clk_process : process
    begin
        while true loop
            tb_clk <= '0';
            wait for clk_period/2;
            tb_clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;
    
    uut : top_fsm
        port map (
            in_clk => tb_clk,
            in_reset => tb_reset,
            in_a => tb_a,
            out_y => tb_y
        );
        
    stim_proc : process
    begin
        --reset
        wait for 20ns;
        tb_reset <= '0';
        
        -- 🧪 Test Sequence (i) => 01, 00 -> yout = 0
        tb_a <= "01";
        wait for clk_period;
        tb_a <= "00";
        wait for clk_period;
        
        -- 🧪 Test Sequence (ii) => 11, 00 -> yout = 1
        tb_a <= "11";
        wait for clk_period;
        tb_a <= "00";
        wait for clk_period;

        -- 🧪 Test Sequence (iii) => 10, 00 -> toggle yout (should go to 0)
        tb_a <= "10";
        wait for clk_period;
        tb_a <= "00";
        wait for clk_period;

        -- Repeat toggle: 10, 00 -> toggle again (should go to 1)
        tb_a <= "10";
        wait for clk_period;
        tb_a <= "00";
        wait for clk_period;

        -- No sequence, should stay same
        tb_a <= "11";
        wait for clk_period;
        tb_a <= "10";
        wait for clk_period;
        tb_a <= "01";
        wait for clk_period;

        wait;
    end process;
end architecture;