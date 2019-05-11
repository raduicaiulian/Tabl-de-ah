{ M.B.R.I.R.}
Program tabla_de_sah;
Uses graph,crt;
Var
tb:array[1..8,1..8] of string[2];
gd,gm,i,j,x,y:smallint;
ch,aux:string[2];
mesaj:string;

Procedure fundal;
Begin
{For i:=0 to getmaxx do
For j:=0 to getmaxy do
Putpixel(i,j,green);}
SetColor(green);
ClearDevice;
SetColor(blue);
Settextstyle(SmallFont,HorizDir,4);
OutTextXY(750,10,'Legenda:');
Settextstyle(SmallFont,HorizDir,2);
OutTextXY(600,80,'-datele se introduc in consola text;');
OutTextXY(600,110,'-programul executa orice mutare(jucatorii vor');
OutTextXY(600,140,'respecta regulile);');
OutTextXY(600,170,'-ordinea de introducere a datelor este');
OutTextXY(600,200,' litera(mica)-cifra[1,8];');
OutTextXY(600,230,'-pentru a muta o piesa tastati pozitia acesteia');
OutTextXY(600,260,'ex(a2) apoi tastati noua pozitie ex(a4);');
OutTextXY(600,290,'-utilizati tasta "r" in orice moment pentru');
OutTextXY(600,320,'a restarta jocul;');
OutTextXY(600,350,'-utilizati tasta "q" in orice moment pentru');
OutTextXY(600,380,'a inchide jocul;');
OutTextXY(600,410,'-cand ati ajuns la capat de linie cu un pion');
OutTextXY(600,440,'apasati orice tasta(mai putin tasta "s") pentru');
OutTextXY(600,470,'a schimba piesa ce va fi ataugata pe tabla, iar');
OutTextXY(600,500,'tasta "s" pentru a selecta piesa respectiva;');
Settextstyle(SmallFont,HorizDir,4);
SetColor(red);
OutTextXY(750,600,'Distractie placuta!');
End;

Procedure pion(x,y,c:smallint);
Begin
If c=1 then
Setcolor(white);
If c=2 then
Setcolor(black);
Circle(105+x,15+y,8);
Line(90+x,45+y,100+x,20+y);
Line(120+x,45+y,110+x,20+y);
Line(90+x,45+y,120+x,45+y);
End;

Procedure cal(x,y,c:smallint);
Begin
If c=1 then
Setcolor(white);
If c=2 then
Setcolor(black);
Arc(89+x,15+y,300,360,10);
Line(99+x,15+y,114+x,15+y);
Line(106+x,15+y,114+x,7+y);
Line(114+x,7+y,114+x,15+y);
Line(94+x,23+y,100+x,30+y);
Line(100+x,30+y,105+x,25+y);
Line(100+x,45+y,110+x,23+y);
Line(114+x,15+y,119+x,45+y);
Line(119+x,45+y,100+x,45+y);
Arc(109+x,33+y,80,120,10);
End;

Procedure nebun(x,y,c:smallint);
Begin
If c=1 then
Setcolor(white);
If c=2 then
Setcolor(black);
Circle(26+x,5+y,3);
Arc(26+x,15+y,200,340,10);
Line(24+x,7+y,17+x,20+y);
Line(28+x,7+y,35+x,20+y);
Line(35+x,20+y,28+x,16+y);
Arc(10+x,26+y,320,360,10);
Arc(10+x,26+y,0,10,10);
Arc(10+x,36+y,300,360,10);
Arc(10+x,36+y,0,30,10);
Arc(43+x,26+y,165,220,10);
Arc(43+x,36+y,160,240,10);
Line(15+x,46+y,37+x,46+y);
End;

Procedure tura(x,y,c:smallint);
Begin
If c=1 then
Setcolor(white);
If c=2 then
Setcolor(black);
Line(90+x,45+y,100+x,20+y);
Line(120+x,45+y,110+x,20+y);
Line(90+x,45+y,120+x,45+y);
Line(90+x,20+y,120+x,20+y);
Line(90+x,20+y,90+x,10+y);
Line(120+x,20+y,120+x,10+y);
Line(105+x,20+y,105+x,10+y);
End;

Procedure regina(x,y,c:smallint);
Begin
If c=1 then
Setcolor(white);
If c=2 then
Setcolor(black);
For i:=1 to 7 do
Line(14+x,6+y,14+x+i,22+y);
For i:=1 to 9 do
Line(24+x,5+y,19+x+i,22+y);
For i:=1 to 6 do
Line(32+x,6+y,33+x-i,22+y);
End;

Procedure rege(x,y,c:smallint);
Begin
If c=1 then
Setcolor(white);
If c=2 then
Setcolor(black);
For i:=1 to 2 do
Begin
Line(25+x+i,5+y,25+x+i,17+y);
Line(22+x,8+y+i,31+x,8+y+i);
End;
Line(21+x,22+y,32+x,22+y);
Line(18+x,17+y,21+x,22+y);
Line(35+x,17+y,32+x,22+y);
Line(18+x,17+y,35+x,17+y);
Line(21+x,23+y,20+x,37+y);
Line(32+x,22+y,33+x,37+y);
Arc(38+x,38+y,180,270,5);
Arc(14+x,38+y,270,360,5);
Line(38+x,43+y,14+x,43+y);
End;

Procedure tabla;
Begin
Setcolor(red);
For i:=79 to 503 do
For j:=0 to 425 do
Begin
If ((i-79) mod 53 = 0) then
Line(i,0,i,478);
If (j mod 53 = 0) then
Line(79,j,558,j);
End;
For i:=79 to 503 do
For j:=0 to 425 do
Begin
//toata tabla alba
If (j mod 53 <> 0) and ((i-79) mod 53 <> 0) then
Putpixel(i,j,7);
//1 linia neagra
If (j > 0) and (j < 53) then
 If (i>132) and (i<185) or (i>238) and (i<291) or (i>344) and (i<397) or (i>450) and (i<503) then
Putpixel(i,j,8);
//2 linia neagra
If (j > 53) and (j < 106) then
 If (i>79) and (i<132) or (i>185) and (i<238) or (i>291) and (i<344) or (i>397) and (i<450) then
Putpixel(i,j,8);
//3 linia neagra
If (j > 106) and (j < 159) then
 If (i>132) and (i<185) or (i>238) and (i<291) or (i>344) and (i<397) or (i>450) and (i<503) then
Putpixel(i,j,8);
//4 linia neagra
If (j > 159) and (j < 212) then
 If (i>79) and (i<132) or (i>185) and (i<238) or (i>291) and (i<344) or (i>397) and (i<450) then
Putpixel(i,j,8);
//5 linia neagra
If (j > 212) and (j < 265) then
 If (i>132) and (i<185) or (i>238) and (i<291) or (i>344) and (i<397) or (i>450) and (i<503) then
Putpixel(i,j,8);
//6 linie neagra
If (j > 265) and (j < 318) then
 If (i>79) and (i<132) or (i>185) and (i<238) or (i>291) and (i<344) or (i>397) and (i<450) then
Putpixel(i,j,8);
//7 linie neagra
If (j > 318) and (j < 371) then
 If (i>132) and (i<185) or (i>238) and (i<291) or (i>344) and (i<397) or (i>450) and (i<503) then
Putpixel(i,j,8);
//8 linie neagra
If (j > 371) and (j < 424) then
 If (i>79) and (i<132) or (i>185) and (i<238) or (i>291) and (i<344) or (i>397) and (i<450) then
Putpixel(i,j,8);
End;
Settextstyle(SmallFont,HorizDir,4);
Outtextxy(92,435,'a');
Outtextxy(145,435,'b');
Outtextxy(198,435,'c');
Outtextxy(251,435,'d');
Outtextxy(304,435,'e');
Outtextxy(357,435,'f');
Outtextxy(410,435,'g');
Outtextxy(463,435,'h');
Outtextxy(518,12,'1');
Outtextxy(518,65,'2');
Outtextxy(518,120,'3');
Outtextxy(518,175,'4');
Outtextxy(518,227,'5');
Outtextxy(518,280,'6');
Outtextxy(518,335,'7');
Outtextxy(518,385,'8');
End;

Procedure initpiese;
Begin
For i:=1 to 8 do
For j:=1 to 8 do
If (i=1) or (i=2) or (i=7) or (i=8) then
Begin
tb[2,j]:='i1';
tb[7,j]:='i2';
tb[8,j]:=char(j-1+ord('a'))+char(50);
tb[1,j]:=char(j-1+ord('a'))+char(49);
End
else
delete(tb[i,j],1,2);
End;

Procedure aranjare_tabla;
Begin
fundal;
tabla;
initpiese;
pion(0,53,1);
pion(53,53,1);
pion(106,53,1);
pion(159,53,1);
pion(212,53,1);
pion(265,53,1);
pion(318,53,1);
pion(371,53,1);
pion(0,318,2);
pion(53,318,2);
pion(106,318,2);
pion(159,318,2);
pion(212,318,2);
pion(265,318,2);
pion(318,318,2);
pion(371,318,2);
tura(0,0,1);
tura(372,0,1);
tura(0,375,2);
tura(372,375,2);
cal(53,0,1);
cal(320,0,1);
cal(53,375,2);
cal(317,375,2);
nebun(185,0,1);
nebun(185,371,2);
nebun(344,0,1);
nebun(344,371,2);
regina(293,0,1);
regina(293,371,2);
rege(237,0,1);
rege(237,371,2);
End;

Procedure citire_ch;
Begin
Repeat
Readln(ch);
Until (ch='a1') or (ch='b1') or (ch='c1') or (ch='d1') or (ch='e1') or (ch='f1') or (ch='g1') or (ch='h1') or
(ch='a2') or (ch='b2') or (ch='c2') or (ch='d2') or (ch='e2') or (ch='f2') or (ch='g2') or (ch='h2') or
(ch='a3') or (ch='b3') or (ch='c3') or (ch='d3') or (ch='e3') or (ch='f3') or (ch='g3') or (ch='h3') or
(ch='a4') or (ch='b4') or (ch='c4') or (ch='d4') or (ch='e4') or (ch='f4') or (ch='g4') or (ch='h4') or
(ch='a5') or (ch='b5') or (ch='c5') or (ch='d5') or (ch='e5') or (ch='f5') or (ch='g5') or (ch='h5') or
(ch='a6') or (ch='b6') or (ch='c6') or (ch='d6') or (ch='e6') or (ch='f6') or (ch='g6') or (ch='h6') or
(ch='a7') or (ch='b7') or (ch='c7') or (ch='d7') or (ch='e7') or (ch='f7') or (ch='g7') or (ch='h7') or
(ch='a8') or (ch='b8') or (ch='c8') or (ch='d8') or (ch='e8') or (ch='f8') or (ch='g8') or (ch='h8') or
(ch='q') or (ch='r');
End;

Procedure stergere;

Procedure sterge_patrat(t:string; x,y,i1,i2,j1,j2,c:smallint);
Begin
If (ch=t) then
Begin
aux:=tb[x,y];
delete(tb[x,y],1,2);
For i:=i1 to i2 do
For j:=j1 to j2 do
Putpixel(i,j,c);
End;End;

