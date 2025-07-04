# # College Meal Nutrition Planner Database Design
## ER Diagram
![image](https://github.com/cs411-alawini/su24-cs411-team015-queryur/assets/109307775/c91ac37f-df7a-461b-b3fa-667381149946)# College Meal Nutrition Planner Database Design

## Assumptions & Descriptions
### Student
- **Attributes**: `email` (primary key), `first_name`, `last_name`, `password`.
- Contains basic user info and credentials

### Recipe
- **Attributes**: `recipe_id` (primary key), `email` (foreign key), `category_id` (foreign key), `recipe_name`, `instructions`, `cook_mins`, `img_url`.
- Each recipe is created by a student, and basic information about the recipe is stored here. The student will create a recipe and enter a category, the name of their creation, instructions (and other details), the expected total cook time, and can upload an image at their will.

### Category
- **Attributes**: `category_id` (primary key), `category_name`, `genre`.
- Each category represents a dish, e.g. 'Spaghetti' with 'genre' referring to the cuisine the dish belongs to, e.g. 'Italian'.

### NutritionNeeds
- **Attributes**: `email` (primary key), `fiber`, `calories`, `potassium`, `carbs`, `fat`, `sodium`, `sugar`, `vitamin_d`, `calcium`, `iron`.
- OUtlines the nutritional recommendations for the set. The student will enter their expected needs themselves.

### Ingredient
- **Attributes**: `ingredient_id` (primary key), `ingredient_name`,  `fiber`, `calories`, `potassium`, `carbs`, `fat`, `sodium`, `sugar`, `vitamin_d`, `calcium`, `iron`.
- Contains nutritional information for each ingredient with predefined units to define the unit amount. Information from USDA Food Composition Database CSV (https://fdc.nal.usda.gov/download-datasets.html).

### RecipeIngredients
- **Attributes**: `recipeIngredients_id` (primary key), `recipe_id` (foreign key), `ingredient_id` (foreign key), `amount`, `units`.
- Each entry links a recipe with an ingredient and specifies the amount used in that recipe. Junction table to facilitate a many-many relationship between Ingredient and Recipe.

## Relationships
- A **Student** can create many **Recipes** (1-many).
- A **Category** can have many **Recipes** (1-many).
- A **Student** has one set of **NutritionNeeds** (1-1).
- A **Recipe** can have many **RecipeIngredients** (1-many).
- An **Ingredient** can be used in many **RecipeIngredients** (1-many).

## BCNF Normalization
### Definition: For every relationship X→Y, X should be a superkey for relation R.
- **Student**: `email` is a primary key and superkey.
- **Recipe**: `recipe_id` is a primary key superkey.
- **Category**: `category_id` is a primary key and superkey.
- **NutritionNeeds**: `email` is a primary key and superkey.
- **Ingredient**: `ingredient_id` is a superkey.
- **RecipeIngredients**: `recipeIngredients_id` is a superkey. (`recipe_id`,`ingredient_id`) is also a candidate key that uniquely identifies each row.

## Relational Schema
- **Student**(`email`: VARCHAR [PK], `first_name`: VARCHAR, `last_name`: VARCHAR, `password`: VARCHAR)
- **Recipe**(`recipe_id`: INT [PK], `email`: VARCHAR [FK to Student.email], `category_id`: INT [FK to Category.category_id], `recipe_name`: VARCHAR, `instructions`: TEXT, `cook_mins`: INT, `category_id`: INT [FK to Category.category_id])
- **Category**(`category_id`: INT [PK], `category_name`: VARCHAR, `Genre`: VARCHAR)
- **NutritionNeeds**(`email`: VARCHAR [PK], `calories`: DECIMAL, `potassium`: DECIMAL, `carbs`: DECIMAL, `fat`: DECIMAL, `fiber`: DECIMAL, `sugar`: DECIMAL, `sodium`: DECIMAL, `calcium`: DECIMAL, `iron`: DECIMAL, `vitamind_d`: DECIMAL)
- **Ingredient**(`ingredient_id`: INT [PK], `ingredient_name`: VARCHAR, `calories`: DECIMAL, `potassium`: DECIMAL, `carbs`: DECIMAL, `fat`: DECIMAL, `fiber`: DECIMAL, `sugar`: DECIMAL, `sodium`: DECIMAL, `calcium`: DECIMAL, `iron`: DECIMAL, `vitamind_d`: DECIMAL)
- **RecipeIngredients**(`recipeIngredients_id`:INT [PK], `recipe_id`: INT [FK to Recipe.recipe_id], `ingredient_id`: INT [FK to Ingredient.ingredient_id], `amount`: DECIMAL, `units`: VARCHAR)
