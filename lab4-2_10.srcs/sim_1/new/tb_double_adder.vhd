library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.all;

entity tb_double_adder is 

end tb_double_adder;

architecture behavioral of tb_double_adder is
    signal cnt: std_logic_vector(4 downto 0) := (others => '0');
    signal sum: std_logic_vector(2 downto 0);
begin
    cnt <= cnt + 1 after 50ns;
    
    dut: entity work.double_adder(rtl)
    port map(
        a => cnt(4 downto 3),
        b => cnt(2 downto 1),
        carry_in => cnt(0),
        sum => sum(1 downto 0),
        carry_out => sum(2)
    );
    
end behavioral;

