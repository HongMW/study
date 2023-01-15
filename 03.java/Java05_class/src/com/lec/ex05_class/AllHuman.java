package com.lec.ex05_class;

public class AllHuman {

	public static void main(String[] args) {
		
		America usa = new America();
		usa.name = "에스더";
		usa.gender = "여자";
		usa.age = 28;
		usa.lang = "영어";
		usa.speak();
		System.out.println("이름은  "+ usa.name + ", 언어는 " + usa.lang);
		
		Chinese chin = new Chinese();
		chin.name = "뮬란";
		chin.gender = "여자";
		chin.age = 600;
		chin.lang = "중국어";
		chin.speak();
		System.out.println("이름은  "+ chin.name + ", 언어는 " + chin.lang);
		
		Korea kor = new Korea();
		kor.name = "홍길동";
		kor.gender = "남자";
		kor.age = 1000;
		kor.lang = "한국어";
		kor.speak();
		kor.move();
		System.out.println(kor.toString());
		System.out.println("이름은 "+ kor.name + ", 언어는 " + kor.lang);
	}

}
