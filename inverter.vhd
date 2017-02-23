LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY inverter IS
  PORT(   A: in std_logic;
          B: out std_logic  );
END inverter;

ARCHITECTURE behavioural OF inverter IS
BEGIN
  B <= NOT A;
END behavioural;
