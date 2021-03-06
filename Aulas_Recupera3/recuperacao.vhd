-- Sequencia 3 //
library ieee;
use ieee.std_logic_1164.all; 

entity recuperacao is
port(
    clk : in std_logic;
    sequencia : in std_logic_vector(2 downto 0);
    saida_mealy: out std_logic );
end recuperacao;

architecture arch of recuperacao is 
    type stateMealy_type is (um, dois);
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
	 
    ----------
    -- Mealy--
    process(present_state)
    begin 
        next_state <= present_state;
        saida_mealy <= '0';
		  
        case present_state is 
				when um => 
				if sequencia => (1) then
					next_state <= dois;
					saida_mealy <= '0';
				 end if;

				when dois =>
				if sequencia => (0) then
					next_state <= um;
					saida_mealy <= '1';
				end if;
				
				when others => null;
        end case;
    end process;
end arch; 