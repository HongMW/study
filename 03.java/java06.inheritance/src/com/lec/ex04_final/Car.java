package com.lec.ex04_final;

public class Car {

	public int speed;
	public void speedUp() { speed += 1; }
	public final void stop() { speed = 0; } // 자식객체에서 재정의 불가능한 메서드로 정의
}

class SuperCar extends Car {

	@Override
	public void speedUp() {	speed += 10; }

//	@Override
//	public void stop() {}
//	final로 정의된 부모 메서드는 자식객체에서 재정의할 수 없디.
	
	
}