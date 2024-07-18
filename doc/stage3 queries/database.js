import { AsyncResource } from 'async_hooks';
import mysql from 'mysql2'

const pool =mysql.createPool({
    host:'127.0.0.1',
    user:'root',
    password:'',
    database:'mealplan'
}).promise()

//get all student
async function getstudents(){
    const result = await pool.query("SELECT * FROM mealplan.Student");
    const rows = result[0];
    return rows;
}
// get all Italian dish name and calories
async function getallit(){
    
const result = await pool.query
(`SELECT r.recipe_name,SUM(i.calories) AS total_calorie
FROM Recipe r
JOIN Category c ON r.category_id = c.category_id
JOIN RecipeIngredients ri ON r.recipe_id = ri.recipe_id
JOIN Ingredient i ON ri.ingredient_id = i.ingredient_id
WHERE c.genre = 'Italian'
GROUP BY r.recipe_id`);

const rows = result[0];
    return rows;
}
//student name that needs more than 2000 calories
async function getstudentscaloriesmorethan2000(){
    const result = await pool.query(`
SELECT s.first_name, s.last_name
FROM Student s
JOIN NutritionNeeds n ON s.email = n.email
WHERE n.calories > 2000;
`);
    const rows = result[0];
    return rows;
}

//dishless than500 cal
async function getdishlessthan500cal(){
    const result = await pool.query(`SELECT 
    r.recipe_id, 
    r.recipe_name, 
    SUM(i.calories) AS total_calories
FROM 
    Recipe r
JOIN 
    Category c ON r.category_id = c.category_id
JOIN 
    RecipeIngredients ri ON r.recipe_id = ri.recipe_id
JOIN 
    Ingredient i ON ri.ingredient_id = i.ingredient_id
GROUP BY 
    r.recipe_id, r.recipe_name
HAVING 
    total_calories < 500;
`);
    const rows = result[0];
    return rows;
}


//dishless than  cal number
async function getdishlessthancal(cal){
    const result = await pool.query(`SELECT 
    r.recipe_id, 
    r.recipe_name, 
    SUM(i.calories) AS total_calories
FROM 
    Recipe r
JOIN 
    Category c ON r.category_id = c.category_id
JOIN 
    RecipeIngredients ri ON r.recipe_id = ri.recipe_id
JOIN 
    Ingredient i ON ri.ingredient_id = i.ingredient_id
GROUP BY 
    r.recipe_id, r.recipe_name
HAVING 
    total_calories < ?;
`,[cal]);
    const rows = result[0];
    return rows;
}


console.log(await getdishlessthancal(200));