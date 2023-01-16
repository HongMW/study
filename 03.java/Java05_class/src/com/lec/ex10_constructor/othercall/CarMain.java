package com.lec.ex10_constructor.othercall;

public class CarMain {

	public static void main(String[] args) {
		
		// this() -기본생성자
		Car car1 = new Car();
		Car car2 = new Car("911카레라");
		Car car3 = new Car("911카레라", "분홍");
		Car car4 = new Car("911카레라", "분홍", 300);
	}

}
