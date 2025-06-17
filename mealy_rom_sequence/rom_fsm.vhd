library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 

entity rom_fsm is
    port(
        in_addr     : in std_logic_vector(2 downto 0);
        out_ns      : out std_logic_vector(2 downto 0);
        out_y       : out std_logic_vector(2 downto 0)
    );
end entity;

architecture rtl of rom_fsm is
    type rom_t is array (0 to 7) of std_logic_vector(5 downto 0);
    constant cons_ROM : rom_t :=
       (0 => "001" & "000",
        1 => "011" & "001",
        2 => "000" & "010",
        3 => "101" & "011",
        4 => "000000",
        5 => "111" & "101",
        6 => "000000",
        7 => "010" & "111");
begin
    out_ns  <= cons_ROM(to_integer(unsigned(in_addr)))(5 downto 3);
    out_y   <= cons_ROM(to_integer(unsigned(in_addr)))(2 downto 0);
end architecture;    
        