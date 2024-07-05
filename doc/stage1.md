## Tables & Descriptions
### Student
- **Attributes**: `email` (primary key), `first_name`, `last_name`, `password`.
- Contains basic user info and credentials

### Recipe
- **Attributes**: `recipe_id` (primary key), `email` (foreign key), `category_id` (foreign key), `recipe_name`, `instructions`, `cook_mins`, `img_url`.
- Each recipe is created by a student, and basic information about the recipe is stored here.

### Category
- **Attributes**: `category_id` (primary key), `category_name`, `genre`.
- Each category represents a dish, e.g. 'Spaghetti' with 'genre' referring to the cuisine, e.g. 'Chinese'.

### NutritionNeeds
- **Attributes**: `email` (primary key), `fiber`, `calories`, `potassium`, `carbs`, `fat`, `sodium`, `sugar`, `vitamin_d`, `calcium`, `iron`.
- One set of nutritional needs per student.

### Ingredient
- **Attributes**: `ingredient_id` (primary key), `ingredient_name`,  `fiber`, `calories`, `potassium`, `carbs`, `fat`, `sodium`, `sugar`, `vitamin_d`, `calcium`, `iron`.
- Contains nutritional information for each ingredient with predefined units.

### RecipeIngredients
- **Attributes**: `recipe_id` (primary key), `ingredient_id` (foreign key), `amount`, `units`.
- Each entry links a recipe with an ingredient and specifies the amount used.

  ## Relationships
- A **Student** can create many **Recipes** (1-to-many).
- A **Category** can have many **Recipes** (1-to-many).
- A **Student** has one set of **NutritionNeeds** (1-to-1).
- A **Recipe** can have many **RecipeIngredients** (1-to-many).
- An **Ingredient** can be used in many **RecipeIngredients** (1-to-many).

## Relational Schema
- **Student**(`email`: VARCHAR [PK], `first_name`: VARCHAR, `last_name`: VARCHAR, `password`: VARCHAR)
- **Recipe**(`recipe_id`: INT [PK], `email`: VARCHAR [FK to Student.email], `category_id`: INT [FK to Category.category_id], `recipe_name`: VARCHAR, `instructions`: TEXT, `cook_mins`: INT, `category_id`: INT [FK to Category.category_id])
- **Category**(`category_id`: INT [PK], `category_name`: VARCHAR, `Genre`: VARCHAR)
- **NutritionNeeds**(`email`: VARCHAR [PK], `calories`: DECIMAL, `potassium`: DECIMAL, `carbs`: DECIMAL, `fat`: DECIMAL, `fiber`: DECIMAL, `sugar`: DECIMAL, `sodium`: DECIMAL, `calcium`: DECIMAL, `iron`: DECIMAL, `vitamind_d`: DECIMAL)
- **Ingredient**(`ingredient_id`: INT [PK], `ingredient_name`: VARCHAR, `calories`: DECIMAL, `potassium`: DECIMAL, `carbs`: DECIMAL, `fat`: DECIMAL, `fiber`: DECIMAL, `sugar`: DECIMAL, `sodium`: DECIMAL, `calcium`: DECIMAL, `iron`: DECIMAL, `vitamind_d`: DECIMAL)
- **RecipeIngredients**(`recipe_id`: INT [PK], `ingredient_id`: INT [FK to Ingredient.ingredient_id], `amount`: DECIMAL, `units`: VARCHAR)
