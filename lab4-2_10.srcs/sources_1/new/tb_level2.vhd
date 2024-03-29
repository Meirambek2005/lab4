library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.all;

entity tb_level2 is 

end tb_level2;

architecture behavioral of tb_level2 is
    signal cnt: std_logic_vector(16 downto 0) := (others => '0');
    signal result: std_logic_vector(7 downto 0);
      signal carry_out: std_logic;
begin
    cnt <= cnt + 1 after 50ns;
    
    dut: entity work. level2(rtl)
    port map(
        x1 => cnt(16 downto 13),
        x2 => cnt(12 downto 9),
        x3 => cnt(8 downto 5),
        x4 => cnt(4 downto 1),
        carry_in => cnt(0),
        carry_out => carry_out,
        result => result(7 downto 0)
    );
    
end behavioral;