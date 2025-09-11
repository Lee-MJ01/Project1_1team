package dto;

public class FoodItemsDTO {
	private int food_id;
	private String food_name;
	public int getFood_id() {
		return food_id;
	}
	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	@Override
	public String toString() {
		return "FoodItemsDTO [food_id=" + food_id + ", food_name=" + food_name + "]";
	}
}
