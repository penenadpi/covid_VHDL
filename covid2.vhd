Library IEEE;
use IEEE.std_logic_1164.all;

entity covid2 is
	port (Clock, Reset : in std_logic;
		Input	 : in std_logic_vector (1 downto 0);
		Output		 : out std_logic_vector (1 downto 0));
end entity;

architecture covid2_arch of covid2 is	
	type State_Type is (Start, Cert, Hand);
	signal current_state, next_state : State_Type;	
begin

STATE_MEMORY : process (Clock, Reset)
begin
	if (Reset='0') then
		current_state <= Start;
	elsif (Clock'event and Clock='1') then 
		current_state <= next_state;
	end if;
end process;

	

NEXT_STATE_LOGIC : process (current_state, Input)
begin
	case (current_state) is
 		when Start => if (Input = "00") then
		next_state <= Cert;
		else 
		next_state <= Start;
		end if;

		when Cert =>  if (Input = "01") then
			next_state <= Hand;
		else 
			next_state <= Start;
		end if;

		when Hand =>  if (Input = "01") then
			next_state <= Start;
		else 
			next_state <= Start;
		end if;
		when others => next_state <= Start;
		end case;
		end process;
	
OUTPUT_LOGIC : process (current_state, Input)
	begin
		case (current_state) is

 			when Start   => if (Input = "00") then
				Output <= "00";
			else 
				Output <= "00";
			end if;
	
 			when Cert   => if (Input = "01") then
				Output <= "01";
			else 
				Output <= "00";
			end if;

 			when Hand   => if (Input = "10") then
				Output <= "01";
			else 
				Output <= "10";
			end if;
	
			when others => Output <= "00";
end case;
end process;

end architecture;

