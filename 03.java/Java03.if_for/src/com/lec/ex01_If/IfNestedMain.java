package com.lec.ex01_If;

public class IfNestedMain {

	public static void main(String[] args) {
		// 난수를 81~100사이의 난수를 발생시키기
		System.out.println(Math.random()); // 0<= x < 1사이의 double타입의 숫자 한개를 리턴
		// 0.01834042130082525 * 20  + 81
		System.out.println((int)(Math.random()*20) + 81); // 81~100까지의 값을 리턴
		
		int score = (int)(Math.random()*20) + 81;
		// 중첩if
		// 1. >=90 : >=95 -> 'A+' else 'A0'
		// 2. >=80 : >=85 -> 'B+' else 'B0'
		if(score>=90) {
			if(score>=95) {
				System.out.println("A+ 학점입니다!");
			} else {
				System.out.println("A0 학점입니다.");
			}
		} else {
			if(score>=80) {
				System.out.println("B+ 학점입니다!");
			} else {
				System.out.println("B0 학점입니다!");
			}
		}
	}

}
