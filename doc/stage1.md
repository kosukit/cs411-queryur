## Tables & Descriptions
### Student
- **Attributes**: `email` (primary key), `first_name`, 'last_name', `password`.
- Contains basic user info and credentials

### Recipe
- **Attributes**: `recipe_id` (primary key), `email` (foreign key), 'category_id' (foreign key), `recipe_name`, `instructions`, `cook_mins`, `img_url`.
- Each recipe is created by a student and can belong to multiple categories.

### Category
- **Attributes**: `category_id` (primary key), `category_name`, 'genre'.
- Each category represents a dish, e.g. 'Spaghetti' with 'genre' referring to the cuisine, e.g. 'Chinese'.

### NutritionNeeds
- **Attributes**: `email` (primary key), `email`, 'fiber', `calories`, `potassium`, `carbs`, `fat`, `sodium`, `sugar`, `vitamin_d`, `calcium`, `iron`.
- One set of nutritional needs per student.

### Ingredient
- **Attributes**: `ingredient_id` (primary key), `ingredient_name`,  'fiber', `calories`, `potassium`, `carbs`, `fat`, `sodium`, `sugar`, `vitamin_d`, `calcium`, `iron`.
- Contains nutritional information for each ingredient with predefined units.

### RecipeIngredients
- **Attributes**: `recipe_id` (primary key), `ingredient_id` (foreign key), `amount`, `units`.
- Each entry links a recipe with an ingredient and specifies the amount used.

  ## Relationships
- A **Student** can create many **Recipes** (1-to-many).
- A **Recipe** belongs to one **Category** (many-to-1).
- A **Student** has one set of **NutritionNeeds** (1-to-1).
- A **Recipe** can have many **RecipeIngredients** (1-to-many).
- An **Ingredient** can be used in many **RecipeIngredients** (1-to-many).
