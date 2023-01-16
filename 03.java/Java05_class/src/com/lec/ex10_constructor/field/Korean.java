package com.lec.ex10_constructor.field;

public class Korean {

	// 1. 필드
	String nation = "대한민국";
	String name;
	String ssn;
	int age;
	int result;
	
	
	// 2. 생성자
	public Korean(String name, String ssn) {
		this.name = name;
		this.ssn = ssn;
		this.age = 1;
		this.add(10, 10);
	}
	
	// 3. 메서드
	int add(int x, int y) {
		this.result = x + y;
		return x+y;
	}

	@Override
	public String toString() {
		return this.name + ", " + this.ssn;
	}
	
	
}
