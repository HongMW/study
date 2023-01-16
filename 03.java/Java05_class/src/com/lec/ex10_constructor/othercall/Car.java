package com.lec.ex10_constructor.othercall;

public class Car {

	// 1. 필드
	String company = "포르쉐";
	String model;
	String color;
	int maxSpeed;
	
	// 2. 생성지
	// this는 객체 자기자신을 가리키는 예약어
	// 생성자에서 다른생성자를 호출할 경우 this()
	// 시그니처에 맞는 생성자를 호출
	
	Car() {
		this(null, null, 0);
	}
	Car(String model) {
		this(model, null, 0);
	}
	Car(String model, String color) {
		this(model, color, 0);
	}
	Car(String model, String color, int maxSpeed) {
		this.model = model;
		this.color = color;
		this.maxSpeed = maxSpeed;
	}
	
	@Override
	public String toString() {
		return "Car [company=" + company + ", model=" + model + ", color=" + color + ", maxSpeed=" + maxSpeed
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
