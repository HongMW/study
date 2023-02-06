package com.lec.ex03_return;

public class FunctionalInterfaceMain {

	public static void main(String[] args) {
		
		FuncInterface fi1 = null;
		
		fi1 = (a, b) -> { return a + b; };
		int result = fi1.mehod(10, 10);
		System.out.println("10 + 10 = " + result);
		System.out.println("20 + 20 = " + fi1.mehod(20, 20));
		System.out.println();
		
		
		fi1 = (x, y) -> x * y;
		result = fi1.mehod(10, 10);
		System.out.println("10 * 10 = " + result);
		System.out.println("20 * 20 = " + fi1.mehod(20, 20));
		System.out.println();
		
		// 람다식에 메서드 정의하기
		fi1 = (x, y) -> x / y;
		result = fi1.mehod(10, 10);
		System.out.println("10 / 10 = " + result);
		System.out.println("20 / 20 = " + fi1.mehod(20, 20));
		
		fi1 = (x, y) -> (int) div(x, y);
		result = fi1.mehod(10, 0);
		System.out.println("10 / 0 = " + result);
		
		result = fi1.mehod(10, 3);
		System.out.println("10 / 3 = " + result);
	}
	
	private static double div(int x, int y) {
		if(y==0) {
			System.out.println("0으로 나눌 수가 없습니다!!");
			return 0.0;
		} else {
			double result = x / y;
			return result;
		}
	}

}

@FunctionalInterface
interface FuncInterface {
	int mehod(int x, int y);
}