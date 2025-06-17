library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_tb is
end entity;

architecture behavior of fsm_tb is

    component fsm_entity is
        port (
            in_clk      : in std_logic;
            in_reset    : in std_logic;
            in_a        : in std_logic;
            out_y       : out std_logic;
            reg_count   : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Signal declarations
    signal s_clk, s_reset, s_a, s_y : std_logic := '0';
    signal s_count : std_logic_vector(3 downto 0);

begin

    -- Instantiate Unit Under Test (UUT)
    uut : fsm_entity
        port map (
            in_clk      => s_clk,
            in_reset    => s_reset,
            in_a        => s_a,
            out_y       => s_y,
            reg_count   => s_count
        );


    -- Clock generation process
    clk_process : process
    begin
        while true loop
            s_clk <= '0';
            wait for 10 ns;
            s_clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Stimulus process
    stim_process : process
    begin
        s_reset <= '1';
        s_a <= '0';
        wait for 25 ns;
        s_reset <= '0';

        -- Sequence: 1 0 1 1 0 1
        s_a <= '1'; wait for 20 ns;
        s_a <= '0'; wait for 20 ns;
        s_a <= '1'; wait for 20 ns;
        s_a <= '1'; wait for 20 ns;
        s_a <= '0'; wait for 20 ns;
        s_a <= '1'; wait for 20 ns;

        wait;
    end process;
end architecture behavior;