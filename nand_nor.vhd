--standard NAND
ENTITY nand IS
  PORT( A1: in std_logic;
        A2: in std_logic;
        AOut: out std_logic  );
END nand;

ARCHITECTURE behavioural OF nand IS
CONSTANT gate_delay: TIME:= 5ns
BEGIN
  AOut <= (A1 NAND A2) after gate_delay; --NAND gate
END behavioural;

--standard NOR
ENTITY nor IS
  PORT( B1: in std_logic;
        B2: in std_logic;
        BOut: out std_logic  );
END nor;

ARCHITECTURE behavioural OF nor IS
BEGIN
  BOut <= (B1 NOR B2); --NOR gate
END behavioural;

--fix for the i/o inversion on certain boards

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY nand_nor IS
  PORT( A1: in std_logic;
        A2: in std_logic;
        AOut: out std_logic
        B1: in std_logic;
        B2: in std_logic;
        BOut: out std_logic );
END ;

ARCHITECTURE behavioural OF nand_nor IS
SIGNAL X1,X2,XOut,Y1,Y2,YOut: std_logic;
CONSTANT gate_delay: TIME:=5ns;
BEGIN
  XOut <= (X1 NAND X2) after gate_delay; --NAND gate
  YOut <= (Y1 NOR Y2); --NOR gate
  
  X1 <= NOT A1;
  X2 <= NOT A2;
  AOut <= NOT XOut;
  
  Y1 <= NOT B1;
  Y2 <= NOT B2;
  BOut <= NOT YOut;
END behavioural;
