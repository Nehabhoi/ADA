The University of Southern North Dakota Testing department needs to write a 
grading program for multiple choice test. It should be capable of grading tests 
with up to 50 questions and for any number of students. The program should grade 
individual exams and calculate the grade for the student based on the number of 
questions, each being the same value out of 100. For example, if there are 25 
questions each is worth 4.

The program must also determine how many times each score was earned on the test.
This is a count or frequency. The program must should show the number of students
graded and the class average.

The program should have  
•	a procedure (called with different parameters) to read the answer key 
	and the student responses. The arrays are the same size and data type so 
	only one procedure is needed to read both. </br>
•	a function that take the answer key and student response as parameters 
	and then computes the score for that student. The score is returned as 	
	integer by the function.</br>
•	an input file. The program asks the user for the name of the file. The 	
	file name is entered at the keyboard. All subsequent data is read from 
	the file.</br>
•	a score frequency count. Every time a score is computed increment a 
	counter for that value. Any score from 0 to 100 is possible (integer 
	only), so the program needs 101 counters!</br>

Behavior not assigned to functions may be done in main.

The program will accept the input file name from the keyboard after prompting 
the user for the file name. 

The first line in the input files contains the number of questions on the exam, 
the second the answer key, and all following lines contain the student ids and 
responses to the questions.

