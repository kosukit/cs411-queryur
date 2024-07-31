
const bodyParser = require('body-parser');
const express = require('express');
const pool = require('./database'); 
const path = require('path');
const session = require('express-session');
const app = express();
const multer = require('multer');

//page nav
app.use(express.static(path.join(__dirname,'public')));

//get info
app.use(bodyParser.urlencoded({extended: true }));
app.use(bodyParser.json());

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, path.join(__dirname, 'public/image'));
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + path.extname(file.originalname)); // Use timestamp as the new filename
    }
});

const upload = multer({ storage: storage });

//login info carry
app.use(session({
    secret: 'your-secret-key',
    resave: false,
    saveUninitialized: true
}));

//login get
app.get('/login', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'login.html'));
});

//login output
app.post('/login', async function(req, res){
    const {email,password } = req.body;
    const [rows] = await pool.query('SELECT * FROM mealplan.Student WHERE email = ? AND password = ?', [email, password]);
    if (rows.length > 1){
        console.error('more than 1 eamil and password pair found');
        res.status(500).send('data error');
    }
    if(rows.length > 0){
        req.session.user = rows[0];
        //res.sendFile(path.join(__dirname, 'public', 'practice.html'));
        res.redirect('/home');
        console.log('login successful');
    } else{
        res.send('Invalid email or password');
        console.log('login atempt failed');

    }

});

//signup get
app.get('/signup', function(req, res){
    res.sendFile(path.join(__dirname,'public', 'signup.html'));
});

//signup output
app.post('/signup', async function(req, res){
    const{email,first_name,last_name,password } = req.body;
    console.log(req.body);

    try {
        await pool.query('INSERT INTO mealplan.Student (email, first_name, last_name, password) VALUES (?, ?, ?, ?)', [email, first_name, last_name, password]);
        res.send('Sign up successful');
    } catch (err) {
        console.error('Error inserting into database:',err);
        res.status(500).send('Internal server error');
    }


});

//home page
app.get('/home',function(req, res){
    if(req.session.user){
        res.sendFile(path.join(__dirname, 'public', 'home.html'));
    }else{
        res.redirect('/login');
    }
});

// user info  json page
app.get('/user', (req, res) => {
    if (req.session.user) {
        res.json(req.session.user);
        //console.log(req.session.user);
    } else {
        res.status(401).json({ error: 'Unauthorized' });
    }
});

app.get('/logout', (req, res) => {
    req.session.destroy();
    res.redirect('/login');
});

// all reciptes json page
app.get('/recipe-list', async (req, res) => {
    try{
        const [rows] = await pool.query('SELECT recipe_id, recipe_name, img_url FROM mealplan.Recipe');
        res.json(rows);
        //console.log([rows]);
    }catch(err){
        console.error('Error fetch recipes:', err);
        res.status(500).send('server error');
    }
});

app.get('/recipes', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'recipes.html'));
    //console.log(recipeList);
});

//single recipe json
app.get('/recipe/:id', async (req, res) => {
    const recipeId = req.params.id;
    try {
        const [rows] = await pool.query('SELECT * FROM mealplan.Recipe WHERE recipe_id = ?', [recipeId]);
        if (rows.length > 0) {
            const recipe = rows[0];


            //get ingredients info
            const [ingredientRows] = await pool.query(
                `SELECT ri.amount, ri.units, i.*
                FROM mealplan.RecipeIngredients ri
                JOIN mealplan.Ingredient i ON ri.ingredient_id = i.ingredient_id
                WHERE ri.recipe_id = ?`, [recipeId]);

                //push json
            recipe.ingredients = ingredientRows;

            const [nutritionRows] = await pool.query(
                'SELECT * FROM mealplan.total_nutrition WHERE recipe_id = ?', [recipeId]);

            if (nutritionRows.length > 0) {
                recipe.total_nutrition = nutritionRows[0];
            }else{
                console.error('total nut not found')
            }

                res.json(recipe);

        } else {
            res.status(404).send('Recipe not found');
        }
    } catch (err) {
        console.error('Error fetching recipe details:', err);
        res.status(500).send('Internal server error');
    }
});

