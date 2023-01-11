package com.lec.ex04_while;

import java.io.IOException;
import java.util.Scanner;

public class DoWhileMain {

	public static void main(String[] args) throws IOException {
		// 키보드로 부터 문자열을 입력받는 방법중에 System.in.read()는
		// 한개의 키코드만 읽기 때문에 콜솔에 입력된 문자열을 한꺼번에
		// 읽을 수가 없다.
//		System.out.print("키보드를 입력하세요 ==> ");
//		System.out.println(System.in.read());

		// 콘솔에 입력된 문자열을 한꺼번에 읽기 위해서는 Scanner라는 객체를
		// 생성하고 nextLine()메서드를 호출하면 콘솔에 입력된 문자열을 한 번에
		// 읽을 수가 있다.
		
		System.out.println("이름을 입력하세요!!!");
		System.out.println("프로그랩을 중단하려변 q를 입력하세요!!");
		
		
		
		Scanner scanner = new Scanner(System.in);
		String name = null;
		
		do {
			System.out.println(" ==> " );
			name = scanner.nextLine();
			System.out.println("입력된 이름 = " + name);
		} while(!name.contentEquals("q"));
		System.out.println();
		System.out.println("프로그램종료!!");
		
		// while(조건식) {증가식} 먼저 조건식을 줘서 실행문이 실행되지 않을 수도 있다
		// do {} while(조건식) do while은 1번은 실행될 수 있다.(무한루프 걸릴 수 있어서 종료되는 조건을 정해준다)
	}

}
