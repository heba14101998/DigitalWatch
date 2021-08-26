-- Module Name:    Multiplication Operation - Behavioral 
--creator Name : Nahla Hatem 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mult is
    Port ( x : in  STD_LOGIC_VECTOR (7 downto 0);
           y : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (15 downto 0));
end mult;

architecture Behavioral of mult is
component f_a 
port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c : out  STD_LOGIC);
end component;
signal v :std_logic_vector(63 downto 0);
signal c :std_logic_vector(76 downto 0);
signal b :std_logic_vector(73 downto 0);
begin
v(0)<=x(0)and y(0);      v(1)<=x(0)and y(1);
v(2)<=x(0)and y(2);      v(3)<=x(0)and y(3);
v(4)<=x(0)and y(4);      v(5)<=x(0)and y(5);
v(6)<=x(0)and y(6);      v(7)<=x(0)and y(7);

v(8)<=x(1)and y(0);      v(9)<=x(1)and y(1);
v(10)<=x(1)and y(2);      v(11)<=x(1)and y(3);
v(12)<=x(1)and y(4);      v(13)<=x(1)and y(5);
v(14)<=x(1)and y(6);      v(15)<=x(1)and y(7);

v(16)<=x(2)and y(0);      v(17)<=x(2)and y(1);
v(18)<=x(2)and y(2);     v(19)<=x(2)and y(3);
v(20)<=x(2)and y(4);      v(21)<=x(0)and y(5);
v(22)<=x(2)and y(6);      v(23)<=x(0)and y(7);

v(24)<=x(3)and y(0);     v(25)<=x(3)and y(1);
v(26)<=x(3)and y(2);     v(27)<= x(3) and y(3);
v(28)<=x(3)and y(4);      v(29)<=x(3)and y(5);
v(30)<=x(3)and y(6);      v(31)<=x(3)and y(7);

v(32)<=x(4)and y(0);      v(33)<=x(4)and y(1);
v(34)<=x(4)and y(2);      v(35)<=x(4)and y(3);
v(36)<=x(4)and y(4);      v(37)<=x(4)and y(5);
v(38)<=x(4)and y(6);      v(39)<=x(4)and y(7);

v(40)<=x(5)and y(0);      v(41)<=x(5)and y(1);
v(42)<=x(5)and y(2);      v(43)<=x(5)and y(3);
v(44)<=x(5)and y(4);      v(45)<=x(5)and y(5);
v(46)<=x(5)and y(6);      v(47)<=x(5)and y(7);

v(48)<=x(6)and y(0);      v(49)<=x(6)and y(1);
v(50)<=x(6)and y(2);     v(51)<=x(6)and y(3);
v(52)<=x(6)and y(4);      v(53)<=x(6)and y(5);
v(54)<=x(6)and y(6);      v(55)<=x(6)and y(7);

v(56)<=x(7)and y(0);     v(57)<=x(7)and y(1);
v(58)<=x(7)and y(2);     v(59)<= x(7) and y(3);
v(60)<=x(7)and y(4);      v(61)<=x(7)and y(5);
v(62)<=x(7)and y(6);      v(63)<=x(7)and y(7);


q(0)<=v(0);

 U0: f_a port map(x=>v(1),y=>v(8),z=>'0',s=>q(1),c=>C(0));
 
 U1: f_a port map(x=>v(2),y=>v(9),z=>C(0),s=>b(0),c=>C(1));
 U2: f_a port map(x=>b(0),y=>v(16),z=>'0',s=>q(2),c=>C(2));
 
 U3: f_a port map(x=>v(3),y=>v(10),z=>C(1),s=>b(1),c=>C(3));
 U4: f_a port map(x=>b(1),y=>v(17),z=>C(2),s=>b(2),c=>C(4));
 U5: f_a port map(x=>b(2),y=>v(24),z=>'0',s=>q(3),c=>C(5));
 
 U6: f_a port map(x=>v(4),y=>v(11),z=>C(3),s=>b(4),c=>C(6));
 U7: f_a port map(x=>b(4),y=>v(18),z=>C(4),s=>b(5),c=>C(7));
 U8: f_a port map(x=>b(5),y=>v(25),z=>C(5),s=>b(6),c=>C(8));
 U9: f_a port map(x=>b(6),y=>v(32),z=>'0',s=>q(4),c=>C(9));
 
 
