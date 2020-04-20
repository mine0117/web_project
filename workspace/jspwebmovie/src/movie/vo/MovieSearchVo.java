package movie.vo;

public class MovieSearchVo {
	private String keyWord;
	private String keyValue;
	private int total;
	private String orderWord;
	private String orderValue;
	
	public String getOrderWord() {
		return orderWord;
	}
	public void setOrderWord(String orderWord) {
		this.orderWord = orderWord;
	}
	public String getOrderValue() {
		return orderValue;
	}
	public void setOrderValue(String orderValue) {
		this.orderValue = orderValue;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getKeyValue() {
		return keyValue;
	}
	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

}
