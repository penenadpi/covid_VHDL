entity covid1 is
	port (A : in  bit_vector (2 downto 0);
		F1 : out bit_vector (6 downto 0);
		F2 : out bit_vector (6 downto 0);
		C : out bit
);
end entity;

architecture covid1_arch of covid1 is
begin
	
with (A) select 
C <= '1' when "000",
     '0' when "001",
     '0' when "010",
     '0'  when "011",
     '0' when "100",
     '0' when "101",
     '0' when "110",
     '0' when "111";


with (A) select 
F1 <= "1111110" when "000",
      "0110111" when "001",
      "0110011" when "010",
      "0110111" when "011",
      "0110111" when "100",
      "0110111" when "101",
      "0110111" when "110",
      "0110111" when "111";

with (A) select 
F2 <= "0110111" when "000",
      "1001111" when "001",
      "0110111" when "010",
      "1001111" when "011",
      "1001111" when "100",
      "1001111" when "101",
      "1001111" when "110",
      "1001111" when "111";

end architecture;


entity covid1_TB is
end entity;

architecture covid1_TB_arch of covid1_TB is
component covid1
	port (A : in  bit_vector (2 downto 0);
	      F1 : out bit_vector (6 downto 0);
	      F2 : out bit_vector (6 downto 0); 
	      C : out bit
);
end component;

	signal A_TB : bit_vector (2 downto 0);
	signal F1_TB :  bit_vector (6 downto 0);
	signal F2_TB :  bit_vector (6 downto 0);
	signal C_TB :  bit;		
begin
	DUT1: covid1 port map (A => A_TB, F1 => F1_TB, F2 => F2_TB, C=>C_TB);

	STIMULUS : process

	begin
		A_TB <= "000"; wait for 100 ps;
		A_TB <= "001"; wait for 100 ps;
		A_TB <= "101"; wait for 100 ps;
	end process;

end architecture;