U10: f_a port map(x=>v(5),y=>v(12),z=>C(6),s=>b(7),c=>C(10));
U11: f_a port map(x=>b(7),y=>v(19),z=>C(7),s=>b(8),c=>C(11));
U12: f_a port map(x=>b(8),y=>v(26),z=>C(8),s=>b(9),c=>C(12));
U13: f_a port map(x=>b(9),y=>v(33),z=>C(9),s=>b(10),c=>C(13));
U14: f_a port map(x=>b(10),y=>v(40),z=>'0',s=>q(5),c=>C(14));

U15: f_a port map(x=>v(6),y=>v(13),z=>C(10),s=>b(11),c=>C(15));
U16: f_a port map(x=>b(11),y=>v(20),z=>C(11),s=>b(12),c=>C(16));
U17: f_a port map(x=>b(12),y=>v(27),z=>C(12),s=>b(13),c=>C(17));
U18: f_a port map(x=>b(13),y=>v(34),z=>C(13),s=>b(14),c=>C(18));
U19: f_a port map(x=>b(14),y=>v(41),z=>C(14),s=>b(15),c=>C(19));
U20: f_a port map(x=>b(15),y=>v(49),z=>'0',s=>q(6),c=>C(20));

U21: f_a port map(x=>v(7),y=>v(14),z=>C(15),s=>b(16),c=>C(21));
U22: f_a port map(x=>b(16),y=>v(21),z=>C(16),s=>b(17),c=>C(22));
U23: f_a port map(x=>b(17),y=>v(28),z=>C(17),s=>b(18),c=>C(23));
U24: f_a port map(x=>b(18),y=>v(35),z=>C(18),s=>b(19),c=>C(24));
U25: f_a port map(x=>b(19),y=>v(42),z=>C(19),s=>b(20),c=>C(25));
U26: f_a port map(x=>b(20),y=>v(50),z=>C(20),s=>b(21),c=>C(26));
U27: f_a port map(x=>b(21),y=>v(57),z=>'0',s=>q(7),c=>C(27));

U28: f_a port map(x=>v(15),y=>v(22),z=>C(21),s=>b(22),c=>C(28));
U29: f_a port map(x=>b(22),y=>v(29),z=>C(22),s=>b(23),c=>C(29));
U30: f_a port map(x=>b(23),y=>v(36),z=>C(23),s=>b(24),c=>C(30));
U31: f_a port map(x=>b(24),y=>v(43),z=>C(24),s=>b(25),c=>C(31));
U32: f_a port map(x=>b(25),y=>v(51),z=>C(25),s=>b(27),c=>C(32));
U33: f_a port map(x=>b(26),y=>v(58),z=>'0',s=>b(28),c=>C(33));
U34: f_a port map(x=>b(27),y=>C(26),z=>'0',s=>q(8),c=>C(34));

U35: f_a port map(x=>v(23),y=>v(30),z=>C(28),s=>b(29),c=>C(35));
U36: f_a port map(x=>b(29),y=>v(37),z=>C(29),s=>b(30),c=>C(36));
U37: f_a port map(x=>b(30),y=>v(44),z=>C(30),s=>b(31),c=>C(37));
U38: f_a port map(x=>b(31),y=>v(52),z=>C(31),s=>b(32),c=>C(38));
U39: f_a port map(x=>b(32),y=>v(59),z=>C(32),s=>b(33),c=>C(39));
U40: f_a port map(x=>b(33),y=>'0',z=>C(33),s=>b(34),c=>C(40));
U41: f_a port map(x=>b(34),y=>'0',z=>C(34),s=>q(9),c=>C(41));

