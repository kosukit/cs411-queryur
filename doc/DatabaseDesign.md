# Database Implementation & Indexing

## Part I: Database Implementation
```SQL
CREATE TABLE Student(
email VARCHAR(255) PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
password VARCHAR(255)
);

CREATE TABLE NutritionNeeds(
email VARCHAR(255),
Calories INT,
fiber INT,
Carbohydrates INT,
fat INT,
Sodium INT,
Sugar INT,
vitamin_d INT,
Calcium INT,
Iron INT,
Potassium INT,
PRIMARY KEY (email),
FOREIGN KEY (email) REFERENCES Student(email)
);

CREATE TABLE Category(
category_id INT PRIMARY KEY,
Name VARCHAR(255),
Genre VARCHAR(255)
);


CREATE TABLE Recipe(
recipe_id INT PRIMARY KEY,
email VARCHAR(255),
category_id INT,
recipe_name VARCHAR(255),
instructions TEXT,
img_url VARCHAR(255),
cook_mins INT,
FOREIGN KEY (email) REFERENCES Student(email),
FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Ingredient(
ingredient_id INT PRIMARY KEY,
Calories INT,
fiber INT,
Carbohydrates INT,
fat INT,
Saturated_Fat INT,
Sodium INT,
Sugar INT,
vitamin_d INT,
Calcium INT,
Iron INT,
Potassium INT,
ingredient_name VARCHAR(255)
);

CREATE TABLE RecipeIngredients(
recipeIngredients_id INT PRIMARY KEY,
ingredient_id INT,
recipe_id INT,
amount DECIMAL(10, 2),
units VARCHAR(50),
FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id),
FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);
```

![showDatabases](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/stage3%20databasedump/showDatabases.png)
![showTables](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/stage3%20databasedump/showTables.png)

## Part II: Indexing
