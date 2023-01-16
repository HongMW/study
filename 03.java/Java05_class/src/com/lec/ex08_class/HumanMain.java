package com.lec.ex08_class;

public class HumanMain {

	public static void main(String[] args) {
		
		//인터페이스(interface)
		Korean kor = new Korean();
		kor.speak("한글");
		//kor.nation = "대한민국"; // 에러
		kor.move();
		kor.think();
		System.out.println();
		
		
		American usa = new American();
		usa.speak("영어");
		usa.move(); 
		usa.think();
	}

}
