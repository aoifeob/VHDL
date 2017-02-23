--standard NAND
ENTITY nand IS
  PORT( A1: in std_logic;
        A2: in std_logic;
        AO: out std_logic;  );
END nand;

ARCHITECTURE behavioural OF nand IS
CONSTANT gate_delay: TIME:= 5ns
BEGIN
  AO <= (A1 NAND A2) after gate_delay; --NAND gate
END behavioural;

--standard NOR
ENTITY nor IS
  PORT( O1: in std_logic;
        O2: in std_logic;
        OO: out std_logic;  );
END nor;

ARCHITECTURE behavioural OF nor IS
BEGIN
  OO <= (O1 NOR O2); --NOR gate
END behavioural;

--fix for the i/o inversion on certain boards

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY nand_nor IS
  PORT( A1: in std_logic;
        A2: in std_logic;
        AO: out std_logic
        O1: in std_logic;
        O2: in std_logic;
        OO: out std_logic );
END ;

ARCHITECTURE behavioural OF nand_nor IS
SIGNAL X1,X2,XO,Y1,Y2,YO: std_logic;
CONSTANT gate_delay: TIME:=5ns;
BEGIN
  XO <= (X1 NAND X2) after gate_delay; --NAND gate
  YO <= (Y1 NOR Y2); --NOR gate
  
  X1 <= NOT A1;
  X2 <= NOT A2;
  AO <= NOT XO;
  
  Y1 <= NOT O1;
  Y2 <= NOT O2;
  OO <= NOT YO;
END behavioural;
