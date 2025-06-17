library ieee;
use ieee.std_logic_1164.all;

entity top is
    port (
        in_clk      : in std_logic;
        in_reset    : in std_logic;
        out_y       : out std_logic_vector(2 downto 0)
    );
end entity;

architecture structural of top is
    component rom_fsm
        port (
            in_addr : in std_logic_vector(2 downto 0);
            out_ns  : out std_logic_vector(2 downto 0);
            out_y   : out std_logic_vector(2 downto 0)
        );
    end component;
    
    
    component reg3
        port (
            in_clk      : in std_logic;
            in_reset    : in std_logic;
            in_d        : in std_logic_vector(2 downto 0);
            out_q       : out std_logic_vector(2 downto 0)
        ); 
    end component;
    
    signal s_cs     : std_logic_vector(2 downto 0);
    signal s_ns     : std_logic_vector(2 downto 0);
    signal s_output : std_logic_vector(2 downto 0);
   
begin
    --REgiste
    reg : reg3
        port map(
            in_clk => in_clk,
            in_reset => in_reset,
            in_d => s_ns,
            out_q => s_cs
        );
        
    --ROM
    rom : rom_fsm
        port map(
            in_addr => s_cs,
            out_ns => s_ns,
            out_y => s_output
        );
        
    out_y <= s_output;
end architecture;