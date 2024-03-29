library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        carry_in : in  STD_LOGIC;
        carry_out : out STD_LOGIC;
        sum : out STD_LOGIC
    );
end full_adder;

architecture rtl of full_adder is
    component half_adder is
        Port (
            a : in  STD_LOGIC;
            b : in  STD_LOGIC;
            sum : out STD_LOGIC;
            carry : out STD_LOGIC
        );
    end component;
    
    signal out_sum1 : STD_LOGIC;
    signal out_carry1, out_carry2 : STD_LOGIC;
begin
    inst_add1: half_adder port map (
        a => a,
        b => b,
        sum => out_sum1,
        carry => out_carry1
    );

    inst_add2: half_adder port map (
        a => carry_in,
        b => out_sum1,
        sum => sum,
        carry => out_carry2
    );

    carry_out <= out_carry1 or out_carry2;
end rtl;
