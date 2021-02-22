with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Float_Text_IO;

procedure Scantron is

   --declare array type
   MaxItems : CONSTANT Positive := 100;
   SUBTYPE MyRange IS Positive RANGE 1..MaxItems; 
   TYPE IntArray IS ARRAY(MyRange) of Integer;
   Frequency : ARRAY(1..102) of Integer := (others => 0);
   
   --declare variables
   Input : File_Type;
   Total_Question:Ada.Strings.Unbounded.Unbounded_String;
   answer: Ada.Strings.Unbounded.Unbounded_String;
   Answer_val:IntArray;
   Student_val:IntArray;
   Worth : Integer;
   total_que : Integer;
   total_sum : Integer;
   total_Student : Integer;
   x : Integer;
   file_name : Ada.Strings.Unbounded.Unbounded_String;
   
   -- function to parse string into array of integer
   FUNCTION tokenize ( str : Ada.Strings.Unbounded.Unbounded_String ; Len : Integer) RETURN  IntArray IS
   s       : String   := Ada.Strings.Unbounded.to_string(str);
   current : Positive := s'First;      
   J       : Positive := 1;
   Numbers : IntArray;

   begin
   for i in s'range loop 
      if s (i) = ' ' then 
         Numbers(J) := Integer'Value(s (current .. i-1));
         J := J + 1;
         current := i + 1;
      end if;

      if i = s'last then 
         Numbers(J) := Integer'Value(s (current .. i));
         J := J + 1;
         current := i + 1;
      end if;
      end loop;
   RETURN Numbers;
   end tokenize;
      
   --function to calculate total score of student
   FUNCTION score ( Answer_val : IntArray; Student_val : IntArray ; Len : Integer ; Worth : Integer) RETURN  Integer IS
      total : Integer;
      I : Positive := 1;
      begin
         total := 0;
         LOOP
         if Answer_val(I) = Student_val(I+1) then
            total := total + Worth;
         end if;
         I := I + 1;
         exit when I = Len + 1;
      END LOOP;
      RETURN total;
   end score;

   --Procedure to read student data from file
   --parse it into array and caluclate total score of student 
   --update frequency of each score
   PROCEDURE readStudentData IS
      result : Integer;
      frequency_index : Integer;
   BEGIN
      while not End_OF_File (Input) loop
         declare
            Line : String := Get_Line (Input);
         begin
         Student_val := tokenize(Ada.Strings.Unbounded.To_Unbounded_String(Line),total_que+1);
         result := score(Answer_val,Student_val,total_que,Worth);
         Ada.Integer_Text_IO.Put(Student_val(1), Width=>4);
         Ada.Integer_Text_IO.Put(result);
         Ada.Text_IO.New_Line;
         frequency_index := result + 1;
         Frequency(frequency_index) := Frequency(frequency_index) + 1;
         total_Student := total_Student + 1; 
         total_sum := total_sum + result;
         end;
      end loop;
   END readStudentData;

begin
   -- get file name from user
   Ada.Text_IO.Put("Enter A File Name: ");
   file_name := Ada.Strings.Unbounded.To_Unbounded_String(Ada.Text_IO.Get_Line);

   --Open file
   Open (File => Input,
         Mode => In_File,
         Name => Ada.Strings.Unbounded.To_String(file_name));
   
   --read total question from file
   Total_Question := Ada.Strings.Unbounded.To_Unbounded_String(Get_Line(Input));
   
   --convert total question string to integer
   total_que := Integer'Value(Ada.Strings.Unbounded.To_String(Total_Question));
   Worth := 100 / total_que;
   total_Student := 0;
   total_sum := 0;   

   -- read answer keys from file
   answer := Ada.Strings.Unbounded.To_Unbounded_String(Get_Line(Input));

   --convert total question string to array
   Answer_val := tokenize(answer,total_que);
   Ada.Text_IO.Put("Student ID    Score");
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put("===================");
   Ada.Text_IO.New_Line;

   --read student data from file and convert it into array
   readStudentData;
   
   Ada.Text_IO.Put("===================");
   Ada.Text_IO.New_Line;

   -- print total student
   Ada.Text_IO.Put("Tests graded = ");
   Ada.Integer_Text_IO.Put(total_Student, Width => 1);
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put("===================");
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put("Score     Frequency");
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put("===================");
   Ada.Text_IO.New_Line;

   -- print score frequncey
   x := 102;
   WHILE (x > 0) LOOP
      IF Frequency(x) > 0 THEN
         Ada.Integer_Text_IO.Put(x-1, Width => 3);
         Ada.Integer_Text_IO.Put(Frequency(x), Width => 12);
         Ada.Text_IO.New_Line;
      END IF;
      x := x - 1;
   END LOOP;

   Ada.Text_IO.Put("===================");
   Ada.Text_IO.New_Line;

   --calculate avarage
   Ada.Text_IO.Put("Class Average = ");
   Ada.Integer_Text_IO.Put(total_sum / total_Student, Width => 1);
   Ada.Text_IO.New_Line;

   --Close file
   Ada.Text_IO.Close(File => Input);
exception
   when End_Error =>
      if Is_Open(Input) then 
         Close (Input);
      end if;
end Scantron;
