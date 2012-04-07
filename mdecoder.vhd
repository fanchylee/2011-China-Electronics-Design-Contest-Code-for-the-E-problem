----------------------------------------------------------------------------------
-- Company: BWRC
-- Engineers: Anton Ageev, Wenting Zhou
--
-- Create Date: 18:14:06 12/07/2009
-- Design Name:
-- Module Name: mydecoder - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description: Manchester decoder and clock recovery module
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity mydecoder is
generic (JITTER_COEF: integer := 3); --jitter is halfcycle/(2^JITTER_COEF)
Port ( CLK : in STD_LOGIC;
RST : in STD_LOGIC;
MANCH : in STD_LOGIC; -- Manchester signal
SYNC : out STD_LOGIC; -- recovered clock
SERIALDATA : out STD_LOGIC; -- decoded data
DBL_BSB : out STD_LOGIC -- recovered clock of a doubled frequency
);
end mydecoder;
architecture Behavioral of mydecoder is
signal pos_counter : std_logic_vector (31 downto 0) := (others=>'0');-- time since last positive edge of Manchester signal
signal neg_counter : std_logic_vector (31 downto 0) := (others=>'0');-- time since last negative edge of Manchester signal
signal half_cycle1 : std_logic_vector (31 downto 0) := (others=>'0');-- halfcycle of Manchester clock, computed on pos. edges
signal half_cycle2 : std_logic_vector (31 downto 0) := (others=>'0');-- halfcycle of Manchester clock, computed on neg. edges
signal start_pos_count : std_logic := '1';-- resets pos_counter
signal start_neg_count : std_logic := '1';-- resets neg_counter
signal first_pos_transition : std_logic :='1';-- indicates whether the first pos. edge is expected
signal first_neg_transition : std_logic :='1';-- indicates whether the first neg. edge is expected
signal sync_signal : std_logic :='0';-- clock signal recovered from Manchester signal (Manchester clock)
signal current_bit : std_logic := '0';-- data bit decoded from Manchester signal
signal doubled_baseband : std_logic := '0'; -- doubled frequency clock signal recovered from Manchester signal
begin
SERIALDATA <= current_bit;
SYNC <= sync_signal;
-- this process resets and increases the counters which measure the time between Manchester edges:
process (CLK,pos_counter,neg_counter,MANCH,start_pos_count,start_neg_count,RST)
begin
if (RST = '1') then
pos_counter <= (others=>'0');
neg_counter <= (others=>'0');
start_pos_count<='1';
start_neg_count<='1';
elsif (CLK'event and CLK = '1') then
if(MANCH='1')then -- if the last edge was positive
if(start_pos_count='1')then
pos_counter <= (others=>'0'); -- reset the counter
start_pos_count<='0';
-- to reset it just once
start_neg_count<='1';
-- to reset neg. counter on the next neg. edge
else
pos_counter <= pos_counter + 1;
end if;
-- keep increasing neg. counter to be able to compute the difference between two counters:
neg_counter <= neg_counter + 1;
else -- if the last edge was negative
if(start_neg_count='1')then
neg_counter <= (others=>'0'); -- reset the counter
start_neg_count<='0';
-- to reset it just once
start_pos_count<='1';
-- to reset pos. counter on the next pos. edge
else
neg_counter <= neg_counter + 1;
end if;
-- keep increasing pos. counter to be able to compute the difference between two counters:
pos_counter <= pos_counter + 1;
end if;
end if;
end process;
-- this process decodes Manchester signal:
process (sync_signal,MANCH,RST)
begin
if (RST = '1') then
current_bit <= '0';
elsif (sync_signal'event AND sync_signal = '1') then -- pos. clock edge
-- Manchester data (G. E. Thomas convention: _/ 0\_ 1 ):
current_bit<=NOT MANCH;
end if;
end process;
-- this process derives clock signal from Manchester signal:
process (CLK, sync_signal, doubled_baseband, half_cycle1, half_cycle2, pos_counter, neg_counter, RST)
begin
if (RST = '1') then
sync_signal <= '0';
doubled_baseband <= '0';
elsif (CLK'event AND CLK = '1') then
if(pos_counter = 0) then -- when a positive edge happens
sync_signal <= NOT sync_signal;
doubled_baseband <= NOT doubled_baseband;
else
if (neg_counter = 0) then -- when a negative edge happens
sync_signal <= NOT sync_signal;
doubled_baseband <= NOT doubled_baseband;
else
if(pos_counter < neg_counter)then -- after the last positive Manchester edge
if(pos_counter = half_cycle1 + half_cycle1(31 downto JITTER_COEF))then
sync_signal <= NOT sync_signal;
doubled_baseband <= NOT doubled_baseband;
elsif (pos_counter = ('0' & half_cycle1(31 downto 1)) OR pos_counter = half_cycle1 + ('0' & half_cycle1(31
downto 1)))then
doubled_baseband <= NOT doubled_baseband;
end if;
else
-- after the last negative Manchester edge
if(neg_counter = half_cycle2 + half_cycle2(31 downto JITTER_COEF))then
sync_signal <= NOT sync_signal;
doubled_baseband <= NOT doubled_baseband;
elsif (neg_counter = ('0' & half_cycle2(31 downto 1)) OR neg_counter = half_cycle2 + ('0' & half_cycle2(31
downto 1)))then
doubled_baseband <= NOT doubled_baseband;
end if;
end if;
end if;
end if;
end if;
end process;
DBL_BSB <= doubled_baseband;
-- this process computes duration of halfcycles on positive edges of Manchester signal:
process (MANCH,first_pos_transition,first_neg_transition,neg_counter,half_cycle2,RST)
begin
if (RST = '1') then
first_pos_transition <= '1';
half_cycle1<=(others=>'0');
else
if MANCH'event and MANCH = '1' then
-- only for the first positive edge:
if (first_pos_transition = '1') then
first_pos_transition <= '0';
-- if a negative edge already happend:
if(first_neg_transition='0')then
-- half cycle duration just equals to the time passed since the last negative edge:
half_cycle1<=neg_counter;
end if;
else -- for all consecutive positive edges
-- if the time passed since last neg. edge is approximately one halfcycle, use it as a new half cycle value for clock signal(jitter equals to an eighth of a halfcycle):
if (neg_counter > (half_cycle2-half_cycle2(31 downto JITTER_COEF)) AND neg_counter <
(half_cycle2+half_cycle2(31 downto JITTER_COEF))) then
-- half cycle duration just equals to the time passed since the last negative edge:
half_cycle1<=neg_counter;
-- otherwise, check whether the time passed since last neg. edge is approximately two halfcycles (jitter equals to aquarter of a halfcycle); if so, new value equals to neg. counter value divided by 2:
else
if (neg_counter > (half_cycle2+half_cycle2-half_cycle2(31 downto (JITTER_COEF-1))) AND neg_counter <
(half_cycle2+half_cycle2+half_cycle2(31 downto (JITTER_COEF-1)))) then
half_cycle1 <= '0' & neg_counter(31 downto 1);--divide by 2
end if;
end if;
end if;
end if;
end if;
end process;
-- this process computes duration of halfcycles on negative edges of Manchester signal:
process (MANCH,first_neg_transition,first_pos_transition,pos_counter,half_cycle1,RST)
begin
if (RST = '1') then
first_neg_transition <= '1';
half_cycle2<=(others=>'0');
else
if MANCH'event and MANCH = '0' then
if (first_neg_transition = '1') then -- only for the first negative edge
first_neg_transition <= '0';
if(first_pos_transition='0')then -- if a positive edge already happened
-- half cycle duration just equals to the time passed since the last positive edge:
half_cycle2 <= pos_counter;
end if;
else -- for all consecutive negative edges
-- if the time passed since last pos. edge is approximately one halfcycle, use it as a new half cycle value for clock signal(jitter equals to an eighth of a halfcycle):
if (pos_counter > (half_cycle1-half_cycle1(31 downto JITTER_COEF)) AND pos_counter <
(half_cycle1+half_cycle1(31 downto JITTER_COEF))) then
-- half cycle duration just equals to the time passed since the last positive edge:
half_cycle2 <= pos_counter;
-- otherwise, check whether the time passed since last pos. edge is approximately two halfcycles (jitter equals to a quarterof a halfcycle); if so, new value equals to pos. counter value divided by 2 :
else
if (pos_counter > (half_cycle1+half_cycle1-half_cycle1(31 downto (JITTER_COEF-1))) AND pos_counter <
(half_cycle1+half_cycle1+half_cycle1(31 downto (JITTER_COEF-1)))) then
half_cycle2 <= '0'& pos_counter(31 downto 1); -- divide by 2
end if;
end if;
end if;
end if;
end if;
end process;
end Behavioral;