//get one recipe
app.get('/recipes/:id', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'recipe-detail.html'));
});


// get add recipe form. if not logged in, go to login page instead
app.get('/add-recipe', (req, res) => {
    if (req.session.user) {
        res.sendFile(path.join(__dirname, 'public', 'add-recipe.html'));
    } else {
        res.redirect('/login');
    }
});

app.post('/add-recipe', upload.single('recipe_image'),async (req, res) => {
    const {
        recipe_name,instructions,cook_mins,calories,fiber,carbohydrates,fat,
        saturated_fat,sodium,sugar,vitamin_d,calcium,iron,potassium,genre,category} = req.body;
        console.log(req.body);
        console.log("req.body");

        const img_url = "image/" + req.file.filename;

        console.log('Uploaded file:', req.file); // Log the file information
        console.log(img_url);
        console.log("img_url");



        //const img_url = 'images/' + req.recipe_image.filename;
        //console.log("url is" + img_url);
    try {
        //get next free recipe_id
        const [maxRows] = await pool.query('SELECT MAX(recipe_id) AS maxId FROM mealplan.Recipe');
        const nextRecipeId = maxRows[0].maxId + 1;

        //category table search
        const [c]= await pool.query('SELECT * FROM mealplan.Category where Genre = ? and Name =? ',[genre,category]);
        var nextcId = 0;
        if (c.length>=1){
            nextcId = c[0].category_id
        }else{
            const [m] = await pool.query('SELECT MAX(category_id) AS maxId FROM mealplan.Category');
            nextcId = m[0].maxId + 1;
            const[insertc]=await pool.query(
                'INSERT INTO mealplan.Category (category_id, Name, Genre) VALUES (?, ?, ?)',
                [nextcId,category,genre]
            );
        }

        console.log('Query Params:', {
            nextRecipeId,
            email: req.session.user.email,
            category,
            recipe_name,
            instructions,
            img_url,
            cook_mins,

        });

        // insert recipe into Recipe table
        const [result] = await pool.query(
            'INSERT INTO mealplan.Recipe (recipe_id,email,category_id, recipe_name, instructions, img_url, cook_mins) VALUES (?,?,?, ?, ?, ?,?)',
            [nextRecipeId,req.session.user.email,nextcId, recipe_name, instructions ,  img_url  , cook_mins]
        );


        //insert nutrition into total_nutrition table
        await pool.query(
            'INSERT INTO mealplan.total_nutrition (recipe_id, total_calorie, total_fiber, total_carbohydrates, total_fat, total_saturated_fat, total_sodium, total_sugar, total_vitamin_d, total_calcium, total_iron, total_potassium) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
            [nextRecipeId, calories, fiber, carbohydrates, fat, saturated_fat, sodium, sugar, vitamin_d, calcium, iron, potassium]
        );

        res.send('Recipe added successfully');
    }catch (err) {
        console.error('Error inserting into database whenadding rec:', err);
        res.status(500).send('Internal server error');
    }
});

//get GetTopStudents stored procejure, called on homepage
app.get('/top-students', async (req, res) => {
    try{
        const [results] = await pool.query('CALL GetTopStudents()');
        res.json(results[0]); // MySQL stored procedures return results as an array of arrays
    }catch (err) {
        console.error('Error fetching top students:', err);
        res.status(500).send('Internal server error');
    }
});

//delete account on home
app.post('/delete-account', async (req, res)=>{
    if(!req.session.user) {
        return res.status(401).send('error user session not found');
    }
    const email = req.session.user.email;
    try {
        await pool.query('DELETE FROM Student WHERE email = ?', [email]);
    } catch (err){
        console.error('Error deleting account:', err);
        res.status(500).send('Internal server error');
    }
});



// return 404 page
app.use(function(req, res, next){
    res.status(404)
    res.sendFile(path.join(__dirname, 'public', '404.html'));
});

app.listen(3000, function(){
    console.log('listen on 3000');

});
