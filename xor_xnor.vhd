--standard xor
ENTITY xor IS
  PORT( A1: in std_logic;
        A2: in std_logic;
        AOut: out std_logic  );
END xor;

ARCHITECTURE behavioural OF xor IS
CONSTANT gate_delay: TIME:= 5ns
BEGIN
  AOut <= (A1 XOR A2) after gate_delay; --XOR gate
END behavioural;

--standard xnor
ENTITY xnor IS
  PORT( B1: in std_logic;
        B2: in std_logic;
        BOut: out std_logic  );
END xnor;

ARCHITECTURE behavioural OF or IS
BEGIN
  BOut <= (B1 XNOR B2); --OR gate
END behavioural;

--fix for the i/o inversion on certain boards

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY xor_xnor IS
  PORT( A1: in std_logic;
        A2: in std_logic;
        AOut: out std_logic
        B1: in std_logic;
        B2: in std_logic;
        BOut: out std_logic );
END xor_xnor;

ARCHITECTURE behavioural OF IS
SIGNAL X1,X2,XOut,Y1,Y2,YOut: std_logic;
CONSTANT gate_delay: TIME:=5ns;
BEGIN
  XOut <= (X1 XOR X2) after gate_delay; --AND gate
  YOut <= (Y1 XNOR Y2); --OR gate
  
  X1 <= NOT A1;
  X2 <= NOT A2;
  AOut <= NOT XOut;
  
  Y1 <= NOT B1;
  Y2 <= NOT B2;
  BOut <= NOT YOut;
END behavioural;
