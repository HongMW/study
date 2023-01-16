package com.lec.ex11_method.declare;

public class ComputerMain {

	public static void main(String[] args) {
		
		Computer com1 = new Computer();
		
		// 1. 일반매개변수이용
		int result = com1.add(1,2,3,4,5,6,7,8,9,10);
		System.out.println("1~10까지 합 = " + result);
				
		result = com1.add(1, 2, 3, 4, 5);
		System.out.println("1~5까지 합 = " + result);
		System.out.println();
				
		// 2. 배열이용
		int[] arr1 = {1,2,3,4,5,6,7,8,9,10};
		result = com1.add(arr1);
		System.out.println("1~10까지 합 = " + result);
				
		result = com1.add(new int[] {1,2,3,4,5});
		System.out.println("1~5까지 합 = " + result);
		System.out.println();
				
		// 3. 유동적인 매개변수이용
		System.out.println("유동적인 매개변수 합 = " + com1.add1(1,2,3));
		System.out.println("유동적인 매개변수 합 = " + com1.add1(1,2,3,4,5));
		System.out.println("유동적인 매개변수 합 = " + com1.add1(1,2,3,4,5,6,7,8,9,10));
		
	}

}

class Computer {

	public int add(int i, int j, int k, int l, int m, int n, int o, int p, int q, int r) {
		return i+j+k+l+m+n+o+p+q+r;
	}

	public int add(int i, int j, int k, int l, int m) {
		return i+j+k+l+m;
	}
	
	public int add(int[] arr1) {
		int sum = 0;
		for(int i:arr1) {
			sum += i;
		}
		return sum;
	}
	
	// 유동적인 매개변수 정의하기
	int add1(int...arr1) {
		int sum = 0;
		for(int i:arr1) {
			sum += i;
		}
		return sum;
	}
}

	