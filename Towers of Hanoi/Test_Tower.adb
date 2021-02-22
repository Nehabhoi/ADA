WITH Ada.Text_IO;
WITH Ada.Integer_Text_IO;

PROCEDURE Test_Tower IS
   SUBTYPE Pegs IS Character RANGE 'A'..'C';
   Rings, Moves : Natural;
   PROCEDURE MoveDisk( FromPeg, ToPeg : Pegs; Which : Natural) IS
   BEGIN
        Moves := Moves + 1;
        Ada.Text_IO.Put("Move #");
        Ada.Text_IO.Put(Natural'Image(Moves));
        Ada.Text_IO.Put("  move Disk ");
        Ada.Text_IO.Put(Natural'Image(Which));
        Ada.Text_IO.Put(" from peg ");
        Ada.Text_IO.Put(Pegs'Image(FromPeg)(2..2));
        Ada.Text_IO.Put(" to peg ");
        Ada.Text_IO.Put(Pegs'Image(ToPeg)(2..2));
        Ada.Text_IO.New_Line;

   END MoveDisk;

   PROCEDURE Tower(FromPeg, ToPeg, AuxPeg: Pegs; N : Natural) IS
   BEGIN
      if N > 0 then
         Tower(FromPeg, AuxPeg, ToPeg, N - 1);
         MoveDisk(FromPeg,ToPeg,N);
         Tower(AuxPeg, ToPeg, FromPeg, N - 1);
      end if;     
   END Tower;
   BEGIN
     Ada.Text_IO.Put("Enter number of rings to move:");
     Ada.Integer_Text_IO.Get(Rings);
     Moves := 0;
     Tower('A','C','B',Rings);
   END Test_Tower;  

