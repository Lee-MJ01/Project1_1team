package dto;

public class CafeteriaDTO {
	private String food_name;
	private String meal_date;
	private String meal_type;
	private String start_date;
	private String end_date;
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getMeal_date() {
		return meal_date;
	}
	public void setMeal_date(String meal_date) {
		this.meal_date = meal_date;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getMeal_type() {
		return meal_type;
	}
	public void setMeal_type(String meal_type) {
		this.meal_type = meal_type;
	}
	@Override
	public String toString() {
		return "CafeteriaDTO [food_name=" + food_name + ", meal_date=" + meal_date + ", meal_type=" + meal_type
				+ ", start_date=" + start_date + ", end_date=" + end_date + "]";
	}
	
	
}
