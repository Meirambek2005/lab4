library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity double_multiply is
    Port (
        a : in  STD_LOGIC_VECTOR(1 downto 0);
        b : in  STD_LOGIC_VECTOR(1 downto 0);
        multiply_result : out STD_LOGIC_VECTOR(3 downto 0)
    );
end double_multiply;

architecture rtl of double_multiply is
    component half_adder is
        Port (
            a : in  STD_LOGIC;
            b : in  STD_LOGIC;
            sum : out STD_LOGIC;
            carry : out STD_LOGIC
        );
    end component;

    signal and_results : STD_LOGIC_VECTOR(3 downto 0);
    signal out_carry_1, out_carry_2 : STD_LOGIC;
begin
    and_results(0) <= a(0) and b(0);
    and_results(1) <= a(1) and b(0);
    and_results(2) <= a(0) and b(1);
    and_results(3) <= a(1) and b(1); 

    multiply_result(0) <= and_results(0);

    inst_HA_1: half_adder port map (
        a => and_results(2),
        b => and_results(1),
        sum => multiply_result(1),
        carry => out_carry_1
    );

    inst_HA_2: half_adder port map (
        a => out_carry_1,
        b => and_results(3),
        sum => multiply_result(2),
        carry => multiply_result(3)
    );
end rtl;
