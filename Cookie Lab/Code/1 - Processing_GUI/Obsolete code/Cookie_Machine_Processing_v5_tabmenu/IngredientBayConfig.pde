import java.util.Arrays;
import java.util.Collections;
Ingredients[] ingredient;
Ingredients[] defaultIngredient; // Used to maintain the slider values after sorting Ingredients[] ingredient

public static String IngredientList[] = { // Ingredient bay order (zero-base numbering)
  "Sugar", 
  "Butter", 
  "Molasses", 
  "Vanilla", 
  "Egg", 
  "Baking Soda", 
  "Chocolate Chips", 
  "Oats", 
  "Flour", 
  "Salt", 
  "M & M's"
};

public static int BayList[] ={ //Default configuration
  2, // Sugar
  9, // Butter
  3, // Molasses
  7, // Vanilla
  8, // Egg
  6, // Baking Soda
  4, // Chocolate Chips
  10, // Oats
  0, // Flour
  1, // Salt
  5 // M & M's
};

static int numbOfIngredients = IngredientList.length;

static class Ingredients {
  private String name;
  private int quantity;
  private int location;

  //Constructor
  Ingredients(String tempName, int tempQuantity, int tempLocation) {
    name = tempName;
    quantity = tempQuantity;
    location = tempLocation;
  }
  String getIdentity() {
    return name;
  }
  int getAmount() {
    return quantity;
  }
  int getLocation() {
    return location;
  }
};

void setIngredients() {
  ingredient = new Ingredients[numbOfIngredients];
  defaultIngredient = new Ingredients[numbOfIngredients];
  for (int i = 0; i<numbOfIngredients; i++) {
    ingredient[i] = new Ingredients(IngredientList[i], 0, BayList[i]);
    defaultIngredient[i] = new Ingredients(IngredientList[i], 0, BayList[i]);
  }
}

void updateIngredients() {
  for (int i=0; i<numbOfIngredients; i++) {
    ingredient[i].quantity = round(cp5.getController(ingredient[i].getIdentity()).getValue());
    defaultIngredient[i].quantity = round(cp5.getController(defaultIngredient[i].getIdentity()).getValue());
    ingredientValueLabel[i].setText(str(round(defaultIngredient[i].getAmount())));
    BayList[i] = round(bayNumber[i].getValue());
  }
}
