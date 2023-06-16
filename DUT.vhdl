-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
-- students_det.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(6 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   component students_det is
     port (
		  INP      : in std_logic_vector(4 downto 0);
		  CLK      : in std_logic;
		  RESET    : in std_logic;
        OUTP     : out std_logic);
		  
   end component;
	
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: students_det 
			port map (
					
					INP(4)  => input_vector(6),
					INP(3)  => input_vector(5),
					INP(2)  => input_vector(4),
					INP(1)  => input_vector(3),
					INP(0)  => input_vector(2),
					
					RESET   => input_vector(1),
					CLK     => input_vector(0),

					OUTP       => output_vector(0));

end DutWrap;

