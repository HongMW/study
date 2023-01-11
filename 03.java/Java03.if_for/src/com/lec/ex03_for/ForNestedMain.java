package com.lec.ex03_for;

public class ForNestedMain {

	public static void main(String[] args) {
		
		// 구구단
		for(int dan=2;dan<=9;dan++) {
			System.out.println("---< " + dan + "단 >---");
			for(int i=1; i<=9;i++) {
				System.out.println(dan + " X " + i + " = " + (dan * i));
			}
			System.out.println();
		}
		
		System.out.printf("%d x %d = %2d\n",2,2,4);
		System.out.printf("%d x %d = %2d\n",2,9,18);
		// 실습. 구구단
		// 2 x 1 = 2 ... 9 x 1 = 9
		// ...
		// 2 x 9 = 18 ... 9 x 9 = 81
		
		for(int d=2;d<=9;d++) {
			for(int i=1; i<=1;i++) {
				System.out.print(d + " X " + i + " = " + (d * i) + "  ");
			}
		}
		System.out.println();
		for(int d=2;d<=9;d++) {
			for(int i=1; i<=9;i++) {
				System.out.print(d + " X " + i + " = " + (d * i) + "  ");
			}
		}
		
		System.out.println("------------------------------------------------------------------------------------------------------------");
		System.out.println("------------------------------------------------------------------------------------------------------------");
		// 강사님
		
		String gugudan;
		
		for(int i=1;i<=9;i++) {
			gugudan = "";
			for(int dan=2;dan<=9;dan++) {
				gugudan += dan + " x " + i + " = " + (dan * i) + " ";
//				System.out.printf(dan + " x " + i + " = " + (dan * i));
			}
			System.out.println(gugudan);
		}
	}

}
