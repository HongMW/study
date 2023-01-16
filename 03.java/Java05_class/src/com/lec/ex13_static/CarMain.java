package com.lec.ex13_static;

/*
	정적멤버와 정적블럭 사용시에 주의할 점
	
	정적메서드와 정적블럭을 선언할 때 주의할 점은 객체가 생성되지 않아도 
	즉, 객체가 없어도 실행된다는 특징때문에 정적메서드와 정적블럭 내부에
	인스턴스(객체)필드나 인스턴스(객체)메서드를 사용할 수 없다. 또한 this
	키워드도 사용할 수 없다.
	
	정적메서드와 정적블럭에서 객체멤버를 사용하고 싶다면 먼저 객체를 생성
	하고 참조변수로 접근해야 한다.
	
	또한, main메서드로 정적메서드이기 때문에 동일한 규칙이 적용된다. 이런
	이유로 main메서드가 객체생성없이 객체멤버필드와 메서드를 바로 사용할
	수 없다.
	
*/
public class CarMain {

	int speed;
	void run() {
		System.out.println("현재 자동차의 속도는 " + speed + "km/h 입니다!");
	}
	
	public static void main(String[] args) {
		
		// speed와 run()메서드를 접근할 수 있다? 없다?
		// speed와 run()는 객체멤버이기 때문에 정적멤버인 main에서 접근할 수 없다.
		// 접근하려면 speed와 run()을 정적멤버 즉 static으로 선언해야 한다.
		// speed = 100;
		// run();
		
		CarMain car = new CarMain();
		car.speed = 100;
		car.run();
		
		xxx();
	}

	private static void xxx() {
		// TODO Auto-generated method stub
		
	}
}