Begin
sterge_patrat('a8',8,1,80,131,372,423,8);
sterge_patrat('b8',8,2,133,184,372,423,7);
sterge_patrat('c8',8,3,186,237,372,423,8);
sterge_patrat('d8',8,4,239,290,372,423,7);
sterge_patrat('e8',8,5,292,343,372,423,8);
sterge_patrat('f8',8,6,345,396,372,423,7);
sterge_patrat('g8',8,7,398,449,372,423,8);
sterge_patrat('h8',8,8,452,502,372,423,7);
sterge_patrat('a7',7,1,80,131,319,370,7);
sterge_patrat('b7',7,2,133,184,319,370,8);
sterge_patrat('c7',7,3,186,237,319,370,7);
sterge_patrat('d7',7,4,239,290,319,370,8);
sterge_patrat('e7',7,5,292,343,319,370,7);
sterge_patrat('f7',7,6,345,396,319,370,8);
sterge_patrat('g7',7,7,398,449,319,370,7);
sterge_patrat('h7',7,8,451,502,319,370,8);
sterge_patrat('a6',6,1,80,131,266,317,8);
sterge_patrat('b6',6,2,133,184,266,317,7);
sterge_patrat('c6',6,3,186,237,266,317,8);
sterge_patrat('d6',6,4,239,290,266,317,7);
sterge_patrat('e6',6,5,292,343,266,317,8);
sterge_patrat('f6',6,6,345,396,266,317,7);
sterge_patrat('g6',6,7,398,449,266,317,8);
sterge_patrat('h6',6,8,451,503,266,317,7);
sterge_patrat('a5',5,1,80,131,213,264,7);
sterge_patrat('b5',5,2,133,184,213,264,8);
sterge_patrat('c5',5,3,186,237,213,264,7);
sterge_patrat('d5',5,4,239,290,213,264,8);
sterge_patrat('e5',5,5,292,343,213,264,7);
sterge_patrat('f5',5,6,345,396,213,264,8);
sterge_patrat('g5',5,7,398,449,213,264,7);
sterge_patrat('h5',5,8,451,502,213,264,8);
sterge_patrat('a4',4,1,80,131,160,211,8);
sterge_patrat('b4',4,2,133,184,160,211,7);
sterge_patrat('c4',4,3,186,237,160,211,8);
sterge_patrat('d4',4,4,239,290,160,211,7);
sterge_patrat('e4',4,5,292,343,160,211,8);
sterge_patrat('f4',4,6,345,396,160,211,7);
sterge_patrat('g4',4,7,398,449,160,211,8);
sterge_patrat('h4',4,8,451,502,160,211,7);
sterge_patrat('a3',3,1,80,131,107,158,7);
sterge_patrat('b3',3,2,133,184,107,158,8);
sterge_patrat('c3',3,3,186,237,107,158,7);
sterge_patrat('d3',3,4,239,290,107,158,8);
sterge_patrat('e3',3,5,292,343,107,158,7);
sterge_patrat('f3',3,6,345,396,107,158,8);
sterge_patrat('g3',3,7,398,449,107,158,7);
sterge_patrat('h3',3,8,451,502,107,158,8);
sterge_patrat('a2',2,1,80,131,54,105,8);
sterge_patrat('b2',2,2,133,184,54,105,7);
sterge_patrat('c2',2,3,186,237,54,105,8);
sterge_patrat('d2',2,4,239,290,54,105,7);
sterge_patrat('e2',2,5,292,343,54,105,8);
sterge_patrat('f2',2,6,345,396,54,105,7);
sterge_patrat('g2',2,7,398,445,54,105,8);
sterge_patrat('h2',2,8,451,502,54,105,7);
sterge_patrat('a1',1,1,80,131,1,52,7);
sterge_patrat('b1',1,2,133,184,1,52,8);
sterge_patrat('c1',1,3,186,237,1,52,7);
sterge_patrat('d1',1,4,239,290,1,52,8);
sterge_patrat('e1',1,5,292,343,1,52,7);
sterge_patrat('f1',1,6,345,396,1,52,8);
sterge_patrat('g1',1,7,398,449,1,52,7);
sterge_patrat('h1',1,8,451,502,1,52,8);
End;

