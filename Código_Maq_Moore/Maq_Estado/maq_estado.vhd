-- Maquina estado //
library IEEE;
use IEEE.std_logic_1164.all;

 ENTITY maq_estado IS
   PORT (ck      :  IN     BIT;                    -- relogio borda subida
         rst     :  IN     BIT;                    -- rst=1, q=00
         q       :  BUFFER BIT_VECTOR (1 DOWNTO 0)); -- saida codigo Gray
 END maq_estado;
 
 
ARCHITECTURE teste OF maq_estado IS
 
 
BEGIN
   abc: PROCESS (ck, rst)
   BEGIN
     IF rst = '1' THEN                     -- estado inicial
       q <= "00";
     ELSIF (ck'EVENT and ck ='1') THEN     -- ciclo de estados
       CASE q IS
         WHEN "00" => q <= "01";
         WHEN "01" => q <= "11";
         WHEN "11" => q <= "10";
         WHEN "10" => q <= "00";
        END CASE;
     END IF;
   END PROCESS abc;
 END teste;