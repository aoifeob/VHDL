LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY inverter IS
  -- assume an 8-bit bus
  PORT(   A: in std_logic_vector(7 downto 0);
          B: out std_logic(7 downto 0)  );
END inverter;

ARCHITECTURE behavioural OF inverter IS
BEGIN
  B <= NOT A;
END behavioural;