Procedure replasare;
Begin
If (ch='h8') then
Begin
For i:=452 to 502 do
For j:=372 to 423 do
Putpixel(i,j,7);
tb[8,8]:=aux;
If (tb[8,8]='a1') or (tb[8,8]='h1') then
tura(372,375,1);
If(tb[8,8]='a2') or (tb[8,8]='h2') then
tura(372,375,2);
If (tb[8,8]='b1') or (tb[8,8]='g1') then
cal(370,375,1);
If (tb[8,8]='b2') or (tb[8,8]='g2') then
cal(370,375,2);
If (tb[8,8]='c1') then
nebun(450,371,1);
If (tb[8,8]='f2') then
nebun(450,371,2);
If (tb[8,8]='d1') then
rege(449,371,1);
If (tb[8,8]='d2') then
rege(449,371,2);
If (tb[8,8]='e1') then
regina(452,371,1);
If (tb[8,8]='e2') then
regina(452,371,2);
If (tb[8,8]='i1') then
pion(371,371,1);
End;
If (ch='g8') then
Begin
tb[8,7]:=aux;
For i:=398 to 449 do
For j:=372 to 423 do
Putpixel(i,j,8);
If (tb[8,7]='a1') or (tb[8,7]='h1') then
tura(319,375,1);
If(tb[8,7]='a2') or (tb[8,7]='h2') then
tura(319,375,2);
If (tb[8,7]='b1') or (tb[8,7]='g1') then
cal(317,375,1);
If (tb[8,7]='b2') or (tb[8,7]='g2') then
cal(317,375,2);
If (tb[8,7]='f1') then
nebun(397,371,1);
If (tb[8,7]='c2') then
nebun(397,371,2);
If (tb[8,7]='d1') then
rege(396,371,1);
If (tb[8,7]='d2') then
rege(396,371,2);
If (tb[8,7]='e1') then
regina(399,371,1);
If (tb[8,7]='e2') then
regina(399,371,2);
If (tb[8,7]='i1') then
pion(318,371,1);
End;
If (ch='f8') then
Begin
tb[8,6]:=aux;
For i:=345 to 396 do
For j:=372 to 423 do
Putpixel(i,j,7);
If (tb[8,6]='a1') or (tb[8,6]='h1') then
tura(266,375,1);
If(tb[8,6]='a2') or (tb[8,6]='h2') then
tura(266,375,2);
If (tb[8,6]='b1') or (tb[8,6]='g1') then
cal(264,375,1);
If (tb[8,6]='b2') or (tb[8,6]='g2') then
cal(264,375,2);
If (tb[8,6]='c1') then
nebun(344,371,1);
If (tb[8,6]='f2') then
nebun(344,371,2);
If (tb[8,6]='d1') then
rege(343,371,1);
If (tb[8,6]='d2') then
rege(343,371,2);
If (tb[8,6]='e1') then
regina(346,371,1);
If (tb[8,6]='e2') then
regina(346,371,2);
If (tb[8,6]='i1') then
pion(265,371,1);
End;
If (ch='e8') then
Begin
tb[8,5]:=aux;
For i:=292 to 343 do
For j:=372 to 423 do
Putpixel(i,j,8);
If (tb[8,5]='a1') or (tb[8,5]='h1') then
tura(213,375,1);
If(tb[8,5]='a2') or (tb[8,5]='h2') then
tura(213,375,2);
If (tb[8,5]='b1') or (tb[8,5]='g1') then
cal(211,375,1);
If (tb[8,5]='b2') or (tb[8,5]='g2') then
cal(211,375,2);
If (tb[8,5]='f1') then
nebun(291,371,1);
If (tb[8,5]='c2') then
nebun(291,371,2);
If (tb[8,5]='d1') then
rege(290,371,1);
If (tb[8,5]='d2') then
rege(290,371,2);
If (tb[8,5]='e1') then
regina(293,371,1);
If (tb[8,5]='e2') then
regina(293,371,2);
If (tb[8,5]='i1') then
pion(212,371,1);
End;
If (ch='d8') then
Begin
tb[8,4]:=aux;
For i:=239 to 290 do
For j:=372 to 423 do
Putpixel(i,j,7);
If (tb[8,4]='a1') or (tb[8,4]='h1') then
tura(160,375,1);
If(tb[8,4]='a2') or (tb[8,4]='h2') then
tura(160,375,2);
If (tb[8,4]='b1') or (tb[8,4]='g1') then
cal(158,375,1);
If (tb[8,4]='b2') or (tb[8,4]='g2') then
cal(158,375,2);
If (tb[8,4]='c1') then
nebun(238,371,1);
If (tb[8,4]='f2') then
nebun(238,371,2);
If (tb[8,4]='d1') then
rege(237,371,1);
If (tb[8,4]='d2') then
rege(237,371,2);
If (tb[8,4]='e1') then
regina(240,371,1);
If (tb[8,4]='e2') then
regina(240,371,2);
If (tb[8,4]='i1') then
pion(159,371,1);
End;
If (ch='c8') then
Begin
tb[8,3]:=aux;
For i:=186 to 237 do
For j:=372 to 423 do
Putpixel(i,j,8);
If (tb[8,3]='a1') or (tb[8,3]='h1') then
tura(107,375,1);
If(tb[8,3]='a2') or (tb[8,3]='h2') then
tura(107,375,2);
If (tb[8,3]='b1') or (tb[8,3]='g1') then
cal(105,375,1);
If (tb[8,3]='b2') or (tb[8,3]='g2') then
cal(105,375,2);
If (tb[8,3]='f1') then
nebun(185,371,1);
If (tb[8,3]='c2') then
nebun(185,371,2);
If (tb[8,3]='d1') then
rege(184,371,1);
If (tb[8,3]='d2') then
rege(184,371,2);
If (tb[8,3]='e1') then
regina(187,371,1);
If (tb[8,3]='e2') then
regina(187,371,2);
If (tb[8,3]='i1') then
pion(106,371,1);
End;
If (ch='b8') then
Begin
tb[8,2]:=aux;
For i:=133 to 184 do
For j:=372 to 423 do
Putpixel(i,j,7);
If (tb[8,2]='a1') or (tb[8,2]='h1') then
tura(54,375,1);
If(tb[8,2]='a2') or (tb[8,2]='h2') then
tura(54,375,2);
If (tb[8,2]='b1') or (tb[8,2]='g1') then
cal(52,375,1);
If (tb[8,2]='b2') or (tb[8,2]='g2') then
cal(52,375,2);
If (tb[8,2]='c1') then
nebun(132,371,1);
If (tb[8,2]='f2') then
nebun(132,371,2);
If (tb[8,2]='d1') then
rege(131,371,1);
If (tb[8,2]='d2') then
rege(131,371,2);
If (tb[8,2]='e1') then
regina(134,371,1);
If (tb[8,2]='e2') then
regina(134,371,2);
If (tb[8,2]='i1') then
pion(53,371,1);
End;
If (ch='a8') then
Begin
tb[8,1]:=aux;
For i:=80 to 131 do
For j:=372 to 423 do
Putpixel(i,j,8);
If (tb[8,1]='a1') or (tb[8,1]='h1') then
tura(1,375,1);
If(tb[8,1]='a2') or (tb[8,1]='h2') then
tura(1,375,2);
If (tb[8,1]='b1') or (tb[8,1]='g1') then
cal(-1,375,1);
If (tb[8,1]='b2') or (tb[8,1]='g2') then
cal(-1,375,2);
If (tb[8,1]='f1') then
nebun(79,371,1);
If (tb[8,1]='c2') then
nebun(79,371,2);
If (tb[8,1]='d1') then
rege(78,371,1);
If (tb[8,1]='d2') then
rege(78,371,2);
If (tb[8,1]='e1') then
regina(81,371,1);
If (tb[8,1]='e2') then
regina(81,371,2);
If (tb[8,1]='i1') then
pion(0,371,1);
End;
If (ch='h7') then
Begin
For i:=451 to 502 do
For j:=319 to 370 do
Putpixel(i,j,8);
tb[7,8]:=aux;
If (tb[7,8]='a1') or (tb[7,8]='h1') then
tura(372,322,1);
If(tb[7,8]='a2') or (tb[7,8]='h2') then
tura(372,322,2);
If (tb[7,8]='b1') or (tb[7,8]='g1') then
cal(370,322,1);
If (tb[7,8]='b2') or (tb[7,8]='g2') then
cal(370,322,2);
If (tb[7,8]='f1') then
nebun(450,318,1);
If (tb[7,8]='c2') then
nebun(450,318,2);
If (tb[7,8]='d1') then
rege(449,318,1);
If (tb[7,8]='d2') then
rege(449,318,2);
If (tb[7,8]='e1') then
regina(452,318,1);
If (tb[7,8]='e2') then
regina(452,318,2);
If (tb[7,8]='i1') then
pion(371,318,1);
End;
If (ch='g7') then
Begin
For i:=398 to 449 do
For j:=319 to 370 do
Putpixel(i,j,7);
tb[7,7]:=aux;
If (tb[7,7]='a1') or (tb[7,7]='h1') then
tura(319,322,1);
If(tb[7,7]='a2') or (tb[7,7]='h2') then
tura(319,322,2);
If (tb[7,7]='b1') or (tb[7,7]='g1') then
cal(317,322,1);
If (tb[7,7]='b2') or (tb[7,7]='g2') then
cal(317,322,2);
If (tb[7,7]='c1') then
nebun(397,318,1);
If (tb[7,7]='f2') then
nebun(397,318,2);
If (tb[7,7]='d1') then
rege(396,318,1);
If (tb[7,7]='d2') then
rege(396,318,2);
If (tb[7,7]='e1') then
regina(399,318,1);
If (tb[7,7]='e2') then
regina(399,318,2);
If (tb[7,7]='i1') then
pion(318,318,1);
End;
If (ch='f7') then
Begin
For i:=345 to 396 do
For j:=319 to 370 do
Putpixel(i,j,8);
tb[7,6]:=aux;
If (tb[7,6]='a1') or (tb[7,6]='h1') then
tura(266,322,1);
If(tb[7,6]='a2') or (tb[7,6]='h2') then
tura(266,322,2);
If (tb[7,6]='b1') or (tb[7,6]='g1') then
cal(264,322,1);
If (tb[7,6]='b2') or (tb[7,6]='g2') then
cal(264,322,2);
If (tb[7,6]='f1') then
nebun(344,318,1);
If (tb[7,6]='c2') then
nebun(344,318,2);
If (tb[7,6]='d1') then
rege(343,318,1);
If (tb[7,6]='d2') then
rege(343,318,2);
If (tb[7,6]='e1') then
regina(346,318,1);
If (tb[7,6]='e2') then
regina(346,318,2);
If (tb[7,6]='i1') then
pion(265,318,1);
End;
If (ch='e7') then
Begin
For i:=292 to 343 do
For j:=319 to 370 do
Putpixel(i,j,7);
tb[7,5]:=aux;
If (tb[7,5]='a1') or (tb[7,5]='h1') then
tura(213,322,1);
If(tb[7,5]='a2') or (tb[7,5]='h2') then
tura(213,322,2);
If (tb[7,5]='b1') or (tb[7,5]='g1') then
cal(211,322,1);
If (tb[7,5]='b2') or (tb[7,5]='g2') then
cal(211,322,2);
If (tb[7,5]='c1') then
nebun(291,318,1);
If (tb[7,5]='f2') then
nebun(291,318,2);
If (tb[7,5]='d1') then
rege(290,318,1);
If (tb[7,5]='d2') then
rege(290,318,2);
If (tb[7,5]='e1') then
regina(293,318,1);
If (tb[7,5]='e2') then
regina(293,318,2);
If (tb[7,5]='i1') then
pion(212,318,1);
End;
If (ch='d7') then
Begin
For i:=239 to 290 do
For j:=319 to 370 do
Putpixel(i,j,8);
tb[7,4]:=aux;
If (tb[7,4]='a1') or (tb[7,4]='h1') then
tura(160,322,1);
If(tb[7,4]='a2') or (tb[7,4]='h2') then
tura(160,322,2);
If (tb[7,4]='b1') or (tb[7,4]='g1') then
cal(158,322,1);
If (tb[7,4]='b2') or (tb[7,4]='g2') then
cal(158,322,2);
If (tb[7,4]='f1') then
nebun(238,318,1);
If (tb[7,4]='c2') then
nebun(238,318,2);
If (tb[7,4]='d1') then
rege(237,318,1);
If (tb[7,4]='d2') then
rege(237,318,2);
If (tb[7,4]='e1') then
regina(240,318,1);
If (tb[7,4]='e2') then
regina(240,318,2);
If (tb[7,4]='i1') then
pion(159,318,1);
End;
If (ch='c7') then
Begin
For i:=186 to 237 do
For j:=319 to 370 do
Putpixel(i,j,7);
tb[7,3]:=aux;
If (tb[7,3]='a1') or (tb[7,3]='h1') then
tura(107,322,1);
If(tb[7,3]='a2') or (tb[7,3]='h2') then
tura(107,322,2);
If (tb[7,3]='b1') or (tb[7,3]='g1') then
cal(105,322,1);
If (tb[7,3]='b2') or (tb[7,3]='g2') then
cal(105,322,2);
If (tb[7,3]='c1') then
nebun(185,318,1);
If (tb[7,3]='f2') then
nebun(185,318,2);
If (tb[7,3]='d1') then
rege(184,318,1);
If (tb[7,3]='d2') then
rege(184,318,2);
If (tb[7,3]='e1') then
regina(187,318,1);
If (tb[7,3]='e2') then
regina(187,318,2);
If (tb[7,3]='i1') then
pion(106,318,1);
End;
If (ch='b7') then
Begin
For i:=133 to 184 do
For j:=319 to 370 do
Putpixel(i,j,8);
tb[7,2]:=aux;
If (tb[7,2]='a1') or (tb[7,2]='h1') then
tura(54,322,1);
If(tb[7,2]='a2') or (tb[7,2]='h2') then
tura(54,322,2);
If (tb[7,2]='b1') or (tb[7,2]='g1') then
cal(52,322,1);
If (tb[7,2]='b2') or (tb[7,2]='g2') then
cal(52,322,2);
If (tb[7,2]='f1') then
nebun(132,318,1);
If (tb[7,2]='c2') then
nebun(132,318,2);
If (tb[7,2]='d1') then
rege(131,318,1);
If (tb[7,2]='d2') then
rege(131,318,2);
If (tb[7,2]='e1') then
regina(134,318,1);
If (tb[7,2]='e2') then
regina(134,318,2);
If (tb[7,2]='i1') then
pion(53,318,1);
End;
If (ch='a7') then
Begin
For i:=80 to 131 do
For j:=319 to 370 do
Putpixel(i,j,7);
tb[7,1]:=aux;
If (tb[7,1]='a1') or (tb[7,1]='h1') then
tura(1,322,1);
If(tb[7,1]='a2') or (tb[7,1]='h2') then
tura(1,322,2);
If (tb[7,1]='b1') or (tb[7,1]='g1') then
cal(-1,322,1);
If (tb[7,1]='b2') or (tb[7,1]='g2') then
cal(-1,322,2);
If (tb[7,1]='c1') then
nebun(79,318,1);
If (tb[7,1]='f2') then
nebun(79,318,2);
If (tb[7,1]='d1') then
rege(78,318,1);
If (tb[7,1]='d2') then
rege(78,318,2);
If (tb[7,1]='e1') then
regina(81,318,1);
If (tb[7,1]='e2') then
regina(81,318,2);
If (tb[7,1]='i1') then
pion(0,318,1);
End;
If (ch='h6') then
Begin
For i:=451 to 502 do
For j:=266 to 317 do
Putpixel(i,j,7);
tb[6,8]:=aux;
If (tb[6,8]='a1') or (tb[6,8]='h1') then
tura(372,269,1);
If(tb[6,8]='a2') or (tb[6,8]='h2') then
tura(372,269,2);
If (tb[6,8]='b1') or (tb[6,8]='g1') then
cal(370,269,1);
If (tb[6,8]='b2') or (tb[6,8]='g2') then
cal(370,269,2);
If (tb[6,8]='c1') then
nebun(450,265,1);
If (tb[6,8]='f2') then
nebun(450,265,2);
If (tb[6,8]='d1') then
rege(449,265,1);
If (tb[6,8]='d2') then
rege(449,265,2);
If (tb[6,8]='e1') then
regina(452,265,1);
If (tb[6,8]='e2') then
regina(452,265,2);
If (tb[6,8]='i1') then
pion(371,265,1);
If (tb[6,8]='i2') then
pion(371,265,2);
End;
If (ch='g6') then
Begin
For i:=398 to 449 do
For j:=266 to 317 do
Putpixel(i,j,8);
tb[6,7]:=aux;
If (tb[6,7]='a1') or (tb[6,7]='h1') then
tura(319,269,1);
If(tb[6,7]='a2') or (tb[6,7]='h2') then
tura(319,269,2);
If (tb[6,7]='b1') or (tb[6,7]='g1') then
cal(317,269,1);
If (tb[6,7]='b2') or (tb[6,7]='g2') then
cal(317,269,2);
If (tb[6,7]='f1') then
nebun(397,265,1);
If (tb[6,7]='c2') then
nebun(397,265,2);
If (tb[6,7]='d1') then
rege(396,265,1);
If (tb[6,7]='d2') then
rege(396,265,2);
If (tb[6,7]='e1') then
regina(399,265,1);
If (tb[6,7]='e2') then
regina(399,265,2);
If (tb[6,7]='i1') then
pion(318,265,1);
If (tb[6,7]='i2') then
pion(318,265,2);
End;
If (ch='f6') then
Begin
For i:=345 to 396 do
For j:=266 to 317 do
Putpixel(i,j,7);
tb[6,6]:=aux;
If (tb[6,6]='a1') or (tb[6,6]='h1') then
tura(266,269,1);
If(tb[6,6]='a2') or (tb[6,6]='h2') then
tura(266,269,2);
If (tb[6,6]='b1') or (tb[6,6]='g1') then
cal(264,269,1);
If (tb[6,6]='b2') or (tb[6,6]='g2') then
cal(264,269,2);
If (tb[6,6]='c1') then
nebun(344,265,1);
If (tb[6,6]='f2') then
nebun(344,265,2);
If (tb[6,6]='d1') then
rege(343,265,1);
If (tb[6,6]='d2') then
rege(343,265,2);
If (tb[6,6]='e1') then
regina(346,265,1);
If (tb[6,6]='e2') then
regina(346,265,2);
If (tb[6,6]='i1') then
pion(265,265,1);
If (tb[6,6]='i2') then
pion(265,265,2);
End;
If (ch='e6') then
Begin
For i:=292 to 343 do
For j:=266 to 317 do
Putpixel(i,j,8);
tb[6,5]:=aux;
If (tb[6,5]='a1') or (tb[6,5]='h1') then
tura(213,269,1);
If(tb[6,5]='a2') or (tb[6,5]='h2') then
tura(213,269,2);
If (tb[6,5]='b1') or (tb[6,5]='g1') then
cal(211,269,1);
If (tb[6,5]='b2') or (tb[6,5]='g2') then
cal(211,269,2);
If (tb[6,5]='f1') then
nebun(291,265,1);
If (tb[6,5]='c2') then
nebun(291,265,2);
If (tb[6,5]='d1') then
rege(290,265,1);
If (tb[6,5]='d2') then
rege(290,265,2);
If (tb[6,5]='e1') then
regina(293,265,1);
If (tb[6,5]='e2') then
regina(293,265,2);
If (tb[6,5]='i1') then
pion(212,265,1);
If (tb[6,5]='i2') then
pion(212,265,2);
End;
If (ch='d6') then
Begin
For i:=239 to 290 do
For j:=266 to 317 do
Putpixel(i,j,7);
tb[6,4]:=aux;
If (tb[6,4]='a1') or (tb[6,4]='h1') then
tura(160,269,1);
If(tb[6,4]='a2') or (tb[6,4]='h2') then
tura(160,269,2);
If (tb[6,4]='b1') or (tb[6,4]='g1') then
cal(158,269,1);
If (tb[6,4]='b2') or (tb[6,4]='g2') then
cal(158,269,2);
If (tb[6,4]='c1') then
nebun(238,265,1);
If (tb[6,4]='f2') then
nebun(238,265,2);
If (tb[6,4]='d1') then
rege(237,265,1);
If (tb[6,4]='d2') then
rege(237,265,2);
If (tb[6,4]='e1') then
regina(240,265,1);
If (tb[6,4]='e2') then
regina(240,265,2);
If (tb[6,4]='i1') then
pion(159,265,1);
If (tb[6,4]='i2') then
pion(159,265,2);
End;
If (ch='c6') then
Begin
For i:=186 to 237 do
For j:=266 to 317 do
Putpixel(i,j,8);
tb[6,3]:=aux;
If (tb[6,3]='a1') or (tb[6,3]='h1') then
tura(107,269,1);
If(tb[6,3]='a2') or (tb[6,3]='h2') then
tura(107,269,2);
If (tb[6,3]='b1') or (tb[6,3]='g1') then
cal(105,269,1);
If (tb[6,3]='b2') or (tb[6,3]='g2') then
cal(105,269,2);
If (tb[6,3]='f1') then
nebun(185,265,1);
If (tb[6,3]='c2') then
nebun(185,265,2);
If (tb[6,3]='d1') then
rege(184,265,1);
If (tb[6,3]='d2') then
rege(184,265,2);
If (tb[6,3]='e1') then
regina(187,265,1);
If (tb[6,3]='e2') then
regina(187,265,2);
If (tb[6,3]='i1') then
pion(106,265,1);
If (tb[6,3]='i2') then
pion(106,265,2);
End;
If (ch='b6') then
Begin
For i:=133 to 184 do
For j:=266 to 317 do
Putpixel(i,j,7);
tb[6,2]:=aux;
If (tb[6,2]='a1') or (tb[6,2]='h1') then
tura(54,269,1);
If(tb[6,2]='a2') or (tb[6,2]='h2') then
tura(54,269,2);
If (tb[6,2]='b1') or (tb[6,2]='g1') then
cal(52,269,1);
If (tb[6,2]='b2') or (tb[6,2]='g2') then
cal(52,269,2);
If (tb[6,2]='c1') then
nebun(132,265,1);
If (tb[6,2]='f2') then
nebun(132,265,2);
If (tb[6,2]='d1') then
rege(131,265,1);
If (tb[6,2]='d2') then
rege(131,265,2);
If (tb[6,2]='e1') then
regina(134,265,1);
If (tb[6,2]='e2') then
regina(134,265,2);
If (tb[6,2]='i1') then
pion(53,265,1);
If (tb[6,2]='i2') then
pion(53,265,2);
End;
If (ch='a6') then
Begin
For i:=80 to 131 do
For j:=266 to 317 do
Putpixel(i,j,8);
tb[6,1]:=aux;
If (tb[6,1]='a1') or (tb[6,1]='h1') then
tura(1,269,1);
If(tb[6,1]='a2') or (tb[6,1]='h2') then
tura(1,269,2);
If (tb[6,1]='b1') or (tb[6,1]='g1') then
cal(-1,269,1);
If (tb[6,1]='b2') or (tb[6,1]='g2') then
cal(-1,269,2);
If (tb[6,1]='f1') then
nebun(79,265,1);
If (tb[6,1]='c2') then
nebun(79,265,2);
If (tb[6,1]='d1') then
rege(78,265,1);
If (tb[6,1]='d2') then
rege(78,265,2);
If (tb[6,1]='e1') then
regina(81,265,1);
If (tb[6,1]='e2') then
regina(81,265,2);
If (tb[6,1]='i1') then
pion(0,265,1);
If (tb[6,1]='i2') then
pion(0,265,2);
End;
If (ch='h5') then
Begin
For i:=451 to 502 do
For j:=213 to 264 do
Putpixel(i,j,8);
tb[5,8]:=aux;
If (tb[5,8]='a1') or (tb[5,8]='h1') then
tura(372,216,1);
If(tb[5,8]='a2') or (tb[5,8]='h2') then
tura(372,216,2);
If (tb[5,8]='b1') or (tb[5,8]='g1') then
cal(370,216,1);
If (tb[5,8]='b2') or (tb[5,8]='g2') then
cal(370,216,2);
If (tb[5,8]='f1') then
nebun(450,212,1);
If (tb[5,8]='c2') then
nebun(450,212,2);
If (tb[5,8]='d1') then
rege(449,212,1);
If (tb[5,8]='d2') then
rege(449,212,2);
If (tb[5,8]='e1') then
regina(452,212,1);
If (tb[5,8]='e2') then
regina(452,212,2);
If (tb[5,8]='i1') then
pion(371,212,1);
If (tb[5,8]='i2') then
pion(371,212,2);
End;
If (ch='g5') then
Begin
For i:=398 to 449 do
For j:=213 to 264 do
Putpixel(i,j,7);
tb[5,7]:=aux;
If (tb[5,7]='a1') or (tb[5,7]='h1') then
tura(319,216,1);
If(tb[5,7]='a2') or (tb[5,7]='h2') then
tura(319,216,2);
If (tb[5,7]='b1') or (tb[5,7]='g1') then
cal(317,216,1);
If (tb[5,7]='b2') or (tb[5,7]='g2') then
cal(317,216,2);
If (tb[5,7]='c1') then
nebun(397,212,1);
If (tb[5,7]='f2') then
nebun(397,212,2);
If (tb[5,7]='d1') then
rege(396,212,1);
If (tb[5,7]='d2') then
rege(396,212,2);
If (tb[5,7]='e1') then
regina(399,212,1);
If (tb[5,7]='e2') then
regina(399,212,2);
If (tb[5,7]='i1') then
pion(318,212,1);
If (tb[5,7]='i2') then
pion(318,212,2);
End;
If (ch='f5') then
Begin
For i:=345 to 396 do
For j:=213 to 264 do
Putpixel(i,j,8);
tb[5,6]:=aux;
If (tb[5,6]='a1') or (tb[5,6]='h1') then
tura(266,216,1);
If(tb[5,6]='a2') or (tb[5,6]='h2') then
tura(266,216,2);
If (tb[5,6]='b1') or (tb[5,6]='g1') then
cal(264,216,1);
If (tb[5,6]='b2') or (tb[5,6]='g2') then
cal(264,216,2);
If (tb[5,6]='f1') then
nebun(344,212,1);
If (tb[5,6]='c2') then
nebun(344,212,2);
If (tb[5,6]='d1') then
rege(343,212,1);
If (tb[5,6]='d2') then
rege(343,212,2);
If (tb[5,6]='e1') then
regina(346,212,1);
If (tb[5,6]='e2') then
regina(346,212,2);
If (tb[5,6]='i1') then
pion(265,212,1);
If (tb[5,6]='i2') then
pion(265,212,2);
End;
If (ch='e5') then
Begin
For i:=292 to 343 do
For j:=213 to 264 do
Putpixel(i,j,7);
tb[5,5]:=aux;
If (tb[5,5]='a1') or (tb[5,5]='h1') then
tura(213,216,1);
If(tb[5,5]='a2') or (tb[5,5]='h2') then
tura(213,216,2);
If (tb[5,5]='b1') or (tb[5,5]='g1') then
cal(211,216,1);
If (tb[5,5]='b2') or (tb[5,5]='g2') then
cal(211,216,2);
If (tb[5,5]='c1') then
nebun(291,212,1);
If (tb[5,5]='f2') then
nebun(291,212,2);
If (tb[5,5]='d1') then
rege(290,212,1);
If (tb[5,5]='d2') then
rege(290,212,2);
If (tb[5,5]='e1') then
regina(293,212,1);
If (tb[5,5]='e2') then
regina(293,212,2);
If (tb[5,5]='i1') then
pion(212,212,1);
If (tb[5,5]='i2') then
pion(212,212,2);
End;
If (ch='d5') then
Begin
For i:=239 to 290 do
For j:=213 to 264 do
Putpixel(i,j,8);
tb[5,4]:=aux;
If (tb[5,4]='a1') or (tb[5,4]='h1') then
tura(160,216,1);
If(tb[5,4]='a2') or (tb[5,4]='h2') then
tura(160,216,2);
If (tb[5,4]='b1') or (tb[5,4]='g1') then
cal(158,216,1);
If (tb[5,4]='b2') or (tb[5,4]='g2') then
cal(158,216,2);
If (tb[5,4]='f1') then
nebun(238,212,1);
If (tb[5,4]='c2') then
nebun(238,212,2);
If (tb[5,4]='d1') then
rege(237,212,1);
If (tb[5,4]='d2') then
rege(237,212,2);
If (tb[5,4]='e1') then
regina(240,212,1);
If (tb[5,4]='e2') then
regina(240,212,2);
If (tb[5,4]='i1') then
pion(159,212,1);
If (tb[5,4]='i2') then
pion(159,212,2);
End;
If (ch='c5') then
Begin
For i:=186 to 237 do
For j:=213 to 264 do
Putpixel(i,j,7);
tb[5,3]:=aux;
If (tb[5,3]='a1') or (tb[5,3]='h1') then
tura(107,216,1);
If(tb[5,3]='a2') or (tb[5,3]='h2') then
tura(107,216,2);
If (tb[5,3]='b1') or (tb[5,3]='g1') then
cal(105,216,1);
If (tb[5,3]='b2') or (tb[5,3]='g2') then
cal(105,216,2);
If (tb[5,3]='c1') then
nebun(185,212,1);
If (tb[5,3]='f2') then
nebun(185,212,2);
If (tb[5,3]='d1') then
rege(184,212,1);
If (tb[5,3]='d2') then
rege(184,212,2);
If (tb[5,3]='e1') then
regina(187,212,1);
If (tb[5,3]='e2') then
regina(187,212,2);
If (tb[5,3]='i1') then
pion(106,212,1);
If (tb[5,3]='i2') then
pion(106,212,2);
End;
If (ch='b5') then
Begin
For i:=133 to 184 do
For j:=213 to 264 do
Putpixel(i,j,8);
tb[5,2]:=aux;
If (tb[5,2]='a1') or (tb[5,2]='h1') then
tura(54,216,1);
If(tb[5,2]='a2') or (tb[5,2]='h2') then
tura(54,216,2);
If (tb[5,2]='b1') or (tb[5,2]='g1') then
cal(52,216,1);
If (tb[5,2]='b2') or (tb[5,2]='g2') then
cal(52,216,2);
If (tb[5,2]='f1') then
nebun(132,212,1);
If (tb[5,2]='c2') then
nebun(132,212,2);
If (tb[5,2]='d1') then
rege(131,212,1);
If (tb[5,2]='d2') then
rege(131,212,2);
If (tb[5,2]='e1') then
regina(134,212,1);
If (tb[5,2]='e2') then
regina(134,212,2);
If (tb[5,2]='i1') then
pion(53,212,1);
If (tb[5,2]='i2') then
pion(53,212,2);
End;
If (ch='a5') then
Begin
For i:=80 to 131 do
For j:=213 to 264 do
Putpixel(i,j,7);
tb[5,1]:=aux;
If (tb[5,1]='a1') or (tb[5,1]='h1') then
tura(1,216,1);
If(tb[5,1]='a2') or (tb[5,1]='h2') then
tura(1,216,2);
If (tb[5,1]='b1') or (tb[5,1]='g1') then
cal(-1,216,1);
If (tb[5,1]='b2') or (tb[5,1]='g2') then
cal(-1,216,2);
If (tb[5,1]='c1') then
nebun(79,212,1);
If (tb[5,1]='f2') then
nebun(79,212,2);
If (tb[5,1]='d1') then
rege(78,212,1);
If (tb[5,1]='d2') then
rege(78,212,2);
If (tb[5,1]='e1') then
regina(81,212,1);
If (tb[5,1]='e2') then
regina(81,212,2);
If (tb[5,1]='i1') then
pion(0,212,1);
If (tb[5,1]='i2') then
pion(0,212,2);
End;
If (ch='h4') then
Begin
For i:=451 to 502 do
For j:=160 to 211 do
Putpixel(i,j,7);
tb[4,8]:=aux;
If (tb[4,8]='a1') or (tb[4,8]='h1') then
tura(372,163,1);
If(tb[4,8]='a2') or (tb[4,8]='h2') then
tura(372,163,2);
If (tb[4,8]='b1') or (tb[4,8]='g1') then
cal(370,163,1);
If (tb[4,8]='b2') or (tb[4,8]='g2') then
cal(370,163,2);
If (tb[4,8]='c1') then
nebun(450,159,1);
If (tb[4,8]='f2') then
nebun(450,159,2);
If (tb[4,8]='d1') then
rege(449,159,1);
If (tb[4,8]='d2') then
rege(449,159,2);
If (tb[4,8]='e1') then
regina(452,159,1);
If (tb[4,8]='e2') then
regina(452,159,2);
If (tb[4,8]='i1') then
pion(371,159,1);
If (tb[4,8]='i2') then
pion(371,159,2);
End;
If (ch='g4') then
Begin
For i:=398 to 449 do
For j:=160 to 211 do
Putpixel(i,j,8);
tb[4,7]:=aux;
If (tb[4,7]='a1') or (tb[4,7]='h1') then
tura(319,163,1);
If(tb[4,7]='a2') or (tb[4,7]='h2') then
tura(319,163,2);
If (tb[4,7]='b1') or (tb[4,7]='g1') then
cal(317,163,1);
If (tb[4,7]='b2') or (tb[4,7]='g2') then
cal(317,163,2);
If (tb[4,7]='f1') then
nebun(397,159,1);
If (tb[4,7]='c2') then
nebun(397,159,2);
If (tb[4,7]='d1') then
rege(396,159,1);
If (tb[4,7]='d2') then
rege(396,159,2);
If (tb[4,7]='e1') then
regina(399,159,1);
If (tb[4,7]='e2') then
regina(399,159,2);
If (tb[4,7]='i1') then
pion(318,159,1);
If (tb[4,7]='i2') then
pion(318,159,2);
End;
If (ch='f4') then
Begin
For i:=345 to 396 do
For j:=160 to 211 do
Putpixel(i,j,7);
tb[4,6]:=aux;
If (tb[4,6]='a1') or (tb[4,6]='h1') then
tura(266,163,1);
If(tb[4,6]='a2') or (tb[4,6]='h2') then
tura(266,163,2);
If (tb[4,6]='b1') or (tb[4,6]='g1') then
cal(264,163,1);
If (tb[4,6]='b2') or (tb[4,6]='g2') then
cal(264,163,2);
If (tb[4,6]='c1') then
nebun(344,159,1);
If (tb[4,6]='f2') then
nebun(344,159,2);
If (tb[4,6]='d1') then
rege(343,159,1);
If (tb[4,6]='d2') then
rege(343,159,2);
If (tb[4,6]='e1') then
regina(346,159,1);
If (tb[4,6]='e2') then
regina(346,159,2);
If (tb[4,6]='i1') then
pion(265,159,1);
If (tb[4,6]='i2') then
pion(265,159,2);
End;
If (ch='e4') then
Begin
For i:=292 to 343 do
For j:=160 to 211 do
Putpixel(i,j,8);
tb[4,5]:=aux;
If (tb[4,5]='a1') or (tb[4,5]='h1') then
tura(213,163,1);
If(tb[4,5]='a2') or (tb[4,5]='h2') then
tura(213,163,2);
If (tb[4,5]='b1') or (tb[4,5]='g1') then
cal(211,163,1);
If (tb[4,5]='b2') or (tb[4,5]='g2') then
cal(211,163,2);
If (tb[4,5]='c2') then
nebun(291,159,2);
If (tb[4,5]='f1') then
nebun(291,159,1);
If (tb[4,5]='d1') then
rege(290,159,1);
If (tb[4,5]='d2') then
rege(290,159,2);
If (tb[4,5]='e1') then
regina(293,159,1);
If (tb[4,5]='e2') then
regina(293,159,2);
If (tb[4,5]='i1') then
pion(212,159,1);
If (tb[4,5]='i2') then
pion(212,159,2);
End;
If (ch='d4') then
Begin
For i:=239 to 290 do
For j:=160 to 211 do
Putpixel(i,j,7);
tb[4,4]:=aux;
If (tb[4,4]='a1') or (tb[4,4]='h1') then
tura(160,163,1);
If(tb[4,4]='a2') or (tb[4,4]='h2') then
tura(160,163,2);
If (tb[4,4]='b1') or (tb[4,4]='g1') then
cal(158,163,1);
If (tb[4,4]='b2') or (tb[4,4]='g2') then
cal(158,163,2);
If (tb[4,4]='c1') then
nebun(238,159,1);
If (tb[4,4]='f2') then
nebun(238,159,2);
If (tb[4,4]='d1') then
rege(237,159,1);
If (tb[4,4]='d2') then
rege(237,159,2);
If (tb[4,4]='e1') then
regina(240,159,1);
If (tb[4,4]='e2') then
regina(240,159,2);
If (tb[4,4]='i1') then
pion(159,159,1);
If (tb[4,4]='i2') then
pion(159,159,2);
End;
If (ch='c4') then
Begin
For i:=186 to 237 do
For j:=160 to 211 do
Putpixel(i,j,8);
tb[4,3]:=aux;
If (tb[4,3]='a1') or (tb[4,3]='h1') then
tura(107,163,1);
If(tb[4,3]='a2') or (tb[4,3]='h2') then
tura(107,163,2);
If (tb[4,3]='b1') or (tb[4,3]='g1') then
cal(105,163,1);
If (tb[4,3]='b2') or (tb[4,3]='g2') then
cal(105,163,2);
If (tb[4,3]='f1') then
nebun(185,159,1);
If (tb[4,3]='c2') then
nebun(185,159,2);
If (tb[4,3]='d1') then
rege(184,159,1);
If (tb[4,3]='d2') then
rege(184,159,2);
If (tb[4,3]='e1') then
regina(187,159,1);
If (tb[4,3]='e2') then
regina(187,159,2);
If (tb[4,3]='i1') then
pion(106,159,1);
If (tb[4,3]='i2') then
pion(106,159,2);
End;
If (ch='b4') then
Begin
For i:=133 to 184 do
For j:=160 to 211 do
Putpixel(i,j,7);
tb[4,2]:=aux;
If (tb[4,2]='a1') or (tb[4,2]='h1') then
tura(54,163,1);
If(tb[4,2]='a2') or (tb[4,2]='h2') then
tura(54,163,2);
If (tb[4,2]='b1') or (tb[4,2]='g1') then
cal(52,163,1);
If (tb[4,2]='b2') or (tb[4,2]='g2') then
cal(52,163,2);
If (tb[4,2]='c1') then
nebun(132,159,1);
If (tb[4,2]='f2') then
nebun(132,159,2);
If (tb[4,2]='d1') then
rege(131,159,1);
If (tb[4,2]='d2') then
rege(131,159,2);
If (tb[4,2]='e1') then
regina(134,159,1);
If (tb[4,2]='e2') then
regina(134,159,2);
If (tb[4,2]='i1') then
pion(53,159,1);
If (tb[4,2]='i2') then
pion(53,159,2);
End;
If (ch='a4') then
Begin
For i:=80 to 131 do
For j:=160 to 211 do
Putpixel(i,j,8);
tb[4,1]:=aux;
If (tb[4,1]='a1') or (tb[4,1]='h1') then
tura(1,163,1);
If(tb[4,1]='a2') or (tb[4,1]='h2') then
tura(1,163,2);
If (tb[4,1]='b1') or (tb[4,1]='g1') then
cal(-1,163,1);
If (tb[4,1]='b2') or (tb[4,1]='g2') then
cal(-1,163,2);
If (tb[4,1]='f1') then
nebun(79,159,1);
If (tb[4,1]='c2') then
nebun(79,159,2);
If (tb[4,1]='d1') then
rege(78,159,1);
If (tb[4,1]='d2') then
rege(78,159,2);
If (tb[4,1]='e1') then
regina(81,159,1);
If (tb[4,1]='e2') then
regina(81,159,2);
If (tb[4,1]='i1') then
pion(0,159,1);
If (tb[4,1]='i2') then
pion(0,159,2);
End;
If (ch='h3') then
Begin
For i:=451 to 502 do
For j:=107 to 158 do
Putpixel(i,j,8);
tb[3,8]:=aux;
If (tb[3,8]='a1') or (tb[3,8]='h1') then
tura(372,110,1);
If(tb[3,8]='a2') or (tb[3,8]='h2') then
tura(372,110,2);
If (tb[3,8]='b1') or (tb[3,8]='g1') then
cal(370,110,1);
If (tb[3,8]='b2') or (tb[3,8]='g2') then
cal(370,110,2);
If (tb[3,8]='f1') then
nebun(450,106,1);
If (tb[3,8]='c2') then
nebun(450,106,2);
If (tb[3,8]='d1') then
rege(449,106,1);
If (tb[3,8]='d2') then
rege(449,106,2);
If (tb[3,8]='e1') then
regina(452,106,1);
If (tb[3,8]='e2') then
regina(452,106,2);
If (tb[3,8]='i1') then
pion(371,106,1);
If (tb[3,8]='i2') then
pion(371,106,2);
End;
If (ch='g3') then
Begin
For i:=398 to 449 do
For j:=107 to 158 do
Putpixel(i,j,7);
tb[3,7]:=aux;
If (tb[3,7]='a1') or (tb[3,7]='h1') then
tura(319,110,1);
If(tb[3,7]='a2') or (tb[3,7]='h2') then
tura(319,110,2);
If (tb[3,7]='b1') or (tb[3,7]='g1') then
cal(317,110,1);
If (tb[3,7]='b2') or (tb[3,7]='g2') then
cal(317,110,2);
If (tb[3,7]='c1') then
nebun(397,106,1);
If (tb[3,7]='f2') then
nebun(397,106,2);
If (tb[3,7]='d1') then
rege(396,106,1);
If (tb[3,7]='d2') then
rege(396,106,2);
If (tb[3,7]='e1') then
regina(399,106,1);
If (tb[3,7]='e2') then
regina(399,106,2);
If (tb[3,7]='i1') then
pion(318,106,1);
If (tb[3,7]='i2') then
pion(318,106,2);
End;
If (ch='f3') then
Begin
For i:=345 to 396 do
For j:=107 to 158 do
Putpixel(i,j,8);
tb[3,6]:=aux;
If (tb[3,6]='a1') or (tb[3,6]='h1') then
tura(266,110,1);
If(tb[3,6]='a2') or (tb[3,6]='h2') then
tura(266,110,2);
If (tb[3,6]='b1') or (tb[3,6]='g1') then
cal(264,110,1);
If (tb[3,6]='b2') or (tb[3,6]='g2') then
cal(264,110,2);
If (tb[3,6]='f1') then
nebun(344,106,1);
If (tb[3,6]='c2') then
nebun(344,106,2);
If (tb[3,6]='d1') then
rege(343,106,1);
If (tb[3,6]='d2') then
rege(343,106,2);
If (tb[3,6]='e1') then
regina(346,106,1);
If (tb[3,6]='e2') then
regina(346,106,2);
If (tb[3,6]='i1') then
pion(265,106,1);
If (tb[3,6]='i2') then
pion(265,106,2);
End;
If (ch='e3') then
Begin
For i:=292 to 343 do
For j:=107 to 158 do
Putpixel(i,j,7);
tb[3,5]:=aux;
If (tb[3,5]='a1') or (tb[3,5]='h1') then
tura(213,110,1);
If(tb[3,5]='a2') or (tb[3,5]='h2') then
tura(213,110,2);
If (tb[3,5]='b1') or (tb[3,5]='g1') then
cal(211,110,1);
If (tb[3,5]='b2') or (tb[3,5]='g2') then
cal(211,110,2);
If (tb[3,5]='c1') then
nebun(291,106,1);
If (tb[3,5]='f2') then
nebun(291,106,2);
If (tb[3,5]='d1') then
rege(290,106,1);
If (tb[3,5]='d2') then
rege(290,106,2);
If (tb[3,5]='e1') then
regina(293,106,1);
If (tb[3,5]='e2') then
regina(293,106,2);
If (tb[3,5]='i1') then
pion(212,106,1);
If (tb[3,5]='i2') then
pion(212,106,2);
End;
If (ch='d3') then
Begin
For i:=239 to 290 do
For j:=107 to 158 do
Putpixel(i,j,8);
tb[3,4]:=aux;
If (tb[3,4]='a1') or (tb[3,4]='h1') then
tura(160,110,1);
If(tb[3,4]='a2') or (tb[3,4]='h2') then
tura(160,110,2);
If (tb[3,4]='b1') or (tb[3,4]='g1') then
cal(158,110,1);
If (tb[3,4]='b2') or (tb[3,4]='g2') then
cal(158,110,2);
If (tb[3,4]='f1') then
nebun(238,106,1);
If (tb[3,4]='c2') then
nebun(238,106,2);
If (tb[3,4]='d1') then
rege(237,106,1);
If (tb[3,4]='d2') then
rege(237,106,2);
If (tb[3,4]='e1') then
regina(240,106,1);
If (tb[3,4]='e2') then
regina(240,106,2);
If (tb[3,4]='i1') then
pion(159,106,1);
If (tb[3,4]='i2') then
pion(159,106,2);
End;
If (ch='c3') then
Begin
For i:=186 to 237 do
For j:=107 to 158 do
Putpixel(i,j,7);
tb[3,3]:=aux;
If (tb[3,3]='a1') or (tb[3,3]='h1') then
tura(107,110,1);
If(tb[3,3]='a2') or (tb[3,3]='h2') then
tura(107,110,2);
If (tb[3,3]='b1') or (tb[3,3]='g1') then
cal(105,110,1);
If (tb[3,3]='b2') or (tb[3,3]='g2') then
cal(105,110,2);
If (tb[3,3]='c1') then
nebun(185,106,1);
If (tb[3,3]='f2') then
nebun(185,106,2);
If (tb[3,3]='d1') then
rege(184,106,1);
If (tb[3,3]='d2') then
rege(184,106,2);
If (tb[3,3]='e1') then
regina(187,106,1);
If (tb[3,3]='e2') then
regina(187,106,2);
If (tb[3,3]='i1') then
pion(106,106,1);
If (tb[3,3]='i2') then
pion(106,106,2);
End;
If (ch='b3') then
Begin
For i:=133 to 184 do
For j:=107 to 158 do
Putpixel(i,j,8);
tb[3,2]:=aux;
If (tb[3,2]='a1') or (tb[3,2]='h1') then
tura(54,110,1);
If(tb[3,2]='a2') or (tb[3,2]='h2') then
tura(54,110,2);
If (tb[3,2]='b1') or (tb[3,2]='g1') then
cal(52,110,1);
If (tb[3,2]='b2') or (tb[3,2]='g2') then
cal(52,110,2);
If (tb[3,2]='f1') then
nebun(132,106,1);
If (tb[3,2]='c2') then
nebun(132,106,2);
If (tb[3,2]='d1') then
rege(131,106,1);
If (tb[3,2]='d2') then
rege(131,106,2);
If (tb[3,2]='e1') then
regina(134,106,1);
If (tb[3,2]='e2') then
regina(134,106,2);
If (tb[3,2]='i1') then
pion(53,106,1);
If (tb[3,2]='i2') then
pion(53,106,2);
End;
If (ch='a3') then
Begin
For i:=80 to 131 do
For j:=107 to 158 do
Putpixel(i,j,7);
tb[3,1]:=aux;
If (tb[3,1]='a1') or (tb[3,1]='h1') then
tura(1,110,1);
If(tb[3,1]='a2') or (tb[3,1]='h2') then
tura(1,110,2);
If (tb[3,1]='b1') or (tb[3,1]='g1') then
cal(-1,110,1);
If (tb[3,1]='b2') or (tb[3,1]='g2') then
cal(-1,110,2);
If (tb[3,1]='c1') then
nebun(79,106,1);
If (tb[3,1]='f2') then
nebun(79,106,2);
If (tb[3,1]='d1') then
rege(78,106,1);
If (tb[3,1]='d2') then
rege(78,106,2);
If (tb[3,1]='e1') then
regina(81,106,1);
If (tb[3,1]='e2') then
regina(81,106,2);
If (tb[3,1]='i1') then
pion(0,106,1);
If (tb[3,1]='i2') then
pion(0,106,2);
End;
If (ch='h2') then
Begin
For i:=451 to 502 do
For j:=54 to 105 do
Putpixel(i,j,7);
tb[2,8]:=aux;
If (tb[2,8]='a1') or (tb[2,8]='h1') then
tura(372,57,1);
If(tb[2,8]='a2') or (tb[2,8]='h2') then
tura(372,57,2);
If (tb[2,8]='b1') or (tb[2,8]='g1') then
cal(370,57,1);
If (tb[2,8]='b2') or (tb[2,8]='g2') then
cal(370,57,2);
If (tb[2,8]='c1') then
nebun(450,53,1);
If (tb[2,8]='f2') then
nebun(450,53,2);
If (tb[2,8]='d1') then
rege(449,53,1);
If (tb[2,8]='d2') then
rege(449,53,2);
If (tb[2,8]='e1') then
regina(452,53,1);
If (tb[2,8]='e2') then
regina(452,53,2);
If (tb[2,8]='i2') then
pion(371,53,2);
End;
If (ch='g2') then
Begin
For i:=398 to 449 do
For j:=54 to 105 do
Putpixel(i,j,8);
tb[2,7]:=aux;
If (tb[2,7]='a1') or (tb[2,7]='h1') then
tura(319,57,1);
If(tb[2,7]='a2') or (tb[2,7]='h2') then
tura(319,57,2);
If (tb[2,7]='b1') or (tb[2,7]='g1') then
cal(317,57,1);
If (tb[2,7]='b2') or (tb[2,7]='g2') then
cal(317,57,2);
If (tb[2,7]='f1') then
nebun(397,53,1);
If (tb[2,7]='c2') then
nebun(397,53,2);
If (tb[2,7]='d1') then
rege(396,53,1);
If (tb[2,7]='d2') then
rege(396,53,2);
If (tb[2,7]='e1') then
regina(399,53,1);
If (tb[2,7]='e2') then
regina(399,53,2);
If (tb[2,7]='i2') then
pion(318,53,2);
End;
If (ch='f2') then
Begin
For i:=345 to 396 do
For j:=54 to 105 do
Putpixel(i,j,7);
tb[2,6]:=aux;
If (tb[2,6]='a1') or (tb[2,6]='h1') then
tura(266,57,1);
If(tb[2,6]='a2') or (tb[2,6]='h2') then
tura(266,57,2);
If (tb[2,6]='b1') or (tb[2,6]='g1') then
cal(264,57,1);
If (tb[2,6]='b2') or (tb[2,6]='g2') then
cal(264,57,2);
If (tb[2,6]='c1') then
nebun(344,53,1);
If (tb[2,6]='f2') then
nebun(344,53,2);
If (tb[2,6]='d1') then
rege(343,53,1);
If (tb[2,6]='d2') then
rege(343,53,2);
If (tb[2,6]='e1') then
regina(346,53,1);
If (tb[2,6]='e2') then
regina(346,53,2);
If (tb[2,6]='i2') then
pion(265,53,2);
End;
If (ch='e2') then
Begin
For i:=292 to 343 do
For j:=54 to 105 do
Putpixel(i,j,8);
tb[2,5]:=aux;
If (tb[2,5]='a1') or (tb[2,5]='h1') then
tura(213,57,1);
If(tb[2,5]='a2') or (tb[2,5]='h2') then
tura(213,57,2);
If (tb[2,5]='b1') or (tb[2,5]='g1') then
cal(211,57,1);
If (tb[2,5]='b2') or (tb[2,5]='g2') then
cal(211,57,2);
If (tb[2,5]='f1') then
nebun(291,53,1);
If (tb[2,5]='c2') then
nebun(291,53,2);
If (tb[2,5]='d1') then
rege(290,53,1);
If (tb[2,5]='d2') then
rege(290,53,2);
If (tb[2,5]='e1') then
regina(293,53,1);
If (tb[2,5]='e2') then
regina(293,53,2);
If (tb[2,5]='i2') then
pion(212,53,2);
End;
If (ch='d2') then
Begin
For i:=239 to 290 do
For j:=54 to 105 do
Putpixel(i,j,7);
tb[2,4]:=aux;
If (tb[2,4]='a1') or (tb[2,4]='h1') then
tura(160,57,1);
If(tb[2,4]='a2') or (tb[2,4]='h2') then
tura(160,57,2);
If (tb[2,4]='b1') or (tb[2,4]='g1') then
cal(158,57,1);
If (tb[2,4]='b2') or (tb[2,4]='g2') then
cal(158,57,2);
If (tb[2,4]='c1') then
nebun(238,53,1);
If (tb[2,4]='f2') then
nebun(238,53,2);
If (tb[2,4]='d1') then
rege(237,53,1);
If (tb[2,4]='d2') then
rege(237,53,2);
If (tb[2,4]='e1') then
regina(240,53,1);
If (tb[2,4]='e2') then
regina(240,53,2);
If (tb[2,4]='i2') then
pion(159,53,2);
End;
If (ch='c2') then
Begin
For i:=186 to 237 do
For j:=54 to 105 do
Putpixel(i,j,8);
tb[2,3]:=aux;
If (tb[2,3]='a1') or (tb[2,3]='h1') then
tura(107,57,1);
If(tb[2,3]='a2') or (tb[2,3]='h2') then
tura(107,57,2);
If (tb[2,3]='b1') or (tb[2,3]='g1') then
cal(105,57,1);
If (tb[2,3]='b2') or (tb[2,3]='g2') then
cal(105,57,2);
If (tb[2,3]='f1') then
nebun(185,53,1);
If (tb[2,3]='c2') then
nebun(185,53,2);
If (tb[2,3]='d1') then
rege(184,53,1);
If (tb[2,3]='d2') then
rege(184,53,2);
If (tb[2,3]='e1') then
regina(187,53,1);
If (tb[2,3]='e2') then
regina(187,53,2);
If (tb[2,3]='i2') then
pion(106,53,2);
End;
If (ch='b2') then
Begin
For i:=133 to 184 do
For j:=54 to 105 do
Putpixel(i,j,7);
tb[2,2]:=aux;
If (tb[2,2]='a1') or (tb[2,2]='h1') then
tura(54,57,1);
If(tb[2,2]='a2') or (tb[2,2]='h2') then
tura(54,57,2);
If (tb[2,2]='b1') or (tb[2,2]='g1') then
cal(52,57,1);
If (tb[2,2]='b2') or (tb[2,2]='g2') then
cal(52,57,2);
If (tb[2,2]='c1') then
nebun(132,53,1);
If (tb[2,2]='f2') then
nebun(132,53,2);
If (tb[2,2]='d1') then
rege(131,53,1);
If (tb[2,2]='d2') then
rege(131,53,2);
If (tb[2,2]='e1') then
regina(134,53,1);
If (tb[2,2]='e2') then
regina(134,53,2);
If (tb[2,2]='i2') then
pion(53,53,2);
End;
If (ch='a2') then
Begin
For i:=80 to 131 do
For j:=54 to 105 do
Putpixel(i,j,8);
tb[2,1]:=aux;
If (tb[2,1]='a1') or (tb[2,1]='h1') then
tura(1,57,1);
If(tb[2,1]='a2') or (tb[2,1]='h2') then
tura(1,57,2);
If (tb[2,1]='b1') or (tb[2,1]='g1') then
cal(-1,57,1);
If (tb[2,1]='b2') or (tb[2,1]='g2') then
cal(-1,57,2);
If (tb[2,1]='f1') then
nebun(79,53,1);
If (tb[2,1]='c2') then
nebun(79,53,2);
If (tb[2,1]='d1') then
rege(78,53,1);
If (tb[2,1]='d2') then
rege(78,53,2);
If (tb[2,1]='e1') then
regina(81,53,1);
If (tb[2,1]='e2') then
regina(81,53,2);
If (tb[2,1]='i2') then
pion(0,53,2);
End;
If (ch='h1') then
Begin
For i:=451 to 502 do
For j:=1 to 52 do
Putpixel(i,j,8);
tb[1,8]:=aux;
If (tb[1,8]='a1') or (tb[1,8]='h1') then
tura(372,4,1);
If(tb[1,8]='a2') or (tb[1,8]='h2') then
tura(372,4,2);
If (tb[1,8]='b1') or (tb[1,8]='g1') then
cal(370,4,1);
If (tb[1,8]='b2') or (tb[1,8]='g2') then
cal(370,4,2);
If (tb[1,8]='f1') then
nebun(450,0,1);
If (tb[1,8]='c2') then
nebun(450,0,2);
If (tb[1,8]='d1') then
rege(449,0,1);
If (tb[1,8]='d2') then
rege(449,0,2);
If (tb[1,8]='e1') then
regina(452,0,1);
If (tb[1,8]='e2') then
regina(452,0,2);
If (tb[1,8]='i2') then
pion(371,0,2);
End;
If (ch='g1') then
Begin
For i:=398 to 449 do
For j:=1 to 52 do
Putpixel(i,j,7);
tb[1,7]:=aux;
If (tb[1,7]='a1') or (tb[1,7]='h1') then
tura(319,4,1);
If(tb[1,7]='a2') or (tb[1,7]='h2') then
tura(319,4,2);
If (tb[1,7]='b1') or (tb[1,7]='g1') then
cal(317,4,1);
If (tb[1,7]='b2') or (tb[1,7]='g2') then
cal(317,4,2);
If (tb[1,7]='c1') then
nebun(397,0,1);
If (tb[1,7]='f2') then
nebun(397,0,2);
If (tb[1,7]='d1') then
rege(396,0,1);
If (tb[1,7]='d2') then
rege(396,0,2);
If (tb[1,7]='e1') then
regina(399,0,1);
If (tb[1,7]='e2') then
regina(399,0,2);
If (tb[1,7]='i2') then
pion(318,0,2);
End;
If (ch='f1') then
Begin
For i:=345 to 396 do
For j:=1 to 52 do
Putpixel(i,j,8);
tb[1,6]:=aux;
If (tb[1,6]='a1') or (tb[1,6]='h1') then
tura(266,4,1);
If(tb[1,6]='a2') or (tb[1,6]='h2') then
tura(266,4,2);
If (tb[1,6]='b1') or (tb[1,6]='g1') then
cal(264,4,1);
If (tb[1,6]='b2') or (tb[1,6]='g2') then
cal(264,4,2);
If (tb[1,6]='f1') then
nebun(344,0,1);
If (tb[1,6]='c2') then
nebun(344,0,2);
If (tb[1,6]='d1') then
rege(343,0,1);
If (tb[1,6]='d2') then
rege(343,0,2);
If (tb[1,6]='e1') then
regina(346,0,1);
If (tb[1,6]='e2') then
regina(346,0,2);
If (tb[1,6]='i2') then
pion(265,0,2);
End;
If (ch='e1') then
Begin
For i:=292 to 343 do
For j:=1 to 52 do
Putpixel(i,j,7);
tb[1,5]:=aux;
If (tb[1,5]='a1') or (tb[1,5]='h1') then
tura(213,4,1);
If(tb[1,5]='a2') or (tb[1,5]='h2') then
tura(213,4,2);
If (tb[1,5]='b1') or (tb[1,5]='g1') then
cal(211,4,1);
If (tb[1,5]='b2') or (tb[1,5]='g2') then
cal(211,4,2);
If (tb[1,5]='c1') then
nebun(291,0,1);
If (tb[1,5]='f2') then
nebun(291,0,2);
If (tb[1,5]='d1') then
rege(290,0,1);
If (tb[1,5]='d2') then
rege(290,0,2);
If (tb[1,5]='e1') then
regina(293,0,1);
If (tb[1,5]='e2') then
regina(293,0,2);
If (tb[1,5]='i2') then
pion(212,0,2);
End;
If (ch='d1') then
Begin
For i:=239 to 290 do
For j:=1 to 52 do
Putpixel(i,j,8);
tb[1,4]:=aux;
If (tb[1,4]='a1') or (tb[1,4]='h1') then
tura(160,4,1);
If(tb[1,4]='a2') or (tb[1,4]='h2') then
tura(160,4,2);
If (tb[1,4]='b1') or (tb[1,4]='g1') then
cal(158,4,1);
If (tb[1,4]='b2') or (tb[1,4]='g2') then
cal(158,4,2);
If (tb[1,4]='f1') then
nebun(238,0,1);
If (tb[1,4]='c2') then
nebun(238,0,2);
If (tb[1,4]='d1') then
rege(237,0,1);
If (tb[1,4]='d2') then
rege(237,0,2);
If (tb[1,4]='e1') then
regina(240,0,1);
If (tb[1,4]='e2') then
regina(240,0,2);
If (tb[1,4]='i2') then
pion(159,0,2);
End;
If (ch='c1') then
Begin
For i:=186 to 237 do
For j:=1 to 52 do
Putpixel(i,j,7);
tb[1,3]:=aux;
If (tb[1,3]='a1') or (tb[1,3]='h1') then
tura(107,4,1);
If(tb[1,3]='a2') or (tb[1,3]='h2') then
tura(107,4,2);
If (tb[1,3]='b1') or (tb[1,3]='g1') then
cal(105,4,1);
If (tb[1,3]='b2') or (tb[1,3]='g2') then
cal(105,4,2);
If (tb[1,3]='c1') then
nebun(185,0,1);
If (tb[1,3]='f2') then
nebun(185,0,2);
If (tb[1,3]='d1') then
rege(184,0,1);
If (tb[1,3]='d2') then
rege(184,0,2);
If (tb[1,3]='e1') then
regina(187,0,1);
If (tb[1,3]='e2') then
regina(187,0,2);
If (tb[1,3]='i2') then
pion(106,0,2);
End;
If (ch='b1') then
Begin
For i:=133 to 184 do
For j:=1 to 52 do
Putpixel(i,j,8);
tb[1,2]:=aux;
If (tb[1,2]='a1') or (tb[1,2]='h1') then
tura(54,4,1);
If(tb[1,2]='a2') or (tb[1,2]='h2') then
tura(54,4,2);
If (tb[1,2]='b1') or (tb[1,2]='g1') then
cal(52,4,1);
If (tb[1,2]='b2') or (tb[1,2]='g2') then
cal(52,4,2);
If (tb[1,2]='f1') then
nebun(132,0,1);
If (tb[1,2]='c2') then
nebun(132,0,2);
If (tb[1,2]='d1') then
rege(131,0,1);
If (tb[1,2]='d2') then
rege(131,0,2);
If (tb[1,2]='e1') then
regina(134,0,1);
If (tb[1,2]='e2') then
regina(134,0,2);
If (tb[1,2]='i2') then
pion(53,0,2);
End;
If (ch='a1') then
Begin
For i:=80 to 131 do
For j:=1 to 52 do
Putpixel(i,j,7);
tb[1,1]:=aux;
If (tb[1,1]='a1') or (tb[1,1]='h1') then
tura(1,4,1);
If(tb[1,1]='a2') or (tb[1,1]='h2') then
tura(1,4,2);
If (tb[1,1]='b1') or (tb[1,1]='g1') then
cal(-1,4,1);
If (tb[1,1]='b2') or (tb[1,1]='g2') then
cal(-1,4,2);
If (tb[1,1]='c1') then
nebun(79,0,1);
If (tb[1,1]='f2') then
nebun(79,0,2);
If (tb[1,1]='d1') then
rege(78,0,1);
If (tb[1,1]='d2') then
rege(78,0,2);
If (tb[1,1]='e1') then
regina(81,0,1);
If (tb[1,1]='e2') then
regina(81,0,2);
If (tb[1,1]='i2') then
pion(0,0,2);
End; End;

