package com.lec.ex01_If;

public class IfMain {

	public static void main(String[] args) {
		int score = 80;
		
		// 1. 단순 if
		if(score>=90) {
			System.out.println("점수가 90보다 크거나 같습니다!");
			System.out.println("A학점입니다!!");
		}
		System.out.println();
				
		// 2. if ~ else
		if(score>=90) {
			System.out.println("점수가 90보다 크거나 같습니다!");
			System.out.println("A학점입니다!!");
		} else {
			System.out.println("점수가 90보다 작습니다!");
			System.out.println("B학점입니다!!");
		}
		System.out.println();
		
		// 3. if ~ else if ~ else
		// 점수에 따라서 A~F학점까지 출력할 경우
		if(score>=90) {
			System.out.println("점수가 90보다 크거나 같습니다!");
			System.out.println("A학점입니다!!");
		} else if(score>=80){
			System.out.println("점수가 80보다 크거나 같습니다!");
			System.out.println("B학점입니다!!");
		} else if(score>=70) {
			System.out.println("점수가 70보다 크거나 같습니다!");
			System.out.println("C학점입니다!!");
		} else if(score>=60) {
			System.out.println("점수가 60보다 크거나 같습니다!");
			System.out.println("D학점입니다!!");			
		} else {
			System.out.println("점수가 60보다 작습니다!");
			System.out.println("F학점입니다!!");		
		}
		System.out.println();

	}

}
