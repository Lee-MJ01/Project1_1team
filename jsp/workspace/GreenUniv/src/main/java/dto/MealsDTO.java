package dto;

public class MealsDTO {
	private String meal_id;
	private String meal_date;
	private String meal_type;
	
	public String getMeal_id() {
		return meal_id;
	}
	public void setMeal_id(String meal_id) {
		this.meal_id = meal_id;
	}
	public String getMeal_date() {
		return meal_date;
	}
	public void setMeal_date(String meal_date) {
		this.meal_date = meal_date;
	}
	public String getMeal_type() {
		return meal_type;
	}
	public void setMeal_type(String meal_type) {
		this.meal_type = meal_type;
	}
	@Override
	public String toString() {
		return "MealsDTO [meal_id=" + meal_id + ", meal_date=" + meal_date + ", meal_type=" + meal_type + "]";
	}
}
