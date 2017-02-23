--standard and
ENTITY and IS
  PORT( A1: in std_logic;
        A2: in std_logic;
        AO: out std_logic;  );
END and;

ARCHITECTURE behavioural OF and IS
CONSTANT gate_delay: TIME:= 5ns
BEGIN
  AO <= (A1 AND A2) after gate_delay; --AND gate
END behavioural;

--standard or
ENTITY or IS
  PORT( O1: in std_logic;
        O2: in std_logic;
        OO: out std_logic;  );
END or;

ARCHITECTURE behavioural OF or IS
BEGIN
  OO <= (O1 OR O2); --OR gate
END behavioural;

--fix for the i/o inversion on certain boards

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY IS
  PORT( A1: in std_logic;
        A2: in std_logic;
        AO: out std_logic
        O1: in std_logic;
        O2: in std_logic;
        OO: out std_logic );
END ;

ARCHITECTURE behavioural OF IS
SIGNAL X1,X2,XO,Y1,Y2,YO: std_logic;
CONSTANT gate_delay: TIME:=5ns;
BEGIN
  XO <= (X1 AND X2) after gate_delay; --AND gate
  YO <= (Y1 OR Y2); --OR gate
  
  X1 <= NOT A1;
  X2 <= NOT A2;
  AO <= NOT XO;
  
  Y1 <= NOT O1;
  Y2 <= NOT O2;
  OO <= NOT YO;
END behavioural;
