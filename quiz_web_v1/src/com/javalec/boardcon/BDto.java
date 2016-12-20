package com.javalec.boardcon;

public class BDto {
	int f_board_number;
	String f_board_subject;
	String f_board_contents;
	String f_board_id;
	int f_board_count;
	String f_board_firstdate;
	String f_board_date;
	int f_board_good;
	int f_board_bad;
	int f_board_pos;
	int f_board_depth;
	
	
	public BDto() {}

	public BDto(int f_board_number, String f_board_subject, String f_board_contents, String f_board_id,
			int f_board_count, String f_board_firstdate, String f_board_date, int f_board_good, int f_board_bad, int f_board_pos,
			int f_board_depth) {
		
		this.f_board_number = f_board_number;
		this.f_board_subject = f_board_subject;
		this.f_board_contents = f_board_contents;
		this.f_board_id = f_board_id;
		this.f_board_count = f_board_count;
		this.f_board_date = f_board_firstdate;
		this.f_board_date = f_board_date;
		this.f_board_good = f_board_good;
		this.f_board_bad = f_board_bad;
		this.f_board_pos = f_board_pos;
		this.f_board_depth = f_board_depth;
	}

	public int getF_board_number() {
		return f_board_number;
	}

	public void setF_board_number(int f_board_number) {
		this.f_board_number = f_board_number;
	}

	public String getF_board_subject() {
		return f_board_subject;
	}

	public void setF_board_subject(String f_board_subject) {
		this.f_board_subject = f_board_subject;
	}

	public String getF_board_contents() {
		return f_board_contents;
	}

	public void setF_board_contents(String f_board_contents) {
		this.f_board_contents = f_board_contents;
	}

	public String getF_board_id() {
		return f_board_id;
	}

	public void setF_board_id(String f_board_id) {
		this.f_board_id = f_board_id;
	}

	public int getF_board_count() {
		return f_board_count;
	}

	public void setF_board_count(int f_board_count) {
		this.f_board_count = f_board_count;
	}

	public String getF_board_firstdate() {
		return f_board_firstdate;
	}

	public void setF_board_firstdate(String f_board_firstdate) {
		this.f_board_firstdate = f_board_firstdate;
	}

	public String getF_board_date() {
		return f_board_date;
	}

	public void setF_board_date(String f_board_date) {
		this.f_board_date = f_board_date;
	}

	public int getF_board_good() {
		return f_board_good;
	}

	public void setF_board_good(int f_board_good) {
		this.f_board_good = f_board_good;
	}

	public int getF_board_bad() {
		return f_board_bad;
	}

	public void setF_board_bad(int f_board_bad) {
		this.f_board_bad = f_board_bad;
	}

	public int getF_board_pos() {
		return f_board_pos;
	}

	public void setF_board_pos(int f_board_pos) {
		this.f_board_pos = f_board_pos;
	}

	public int getF_board_depth() {
		return f_board_depth;
	}

	public void setF_board_depth(int f_board_depth) {
		this.f_board_depth = f_board_depth;
	}
	
	
	
}