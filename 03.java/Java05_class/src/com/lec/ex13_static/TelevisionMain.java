package com.lec.ex13_static;

/*
	정적블럭(초기화블럭)
	
	정적초기화블럭은 클래스가 메모리에 로딩될 때 자동으로 실행되는 블럭이다.
	정적블럭은 클래스내부에 여러개 선언도 가능하다.
	
	정적블럭은 클래스가 메모리(메서드)영역에 로딩될 때 선언된 순서로 실행이 된다.
*/
public class TelevisionMain {

	public static void main(String[] args) {
		System.out.println(Television.company);
		System.out.println(Television.info);
	}
}

class Television {
	
	static String company = "LG전자";
	static String model = "OLED";
	static String info;  // LG전자-OLED
	int year;
	
	static {
		info = company + "-" + model;
	}
	static {
		// 정적블럭에서 객체멤버인 객체필드에는 접근 불가
		// year = 2022;// 에러
	}
	static {
		System.out.println("1st static block");
	}
	static {
		System.out.println("2nd static block");
	}
	static {
		System.out.println("3rd static block");
	}
	
}
