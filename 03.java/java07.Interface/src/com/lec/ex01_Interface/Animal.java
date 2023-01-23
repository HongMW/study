package com.lec.ex01_Interface;

public abstract interface Animal {

	// public static final String KIND = "동물"; 
	// 생략해도 자동으로 컴파일과정에서 추가된다. public static final 생략해도 컴파일 과정에서 자동으로 추가됨
	String KIND = "동물";
	
	public abstract void sound(); 
	// public abstract을 생략해도 자동으로 추가된다.
	void move();
	
	//interface의 메서드는 모두 추상메서드이기 때문에
	// 실행블럭을 가질 수 없다
	// void breath() { System.out.println("숨을 쉰다!!"); }
}