Procedure reinviere;
Begin
For x:=1 to 8 do
Begin
If (tb[1,x]='i2') then
Begin
If x=1 then
Begin
Repeat
Repeat
For i:=80 to 131 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
regina(81,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='e2';
If tb[1,x]<>'e2' then
Begin
Repeat
For i:=80 to 131 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
cal(0,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='b2'
End;
If (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=80 to 131 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
nebun(79,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='c2';
End;
If (tb[1,x]<>'c2') and (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=80 to 131 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
tura(0,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='a2';
End;
Until (tb[1,x]='a2') or (tb[1,x]='c2') or (tb[1,x]='b2') or (tb[1,x]='e2');
End;
If x=2 then
Begin
Repeat
Repeat
For i:=133 to 184 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
regina(134,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='e2';
If tb[1,x]<>'e2' then
Begin
Repeat
For i:=133 to 184 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
cal(53,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='b2'
End;
If (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=133 to 184 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
nebun(132,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='c2';
End;
If (tb[1,x]<>'c2') and (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=133 to 184 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
tura(53,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='a2';
End;
Until (tb[1,x]='a2') or (tb[1,x]='c2') or (tb[1,x]='b2') or (tb[1,x]='e2');
End;
If x=3 then
Begin
Repeat
Repeat
For i:=186 to 237 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
regina(187,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='e2';
If tb[1,x]<>'e2' then
Begin
Repeat
For i:=186 to 237 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
cal(106,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='b2'
End;
If (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=186 to 237 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
nebun(185,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='c2';
End;
If (tb[1,x]<>'c2') and (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=186 to 237 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
tura(106,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='a2';
End;
Until (tb[1,x]='a2') or (tb[1,x]='c2') or (tb[1,x]='b2') or (tb[1,x]='e2');
End;
If x=4 then
Begin
Repeat
Repeat
For i:=239 to 290 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
regina(240,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='e2';
If tb[1,x]<>'e2' then
Begin
Repeat
For i:=239 to 290 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
cal(159,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='b2'
End;
If (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=239 to 290 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
nebun(238,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='c2';
End;
If (tb[1,x]<>'c2') and (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=239 to 290 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
tura(159,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='a2';
End;
Until (tb[1,x]='a2') or (tb[1,x]='c2') or (tb[1,x]='b2') or (tb[1,x]='e2');
End;
If x=5 then
Begin
Repeat
Repeat
For i:=292 to 343 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
regina(293,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='e2';
If tb[1,x]<>'e2' then
Begin
Repeat
For i:=292 to 343 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
cal(212,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='b2'
End;
If (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=292 to 343 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
nebun(291,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='c2';
End;
If (tb[1,x]<>'c2') and (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=292 to 343 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
tura(212,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='a2';
End;
Until (tb[1,x]='a2') or (tb[1,x]='c2') or (tb[1,x]='b2') or (tb[1,x]='e2');
End;
If x=6 then
Begin
Repeat
Repeat
For i:=345 to 396 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
regina(346,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='e2';
If tb[1,x]<>'e2' then
Begin
Repeat
For i:=345 to 396 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
cal(265,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='b2'
End;
If (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=345 to 396 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
nebun(344,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='c2';
End;
If (tb[1,x]<>'c2') and (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=345 to 396 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
tura(265,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='a2';
End;
Until (tb[1,x]='a2') or (tb[1,x]='c2') or (tb[1,x]='b2') or (tb[1,x]='e2');
End;
If x=7 then
Begin
Repeat
Repeat
For i:=398 to 449 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
regina(399,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='e2';
If tb[1,x]<>'e2' then
Begin
Repeat
For i:=398 to 449 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
cal(318,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='b2'
End;
If (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=398 to 449 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
nebun(397,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='c2';
End;
If (tb[1,x]<>'c2') and (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=398 to 449 do
For j:=1 to 52 do
Putpixel(i,j,7);
Delay(800);
tura(318,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='a2';
End;
Until (tb[1,x]='a2') or (tb[1,x]='c2') or (tb[1,x]='b2') or (tb[1,x]='e2');
End;
If x=8 then
Begin
Repeat
Repeat
For i:=451 to 502 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
regina(452,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='e2';
If tb[1,x]<>'e2' then
Begin
Repeat
For i:=451 to 502 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
cal(371,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='b2'
End;
If (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=451 to 502 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
nebun(550,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='c2';
End;
If (tb[1,x]<>'c2') and (tb[1,x]<>'b2') and (tb[1,x]<>'e2') then
Begin
Repeat
For i:=451 to 502 do
For j:=1 to 52 do
Putpixel(i,j,8);
Delay(800);
tura(371,0,2);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[1,x]:='a2';
End;
Until (tb[1,x]='a2') or (tb[1,x]='c2') or (tb[1,x]='b2') or (tb[1,x]='e2');
End;
End;
If (tb[8,x]='i1') then
Begin
If x=1 then
Begin
Repeat
Repeat
For i:=80 to 131 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
regina(81,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='e1';
If tb[8,x]<>'e1' then
Begin
Repeat
For i:=80 to 131 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
cal(0,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='b1'
End;
If (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=80 to 131 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
nebun(79,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='c1';
End;
If (tb[8,x]<>'c1') and (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=80 to 131 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
tura(0,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='a1';
End;
Until (tb[8,x]='a1') or (tb[8,x]='c1') or (tb[8,x]='b1') or (tb[8,x]='e1');
End;
If x=2 then
Begin
Repeat
Repeat
For i:=133 to 184 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
regina(134,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='e1';
If tb[8,x]<>'e1' then
Begin
Repeat
For i:=133 to 184 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
cal(53,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='b1'
End;
If (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=133 to 184 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
nebun(132,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='c1';
End;
If (tb[8,x]<>'c1') and (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=133 to 184 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
tura(53,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='a1';
End;
Until (tb[8,x]='a1') or (tb[8,x]='c1') or (tb[8,x]='b1') or (tb[8,x]='e1');
End;
If x=3 then
Begin
Repeat
Repeat
For i:=186 to 237 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
regina(187,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='e1';
If tb[8,x]<>'e1' then
Begin
Repeat
For i:=186 to 237 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
cal(106,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='b1'
End;
If (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=186 to 237 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
nebun(185,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='c1';
End;
If (tb[8,x]<>'c1') and (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=186 to 237 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
tura(106,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='a1';
End;
Until (tb[8,x]='a1') or (tb[8,x]='c1') or (tb[8,x]='b1') or (tb[8,x]='e1');
End;
If x=4 then
Begin
Repeat
Repeat
For i:=239 to 290 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
regina(240,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='e1';
If tb[8,x]<>'e1' then
Begin
Repeat
For i:=239 to 290 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
cal(159,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='b1'
End;
If (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=239 to 290 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
nebun(238,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='c1';
End;
If (tb[8,x]<>'c1') and (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=239 to 290 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
tura(159,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='a1';
End;
Until (tb[8,x]='a1') or (tb[8,x]='c1') or (tb[8,x]='b1') or (tb[8,x]='e1');
End;
If x=5 then
Begin
Repeat
Repeat
For i:=292 to 343 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
regina(293,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='e1';
If tb[8,x]<>'e1' then
Begin
Repeat
For i:=292 to 343 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
cal(212,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='b1'
End;
If (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=292 to 343 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
nebun(291,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='c1';
End;
If (tb[8,x]<>'c1') and (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=292 to 343 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
tura(212,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='a1';
End;
Until (tb[8,x]='a1') or (tb[8,x]='c1') or (tb[8,x]='b1') or (tb[8,x]='e1');
End;
If x=6 then
Begin
Repeat
Repeat
For i:=345 to 396 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
regina(346,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='e1';
If tb[8,x]<>'e1' then
Begin
Repeat
For i:=345 to 396 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
cal(265,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='b1'
End;
If (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=345 to 396 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
nebun(344,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='c1';
End;
If (tb[8,x]<>'c1') and (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=345 to 396 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
tura(265,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='a1';
End;
Until (tb[8,x]='a1') or (tb[8,x]='c1') or (tb[8,x]='b1') or (tb[8,x]='e1');
End;
If x=7 then
Begin
Repeat
Repeat
For i:=398 to 449 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
regina(399,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='e1';
If tb[8,x]<>'e1' then
Begin
Repeat
For i:=398 to 449 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
cal(318,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='b1'
End;
If (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=398 to 449 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
nebun(397,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='c1';
End;
If (tb[8,x]<>'c1') and (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=398 to 449 do
For j:=372 to 423 do
Putpixel(i,j,8);
Delay(800);
tura(318,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='a1';
End;
Until (tb[8,x]='a1') or (tb[8,x]='c1') or (tb[8,x]='b1') or (tb[8,x]='e1');
End;
If x=8 then
Begin
Repeat
Repeat
For i:=452 to 502 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
regina(452,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='e1';
If tb[8,x]<>'e1' then
Begin
Repeat
For i:=452 to 502 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
cal(371,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='b1';
End;
If (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=452 to 502 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
nebun(550,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='c1';
End;
If (tb[8,x]<>'c1') and (tb[8,x]<>'b1') and (tb[8,x]<>'e1') then
Begin
Repeat
For i:=452 to 502 do
For j:=372 to 423 do
Putpixel(i,j,7);
Delay(800);
tura(371,371,1);
Delay(800);
Until (keypressed);
If readkey='s' then
tb[8,x]:='a1';
End;
Until (tb[8,x]='a1') or (tb[8,x]='c1') or (tb[8,x]='b1') or (tb[8,x]='e1');
End; End; End; End;

Procedure mesaj_final;
Begin
clrscr;
For i:=1 to 8 do
Begin
For j:=1 to 8 do
If tb[i,j]<>'' then
Write(tb[i,j],' ') else Write('   ');
Writeln;
End;
Writeln; Writeln;
mesaj:='Caracterele dispuse mai sus reprezinta literele corespunzatoare pieselor de  pe tabla';
i:=0;
Repeat
i:=i+1;
write(mesaj[i]);
Delay(50);
Until (i=length(mesaj));
Writeln;
mesaj:='ce a mai ramas din ele';
i:=0;
Repeat
i:=i+1;
write(mesaj[i]);
Delay(120);
Until (i=length(mesaj));
writeln;
Write('Concluzie:Tabla de sah din acest joc are in spate o matrice de stringuri ce se  modifica la fiecare mutare');
Writeln; Writeln;
Write('Apasa orice tasta pentru a incheia executia programului');
Readkey;
End;

Begin
ClrScr;
Initgraph(gd,gm,'');
gd:=detect;
aranjare_tabla;    //START RUTINA
Repeat
     citire_ch;
     stergere;
     If ch<>'q' then
		     If ch='r' then

		     		aranjare_tabla

		     else
				     Begin
				     citire_ch;
				     replasare;
				     reinviere;
				     If ch='r' then
				     aranjare_tabla;
				    End;
				    
Until (ch='q');  //END RUTINA
Closegraph;
mesaj_final;
End.
{ M.B.R.I.R.}