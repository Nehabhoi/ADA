with Ada.Text_IO;
with Ada.Integer_TExt_IO;

PROCEDURE Stats is
   MaxItems : CONSTANT Positive := 10;
   SUBTYPE MyRange IS Positive RANGE 1..MaxItems; 
   TYPE IntArray IS ARRAY(MyRange) of Natural;
   Numbers : IntArray;
   Avg : Natural;

   FUNCTION Average( N : IntArray) RETURN  Natural IS
      Sum : Natural;
      Count : Natural;
   BEGIN
      Sum := 0;
      Count := 0;
    
      FOR I IN MyRange LOOP
         Sum := Sum + n(I);
         COUNT := COUNT + 1;
      END LOOP;
      Sum := Sum / Count;
      RETURN Sum;
   END Average;

   FUNCTION Min( N : IntArray) RETURN  Natural IS
      min_val : Natural;
   BEGIN
      min_val := 99999;
      FOR I IN MyRange LOOP
         if min_val > n(I) then
            min_val := n(I);
         end if;
      END LOOP;
      RETURN min_val;
   END Min;

   
   FUNCTION Max( N : IntArray) RETURN  Natural IS
      max_val : Natural;
   BEGIN
      max_val := 0;
      FOR I IN MyRange LOOP
         if max_val < n(I) then
            max_val := n(I);
         end if;
      END LOOP;
      RETURN max_val;
   END Max;
 
   PROCEDURE PrintArray( N : IntArray) IS
   BEGIN
      FOR I IN MyRange LOOP
         Ada.Integer_Text_IO.Put(Item=>n(I), Width=>4);
         Ada.Text_IO.New_Line; 
      END LOOP;
   END PrintArray;

   PROCEDURE PrintAll( N : IntArray) IS
   BEGIN
      PrintArray(N);
      Avg := Average(Numbers);
      Ada.Text_IO.Put(Item => "The average is ");
      Ada.Integer_Text_IO.Put(Item => avg, Width => 4);
      Ada.Text_IO.New_Line;   
      Ada.Text_IO.Put(Item => "The smallest value is ");
      Ada.Integer_Text_IO.Put(Item=>Min(N), Width =>4);
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put(Item => "The largest value is ");
      Ada.Integer_Text_IO.Put(Item=>Max(N), Width=>4);
      Ada.Text_IO.New_Line;
   END PrintAll;

BEGIN
   Ada.Text_IO.Put(Item => "This program finds the average, smallest and largest values in a set of numbers.");
   Ada.Text_IO.New_Line;
   FOR I in MyRange LOOP
      Ada.Text_IO.Put(Item => "Enter number=>");
      Ada.Integer_Text_IO.Get(Item => Numbers(I));
   END LOOP;
  
   PrintAll(Numbers);  
END Stats;
