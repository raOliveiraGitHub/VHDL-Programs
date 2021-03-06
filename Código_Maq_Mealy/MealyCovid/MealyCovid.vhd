-- Mealy Covid // Detector
library ieee;
use ieee.std_logic_1164.all; 

entity MealyCovid is
port(
    clk : in std_logic;
    in1 : in std_logic;
     -- Assumir que:
     -- 1 - Avança no estado
     -- 0 - Fica no mesmo estado
    saida_mealy: out std_logic );
end MealyCovid;

architecture arch of MealyCovid is 
    
    type stateMealy_type is (temp, febre, base_dados); -- 3 estados Mealy
    signal present_state, next_state : stateMealy_type;
    
begin   
    process(clk)
    begin
        if (clk'event and clk = '1') then
            present_state <= next_state;
        else
            null;
        end if; 
    end process;
    
    -- Mealy
    process(present_state, in1)
    begin 
        next_state <= present_state;
        
        saida_mealy <= '0';
	  case present_state is 
			when temp => 
			 if in1 = '1' then
				  next_state <= febre;
				  saida_mealy <= '0';
			 end if;
					
			 when febre =>
			 if in1 = '1' then
				  next_state <= base_dados;
			 else
				  next_state <= temp;
			 end if; 
					saida_mealy <= '0';
					
			 when base_dados =>
			 if in1 = '1' then
				  next_state <= temp;
				  saida_mealy <= '1';
			 else
				  next_state <= temp;
				  saida_mealy <= '0';
			 end if; 
	  end case;
    end process;
end arch; 