library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity students_det is

    port (
		  INP      : in std_logic_vector(4 downto 0);
		  CLK      : in std_logic;
		  RESET    : in std_logic;
        OUTP     : out std_logic);
		  
end students_det;

architecture behavioural of students_det is

	type state is (RST,S1,S2,S3,S4,S5,S6,S7);
	
	signal Y_Present, Y_Next : state := RST;
	
		begin
		
		CLK_PROC: process (CLK,RESET)
		begin
		
			if (CLK'event and CLK = '1') then
				
				if (RESET = '1') then
				
					Y_Present <= RST;
					
				else
					
					Y_Present <= Y_Next;
				
				end if;
				
			end if;
			
		end process;
		
		ST_PROC: process (INP, Y_Present)
		begin
			
			case Y_present is
				
				when RST =>
				
					if (unsigned(INP) = 19) then
						
						Y_Next <= S1;
						
					else
					
						Y_Next <= RST;
					
					end if;
				
				when S1 =>
				
					if (unsigned(INP) = 20) then
						
						Y_Next <= S2;
						
					else
					
						Y_Next <= S1;
					
					end if;
						
				when S2 =>
				
					if (unsigned(INP) = 21) then
						
						Y_Next <= S3;
						
					else
					
						Y_Next <= S2;
						
					end if;
				
				when S3 =>
				
					if (unsigned(INP) = 4) then
						
						Y_Next <= S4;
						
					else
					
						Y_Next <= S3;
						
					end if;
				
				when S4 =>
				
					if (unsigned(INP) = 5) then
						
						Y_Next <= S5;
						
					else
					
						Y_Next <= S4;
						
					end if;
				
				when S5 =>
				
					if (unsigned(INP) = 14) then
						
						Y_Next <= S6;
						
					else
					
						Y_Next <= S5;
					
					end if;
				
				when S6 =>
				
					if (unsigned(INP) = 20) then
						
						Y_Next <= S7;
						
					else
					
						Y_Next <= S6;
					
					end if;
				
				when S7 =>
				
					if (unsigned(INP) = 19) then
						
						Y_Next <= S1;
						
					else
					
						Y_Next <= S7;
					
					end if;
						
				when others =>
				
						null;
			
			end case;
		
		end process;
		
		OUTP_PROC: process(INP, Y_present)
		begin
		
			case Y_present is
				
				when S7 =>
				
					if (unsigned(INP) = 19) then
						
						OUTP <= '1';
						
					else
					
						OUTP <= '0';
					
					end if;
						
				when others =>
				
						OUTP <= '0';
			
			end case;
			
		end process;

end behavioural;
