package com.lec.ex06_class;

public class HumanMain {

	public static void main(String[] args) {
		// 상속(2)
		Adam adam = new Adam();
		adam.name = "아담";
		adam.speak();
		adam.move();
		System.out.println(adam.toString());
		System.out.println();
		
		Eve eve = new Eve();
		eve.name = "이브";
		eve.speak();
		eve.move();
		System.out.println(eve.toString());
		System.out.println();	
				
	}

}