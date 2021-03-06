Library ieee;
use ieee.std_logic_1164.all;

Entity up_down is
Port( clk, rst : in std_logic;
        botao : in std_logic;
        s0, s1 : out std_logic);
End up_down;

architecture teste of up_down is
type stateMoore_type is (zero, one); 
signal stateMoore_reg, stateMoore_next : stateMoore_type;

begin
process(clk, rst)
begin
    if (rst = '1') then
        stateMoore_reg <= zero;
    elsif (clk'event and clk = '1') then
        stateMoore_reg <= stateMoore_next;
    else 
        null;
    end if;
end process;

process(stateMoore_reg)
begin 
        stateMoore_next <= stateMoore_reg;
          if (botao = '1') then
        case stateMoore_reg is 
            when zero => 
                    s0 <= '1';
                    s1 <= '0';
               stateMoore_next <= one;
            when one =>
                    s0 <= '0';
                    s1 <= '1';
                    stateMoore_next <= zero; 
        end case;
          end if;
    end process;  
end teste;