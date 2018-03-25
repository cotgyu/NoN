package com.Edu.Domain;


import org.apache.ibatis.type.Alias;

import lombok.Data;


@Alias("Course")
public @Data class Course {
	
	
	private int cosno;	
	private String cosname;
	private String cosintro;
	private String cosintrovideo;
	private String coscategory;
	private String cosregtime;
	private String cospicture;
	private int coseval;

	public Course() {}
	
	public int getCosno() {
		return cosno;
	}
	public void setCosno(int cosno) {
		this.cosno = cosno;
	}
	public String getCosname() {
		return cosname;
	}
	public void setCosname(String cosname) {
		this.cosname = cosname;
	}
	public String getCosintro() {
		return cosintro;
	}
	public void setCosintro(String cosintro) {
		this.cosintro = cosintro;
	}
	public String getCosintrovideo() {
		return cosintrovideo;
	}
	public void setCosintrovideo(String cosintrovideo) {
		this.cosintrovideo = cosintrovideo;
	}
	public String getCoscategory() {
		return coscategory;
	}
	public void setCoscategory(String coscategory) {
		this.coscategory = coscategory;
	}
	public String getCosregtime() {
		return cosregtime;
	}
	public void setCosregtime(String cosregtime) {
		this.cosregtime = cosregtime;
	}
	public String getCospicture() {
		return cospicture;
	}
	public void setCospicture(String cospicture) {
		this.cospicture = cospicture;
	}
	public int getCoseval() {
		return coseval;
	}
	public void setCoseval(int coseval) {
		this.coseval = coseval;
	}

	@Override
	public String toString() {
		return "Course [cosno=" + cosno + ", cosname=" + cosname + ", cosintro=" + cosintro + ", cosintrovideo="
				+ cosintrovideo + ", coscategory=" + coscategory + ", cosregtime=" + cosregtime + ", cospicture="
				+ cospicture + ", coseval=" + coseval + "]";
	}
	
	
}
