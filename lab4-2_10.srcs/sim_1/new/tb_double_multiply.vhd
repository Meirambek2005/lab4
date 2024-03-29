library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.all;

entity tb_double_multiply is 

end tb_double_multiply;

architecture behavioral of tb_double_multiply is
    signal cnt: std_logic_vector(3 downto 0) := (others => '0');
    signal multiply_result: std_logic_vector(3 downto 0);
   
begin
    cnt <= cnt + 1 after 50ns;
    
    dut: entity work.double_multiply(rtl)
    port map(
        a => cnt(3 downto 2),
        b => cnt(1 downto 0),
        multiply_result => multiply_result(3 downto 0)
    );
    
end behavioral;

