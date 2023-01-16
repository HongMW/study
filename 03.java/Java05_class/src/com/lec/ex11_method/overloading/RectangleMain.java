package com.lec.ex11_method.overloading;

public class RectangleMain {

	public static void main(String[] args) {
		
		Rectangle rec = new Rectangle();
		System.out.println("정사각형의 넓이 = " + rec.areaRectangle(10));
		System.out.println("직사각형의 넓이 = " + rec.areaRectangle(10, 20));		
	}

}

// 실습. 정사각형의 넓이, 직사각형의 넓이를 구하는 메서드 작성하기
// areaRectangle(10), areaRectangle(10,20)
class Rectangle {

	public int areaRectangle(int i) {
		return i*i;
	}
	public int areaRectangle(int i, int j) {
		return i*j;
	}


	
	
	int areaRectangle(int...arr) {
		int sum = 1;
		for(int i:arr) {
			if(arr.length == 1) {
				sum = i;
			}
			sum = sum * i;
		}
		return sum;
	}
	
}