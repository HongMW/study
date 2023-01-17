package com.lec.ex10_abstract.method;

public abstract class Animal {

	public String kind;
	
	void breath() {System.out.println("숨을 쉰다!!");}
	// void sound() {System.out.println("소리를 낸다!!");}
	abstract void sound();
	abstract void move();
}
