library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity level2 is
    Port (
        x1, x2, x3, x4 : in  STD_LOGIC_VECTOR(3 downto 0);
        carry_in : in  STD_LOGIC;
        carry_out : out STD_LOGIC;
        result : out STD_LOGIC_VECTOR(7 downto 0)
    );
end level2;

architecture rtl of level2 is
    component level1 is
        Port (
            x1, x2, x3, x4 : in  STD_LOGIC_VECTOR(1 downto 0);
            carry_in : in  STD_LOGIC;
            carry_out : out STD_LOGIC;
            result : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal interim_carry : STD_LOGIC;
    signal result_part1, result_part2 : STD_LOGIC_VECTOR(3 downto 0);
begin
    inst_level1_1: level1 port map (
        x1 => x1(1 downto 0),
        x2 => x2(1 downto 0),
        x3 => x3(1 downto 0),
        x4 => x4(1 downto 0),
        carry_in => carry_in,
        carry_out => interim_carry,
        result => result_part1
    );

    inst_level1_2: level1 port map (
        x1 => x1(3 downto 2),
        x2 => x2(3 downto 2),
        x3 => x3(3 downto 2),
        x4 => x4(3 downto 2),
        carry_in => interim_carry,
        carry_out => carry_out,
        result => result_part2
    );

    result <= result_part2 & result_part1;
end rtl;
