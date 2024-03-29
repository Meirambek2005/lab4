library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.all;

entity tb_level1 is 

end tb_level1;

architecture behavioral of tb_level1 is
    signal cnt: std_logic_vector(8 downto 0) := (others => '0');
    signal result: std_logic_vector(3 downto 0);
      signal carry_out: std_logic;
begin
    cnt <= cnt + 1 after 50ns;
    
    dut: entity work. level1(rtl)
    port map(
        x1 => cnt(8 downto 7),
        x2 => cnt(6 downto 5),
        x3 => cnt(4 downto 3),
        x4 => cnt(2 downto 1),
        carry_in => cnt(0),
        carry_out => carry_out,
        result => result(3 downto 0)
    );
    
end behavioral;