SELECT Name, ID 
FROM Grades
WHERE Final > (Midterm1 * 0.25) + (Midterm2 * 0.25) + (Final * 0.5) AND 
Final > (Midterm1 * 0.5) + (Midterm2 * 0.5)
ORDER BY SUBSTRING(Name, 1, 3), ID;