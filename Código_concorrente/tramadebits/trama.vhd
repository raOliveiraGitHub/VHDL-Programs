-- trama de bits //
library ieee;
use ieee.std_logic_1164.all;
entity trama is

port(	trama : in std_logic_vector(2 downto 0);
		saida : out std_logic_vector(6 downto 0));
end trama;

architecture bits of trama is

begin
	saida(0) <= not trama(2) and not trama(1) and not trama(0);
	saida(1) <= not trama(2) and  trama(1) and not trama(0);
	saida(2) <=  trama(2) and  not trama(1) and not trama(0);
	saida(3) <= not trama(2) and trama(1) and trama(0);
	saida(4) <= trama(2) and not trama(1) and not trama(0);
	saida(5) <= trama(2) and not trama(1) and trama(0);
	saida(6) <= trama(2) and trama(1) and trama(0);
end bits;