package com.lec.ex01_Interface;

public class Dog implements Animal {

	@Override
	public void sound() {
		System.out.println("멍멍 소리를 낸다!!");
	}

	@Override
	public void move() {
		System.out.println("성큼성큼 움직인다!!");
		
	}

}
