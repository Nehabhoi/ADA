WITH Ada.Float_Text_IO;
WITH Ada.Text_IO;
WITH Ada.Numerics.Elementary_Functions;
Use Ada.Numerics.Elementary_Functions;

PACKAGE BODY Lines IS

--P1,P2 : Point;
-- then the functions and procedures listed in the spec
FUNCTION Distance(L1 : in line )RETURN Float IS
BEGIN
RETURN Sqrt((L1.P2.X - L1.P1.X) ** 2 + (L1.P2.Y - L1.P1.Y) ** 2);
 
END Distance;

FUNCTION Slope(L1 : in line )RETURN Float IS
BEGIN

RETURN ((L1.P2.Y - L1.P1.Y)/ (L1.P2.X - L1.P1.X));
 
END Slope;  

Procedure Setline(X1,Y1,X2,Y2 : Float; L: out Line) IS
BEGIN

L.P1.X := X1;
L.P1.Y := Y1;
L.P2.X := X2;
L.P2.Y := Y2;

END Setline;

PROCEDURE PrintLine(L : Line) IS
BEGIN

Ada.Text_IO.Put(Item => "(");
PrintPoint(L.P1);
Ada.Text_IO.Put(Item => ",");
PrintPoint(L.P2);
Ada.Text_IO.Put(Item => ")");

END PrintLine;

PROCEDURE PrintPoint(P : Point) IS
BEGIN

Ada.Text_IO.Put(Item => "(");
Ada.Float_Text_IO.Put(Item => P.X, Fore=>1, AFT=>4, EXP=>0);
Ada.Text_IO.Put(Item => ",");
Ada.Float_Text_IO.Put(Item => P.Y, Fore=>1, AFT=>4, EXP=>0);
Ada.Text_IO.Put(Item => ")");

END PrintPoint;

END Lines;

