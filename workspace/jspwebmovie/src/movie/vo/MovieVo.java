package movie.vo;

import java.sql.Date;

public class MovieVo {
	private String mid;
	private String genre;
	private String mname;
	private String mname_e;
	private Date rday;
	private int rtime;
	private String country;
	private String rank;
	private double star;
	private String rank_css;
	private int rcount;
	private String str_star;
	
	public String getStr_star() {
		return str_star;
	}
	public void setStr_star(String str_star) {
		this.str_star = str_star;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public String getRank_css() {
		return rank_css;
	}
	public void setRank_css(String rank_css) {
		this.rank_css = rank_css;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	private String director;
	private String cast;
	
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMname_e() {
		return mname_e;
	}
	public void setMname_e(String mname_e) {
		this.mname_e = mname_e;
	}
	public Date getRday() {
		return rday;
	}
	public void setRday(Date rday) {
		this.rday = rday;
	}
	public int getRtime() {
		return rtime;
	}
	public void setRtime(int rtime) {
		this.rtime = rtime;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}

	
	
}
