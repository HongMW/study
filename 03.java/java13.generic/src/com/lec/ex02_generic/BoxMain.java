package com.lec.ex02_generic;

public class BoxMain {

	public static void main(String[] args) {
		
		// 제네릭은 컴파일단계에서부터 에러 발생을 미연에 방지하기
		// 위해서 객체저장시에 특정객체만 제한하도록 하는 방법이다.
		Box<Apple> 과일상자 = new Box();
		과일상자.setObject(new Apple());
		Apple 사과 = 과일상자.getObject();
		System.out.println(사과);
		System.out.println(사과.getClass());
		
		Box<Hammer> 도구상자 = new Box();
		도구상자.setObject(new Hammer());
		Hammer 망치 = 도구상자.getObject();
		System.out.println(망치);
		System.out.println(망치.getClass());
		
		// 과일상자.setObject(new Hammer());
		// 도구상자.setObject(new Apple());
		
		// 주의사항
		// 좌변에만 제네릭을 정의하면 사전에 에러를 방지하지만
		// 우변에 제네릭을 정의하면 non generic과 동일하다.
		// 즉, 우변에만 제네릭을 정의할 경우에는 컴파일에러는
		// 발생하지 않고 런타임시에 예외가 발생한다.
		Box toolBox = new Box<Apple>();
		toolBox.setObject(new Apple());
		Apple xxx = (Apple) toolBox.getObject();
		
		Box<String> yyy = new Box();
		Box<int[]> zzz = new Box();
	}

}

class Box<T> { // <T> 임의의 참조타입
	
	private T t;
	
	public T getObject() {
		return t;
	}
	
	public void setObject(T t) {
		this.t = t;
	}
	
}

class Apple {
	
	@Override
	public String toString() {
		
		return "나는 사과입니다!";
	}
}

class Hammer {
	@Override
	public String toString() {
		return "나는 망치입니다!";
	}
}