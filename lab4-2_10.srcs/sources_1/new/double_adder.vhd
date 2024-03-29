library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity double_adder is
    Port (
        a : in  STD_LOGIC_VECTOR(1 downto 0);
        b : in  STD_LOGIC_VECTOR(1 downto 0);
        carry_in : in  STD_LOGIC;
        sum : out STD_LOGIC_VECTOR(1 downto 0);
        carry_out : out STD_LOGIC
    );
end double_adder;

architecture rtl of double_adder is
    component full_adder is
        Port (
            a : in  STD_LOGIC;
            b : in  STD_LOGIC;
            carry_in : in  STD_LOGIC;
            sum : out STD_LOGIC;
            carry_out : out STD_LOGIC
        );
    end component;
    
    signal out_carry_from_adder1 : STD_LOGIC;
begin
    inst_add1: full_adder port map (
        a => a(0),
        b => b(0),
        carry_in => carry_in,
        sum => sum(0),
        carry_out => out_carry_from_adder1
    );

    inst_add2: full_adder port map (
        a => a(1),
        b => b(1),
        carry_in => out_carry_from_adder1,
        sum => sum(1),
        carry_out => carry_out
    );
end rtl;
