package com.lec.ex04_throws;

/*
	예외 떠넘기기(throws)
	
	메서드 내부에서 예외가 발생할 경우 코딩을 할 때 try~catch로 예외처리를 하는 것이
	기본이지만 경우에 따라서 메서드를 호출한 곳으로 예외를 떠넘길 수가 있다. 이때 사용
	하는 명령이 throws, thorw이다. thorws명령은 메서드 선언부에 작성되어 메서드를 처리
	하지 않는 예외를 호출한 곳으로 떠넘기는 역할을 한다.
	
	thorows명령은 떠넘길 예외클래스를 콤마(,)로 구분해서 나열해 주면 된다. thorows키워
	드가 붙어 있는 메서드는 만즈시 try블럭내에서 호출되어야 한다. 그리고 catch블럭에서
	떠넘겨 받은 예외를 처리해야 한다.
*/
public class ThrowsMain {

	public static void main(String[] args) throws Exception {
		
		// Class _class = Class.forName("java.lang.Stringxxx");
		// String data = args[0];
		// int val = Integer.parseInt(data);

		method();
	}

	private static void method() throws ClassNotFoundException {
		Class _class = Class.forName("java.lang.Stringxxx");
	}

	void method1() {
		try {
			method();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}















