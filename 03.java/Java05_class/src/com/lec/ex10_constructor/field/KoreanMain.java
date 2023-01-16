package com.lec.ex10_constructor.field;

public class KoreanMain {

	public static void main(String[] args) {
		
		Korean hong = new Korean("홍길동", "20221123-1234567");
		System.out.println(hong.toString());
		System.out.println(hong.age);
		System.out.println(hong.result);
		System.out.println(hong.add(1000, 1000));
		System.out.println(hong.result);
	}

}
