package dto;

public class Meal_ItemsDTO {
	private String meal_id;
	private int food_id;
	public String getMeal_id() {
		return meal_id;
	}
	public void setMeal_id(String meal_id) {
		this.meal_id = meal_id;
	}
	public int getFood_id() {
		return food_id;
	}
	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}
	@Override
	public String toString() {
		return "Meal_ItemsDTO [meal_id=" + meal_id + ", food_id=" + food_id + "]";
	}
}
