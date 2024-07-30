# Database Implementation & Indexing

## Part I: Database Implementation
### DDL
```SQL
CREATE TABLE Student(
email VARCHAR(255) PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
password VARCHAR(255)
);

CREATE TABLE NutritionNeeds(
email VARCHAR(255),
Calories FLOAT,
fiber FLOAT,
Carbohydrates FLOAT,
fat FLOAT,
Sodium FLOAT,
Sugar FLOAT,
vitamin_d FLOAT,
Calcium FLOAT,
Iron FLOAT,
Potassium FLOAT,
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
Calories FLOAT,
fiber FLOAT,
Carbohydrates FLOAT,
fat FLOAT,
Saturated_Fat FLOAT,
Sodium FLOAT,
Sugar FLOAT,
vitamin_d FLOAT,
Calcium FLOAT,
Iron FLOAT,
Potassium FLOAT,
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
### Data Insertion
#### Ingredient Table
![countIngredient](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/countIngredient.png)
#### Category Table
![countCategory](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/categoryCount.png)
### Advanced Queries
#### Query 1
![advanced1](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_1.png)
#### Query 2
![advanced2](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_2.png)
#### Query 3
![advanced3](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_3.png)
#### Query 4
![advanced4](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_4.png)

## Part II: Indexing
Here, indices were added in order of index for `Recipe`->`Ingredient`->`User` (student) to see whether it would have any impact on the cost performance of the advanced SQL queries above.
### Query 1
![advanced1initial](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_1_initial.png)
![advanced1_1](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_1_idxRecipe.png)
![advanced1_2](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_1_idxIngredient.png)
![advanced1_3](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_1_idxUser.png)
None of the indices used here changed the cost, meaning that none were beneficial to the performance of the query.
### Query 2
![advanced2initial](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_2_initial.png)
![advanced2_1](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_2_idxRecipe.png)
![advanced2_2](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_2_idxIngredient.png)
![advanced2_3](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_2_idxUser.png)
Indexing with regards to `Recipe` (`recipeId`) resulted in a decent gain in cost for the join function. While notable, it was not extreme by any measure, and further indices did not do anything to better this.

### Query 3
![advanced3initial](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_3_initial.png)
![advanced3_1](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_3_idxRecipe.png)
![advanced3_2](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_3_idxIngredient.png)
![advanced3_3](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_3_idxUser.png)
Similarly to query 2, indexing with regards to  `Recipe` resulted in a sizable cost gain regarding the two join functions.
### Query 4
![advanced4initial](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_4_initial.png)
![advanced4_1](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_4_idxRecipeCode.png)
![advanced4_1_2](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_4_idxRecipe.png)
![advanced4_1](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_4_idxIngredientCode.png)
![advanced4_2_2](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_4_idxIngredient.png)
![advanced4_3](https://github.com/cs411-alawini/su24-cs411-team015-queryur/blob/main/doc/imgs/advanced_4_idxUser.png)
An interesting phenomenon occurred when analyzing the cost of running query 4, as the initial state ran with a grand cost total of 0. Adding indices seemed to add to the cost in fact, which seems counterintuitive. This was confirmed multiple times, and the increase of 16.1 from index creation seems large.
