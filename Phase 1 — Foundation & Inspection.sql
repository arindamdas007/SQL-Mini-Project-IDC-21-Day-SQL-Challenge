# List all unique pizza categories.
SELECT DISTINCT category FROM pizza_types;
# Display pizza_type_id, name, and ingredients, replacing NULL ingredients with "Missing Data". Show first 5 rows.
SELECT pizza_type_id, name, COALESCE(ingredients, 'Missing Data') AS ingredients FROM pizza_types LIMIT 5;
# Check for pizzas missing a price
SELECT * FROM pizzas WHERE price IS NULL;