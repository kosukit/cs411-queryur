 i updated the backend a little mainly focusing on the home page.
 i created a trigger that when u sign up if your eamil does not start with .com, it auto add for you, 
 a stored procejure that show the top 3 contributors, and a delete account option. note that once a account is deleted
 it will also delete all the recipe the user created since email is a fornign key 


for the trigger and stored procejure  copy 

USE `mealplan`;
DELIMITER //
CREATE TRIGGER before_insert_student
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
IF NEW.email NOT LIKE '%.com' THEN
    SET NEW.email = CONCAT(NEW.email, '.com');
END IF;
END;
//
DELIMITER;





USE `mealplan`;

DELIMITER //

CREATE PROCEDURE GetTopStudents()
BEGIN
    SELECT 
    s.email, 
    s.first_name, 
    COUNT(r.recipe_id) AS recipe_count,
    RANK() OVER (ORDER BY COUNT(r.recipe_id) DESC) AS `rank`
FROM Student s
LEFT JOIN Recipe r ON s.email = r.email
GROUP BY s.email
ORDER BY recipe_count DESC
LIMIT 3;
END 
//

DELIMITER ;
in mysql

and replace home.html and app.js as provided