U42: f_a port map(x=>v(31),y=>v(39),z=>C(35),s=>b(35),c=>C(42));
U43: f_a port map(x=>b(35),y=>v(46),z=>C(36),s=>b(36),c=>C(43));
U44: f_a port map(x=>b(36),y=>v(54),z=>C(37),s=>b(37),c=>C(44));
U45: f_a port map(x=>b(37),y=>v(61),z=>C(38),s=>b(38),c=>C(45));
U46: f_a port map(x=>b(38),y=>'0',z=>C(39),s=>b(39),c=>C(46));
U48: f_a port map(x=>b(39),y=>'0',z=>C(40),s=>b(40),c=>C(47));
U49: f_a port map(x=>b(40),y=>'0',z=>C(41),s=>q(10),c=>C(48));

U50: f_a port map(x=>v(40),y=>v(47),z=>C(42),s=>b(41),c=>C(49));
U51: f_a port map(x=>b(41),y=>v(55),z=>C(43),s=>b(42),c=>C(50));
U52: f_a port map(x=>b(42),y=>v(62),z=>C(44),s=>b(43),c=>C(51));
U53: f_a port map(x=>b(43),y=>'0',z=>C(45),s=>b(44),c=>C(52));
U54: f_a port map(x=>b(44),y=>'0',z=>C(46),s=>b(45),c=>C(53));
U55: f_a port map(x=>b(45),y=>'0',z=>C(47),s=>b(46),c=>C(54));
U56: f_a port map(x=>b(46),y=>'0',z=>C(48),s=>q(11),c=>C(55));

U57: f_a port map(x=>v(48),y=>v(56),z=>C(49),s=>b(47),c=>C(56));
U58: f_a port map(x=>b(47),y=>v(63),z=>C(50),s=>b(48),c=>C(57));
U59: f_a port map(x=>b(48),y=>'0',z=>C(51),s=>b(49),c=>C(58));
U60: f_a port map(x=>b(49),y=>'0',z=>C(52),s=>b(50),c=>C(59));
U61: f_a port map(x=>b(50),y=>'0',z=>C(53),s=>b(51),c=>C(60));
U62: f_a port map(x=>b(51),y=>'0',z=>C(54),s=>b(52),c=>C(61));
U63: f_a port map(x=>b(52),y=>'0',z=>C(55),s=>q(12),c=>C(62));

U64: f_a port map(x=>v(57),y=>v(62),z=>C(56),s=>b(53),c=>C(63));
U65: f_a port map(x=>b(53),y=>'0',z=>C(57),s=>b(54),c=>C(64));
U66: f_a port map(x=>b(54),y=>'0',z=>C(58),s=>b(55),c=>C(65));
U67: f_a port map(x=>b(55),y=>v(8),z=>C(59),s=>b(56),c=>C(66));
U68: f_a port map(x=>b(56),y=>C(60),z=>'0',s=>b(57),c=>C(67));
U69: f_a port map(x=>b(57),y=>C(61),z=>'0',s=>b(58),c=>C(68));
U70: f_a port map(x=>b(58),y=>C(62),z=>'0',s=>q(13),c=>C(69));

U71: f_a port map(x=>v(63),y=>'0',z=>C(63),s=>b(59),c=>C(70));
U72: f_a port map(x=>b(4),y=>C(64),z=>'0',s=>b(60),c=>C(71));
U73: f_a port map(x=>b(5),y=>C(65),z=>'0',s=>b(70),c=>C(72));
U74: f_a port map(x=>b(15),y=>C(66),z=>'0',s=>b(71),c=>C(73));
U75: f_a port map(x=>b(6),y=>C(67),z=>'0',s=>b(72),c=>C(74));
U76: f_a port map(x=>b(7),y=>C(68),z=>'0',s=>b(73),c=>C(75));
U77: f_a port map(x=>b(7),y=>C(69),z=>'0',s=>q(14),c=>C(76));

q(15)<= C(70) and C(71) and C(72) and C(73)and  C(74) AND C(75) AND C(76);

end Behavioral;
