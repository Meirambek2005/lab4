library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity level1 is
    Port (
        x1, x2, x3, x4 : in  STD_LOGIC_VECTOR(1 downto 0);
        carry_in : in  STD_LOGIC;
        carry_out : out STD_LOGIC;
        result : out STD_LOGIC_VECTOR(3 downto 0)
    );
end level1;

architecture rtl of level1 is
    component double_adder is
        Port (
            a : in  STD_LOGIC_VECTOR(1 downto 0);
            b : in  STD_LOGIC_VECTOR(1 downto 0);
            carry_in : in  STD_LOGIC;
            carry_out : out STD_LOGIC;
            sum : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component double_multiply is
        Port (
            a : in  STD_LOGIC_VECTOR(1 downto 0);
            b : in  STD_LOGIC_VECTOR(1 downto 0);
            multiply_result : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal sum_from_adder1 : STD_LOGIC_VECTOR(1 downto 0);
    signal sum_from_adder2 : STD_LOGIC_VECTOR(1 downto 0);
    signal interim_carry : STD_LOGIC;
begin
    inst_double_adder1: double_adder port map (
        a => x1,
        b => x2,
        carry_in => carry_in,
        carry_out => interim_carry,
        sum => sum_from_adder1
    );

    inst_double_adder2: double_adder port map (
        a => x3,
        b => x4,
        carry_in => interim_carry,
        carry_out => carry_out,
        sum => sum_from_adder2
    );

    inst_multiply: double_multiply port map (
        a => sum_from_adder1,
        b => sum_from_adder2,
        multiply_result => result
    );
end rtl;
