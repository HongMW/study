package com.lec.ex12_instance;

/*
	클래스멤버(static 멤버) vs 인스턴스멤버(객체멤버)
	
	1. 클래스멤버   : 클래스관점(클래스에 소속된)에서 정의된 필드, 생성자, 메서드(static으로 정의된 필드, 메서드)
	2. 인스턴스멤버 : 객체관점(객체에에 소속된)에서 정의된 필드, 메서드
	
	클래스멤버는 객체에 소속된 멤버가 아니기 때문에 객체가 생성되지 않아도 사용할 수 있지만
	인스턴스멤버는 반드시 객체가 생성된 후에 사용할 수 있다.
	
	클래스멤버의 접근은 "클래스명.정적멤버"로 접근하고 객체멤버는 "객체명.객체멤버"의 형태로
	접근한다.
*/
public class CarMain {

	public static void main(String[] args) {
		
		System.out.println("정적멤버 : company = " + Car.company);
		Car.method1();
		System.out.println();
		
		Car myCar = new Car();
		myCar.model = "마이바흐";
		System.out.println("객체에서 정적멤버 접근 : company = " + myCar.company);
		myCar.method1();
		System.out.println("객체멤버 접근 : model = " + myCar.model);
		myCar.method2();
		System.out.println();
		
		Car yourCar = new Car();
		System.out.println("객체멤버 접근 : model = " + yourCar.model);
		yourCar.method2();
		System.out.println();
		
		myCar.company = "현대자동차";
		System.out.println("Car.comany = " + Car.company);
		System.out.println("myCar.comany = " + myCar.company);
		System.out.println("yourCar.comany = " + yourCar.company);
	}

}

class Car {
	
	static String company = "벤츠";  // 정적멤버
	String model;                    // 객체멤버
	int speed;                       // 객체멤버
	
	@Override
	public String toString() {
		return "Car [company = " + company + ", model=" + model + ", speed=" + speed + "]";
	}
	
	static void method1() {
		System.out.println("정적멤버 method1가 호출되었습니다!");
	}
	
	void method2() {
		System.out.println("객체멤버 method2가 호출되었습니다!");
	}
}
