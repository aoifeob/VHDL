--standard AND
ENTITY and IS
  PORT( A1: in std_logic;
        A2: in std_logic;
        AOut: out std_logic  );
END and;

ARCHITECTURE behavioural OF and IS
CONSTANT gate_delay: TIME:= 5ns
BEGIN
  AO <= (A1 AND A2) after gate_delay; --AND gate
END behavioural;

--standard OR
ENTITY or IS
  PORT( B1: in std_logic;
        B2: in std_logic;
        BOut: out std_logic  );
END or;

ARCHITECTURE behavioural OF or IS
BEGIN
  BOut <= (B1 OR B2); --OR gate
END behavioural;

--fix for the i/o inversion on certain boards

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY and_or IS
  PORT( A1: in std_logic;
        A2: in std_logic;
        AOut: out std_logic
        B1: in std_logic;
        B2: in std_logic;
        BOut: out std_logic );
END and_or;

ARCHITECTURE behavioural OF and_or IS
SIGNAL X1,X2,XOut,Y1,Y2,YOut: std_logic;
CONSTANT gate_delay: TIME:=5ns;
BEGIN
  XOut <= (X1 AND X2) after gate_delay; --AND gate
  YOut <= (Y1 OR Y2); --OR gate
  
  X1 <= NOT A1;
  X2 <= NOT A2;
  AOut <= NOT XOut;
  
  Y1 <= NOT B1;
  Y2 <= NOT B2;
  BOut <= NOT YOut;
END behavioural;
