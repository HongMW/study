package com.lec.ex11_method.declare;
/*
	메서드(method)
	
	메서드는 객체의 동작에 해당하는 중괄호{}블럭이다. 이 중괄호는 이름을 가지고 있는데
	이 것이 메서드 이름이다. 메서드를 호출하게 되면 중괄호블럭안에 있는 실행문들이 일괄
	적으로 실행된다.
	
	메서드는 1) 필드를 읽거나 수정 2) 다른 객체를 생성해서 다양한 기능을 수행한다. 메서드는
	객체간의 데이터를 전달하는 수단으로도 사용된다. 메서드는 외부에서 매개값을 받을 수 있고
	실행한 후에 실행결과를 반환할 수 있다.
	
	1. 메서드선언
	
	   메서드의 선언은 선언부와 실행부로 구성된다. 선언부에는 접근제한자, static, 리턴타입,
	   메서드이름과 매개변수등을 선언하고 이 선어부를 메서드시니처(method signature)라고도
	   한다. 메서드의 실행부는 중괄호{}블럭을 의미한다.
	   
	2. 리턴타입
	
	   리턴타입은 메서드가 실행한 결과를 리턴할 때 그 값의 데이터타입을 의미한다. 메서드는
	   리턴값이 있을 수도, 없을 수도 있다. 리턴값이 없을 경우에는 "리턴타입을 void"로 선언
	   하고 있을 경우에는 반환되는 값의 데이터타입(기본타입 및 참조타입)을 정의한다.
	
	3. 메서드의 명명규칙
	
	   1) 숫자로 시작불가
	   2) $, _를 제외한 특수문자는 사용불가
	   3) 관례로 메서드이름은 소문자로 시작
	   4) Camel Case를 준수
*/
public class CalculatorMain {

	public static void main(String[] args) {
		
		// 실습. 4칙연산을 하는 계산기(Calculator)를 작성해 보세요!
		// add(), sub(), mul(), div()
		Calculator cal = new Calculator();
		
		// 1. 리턴이 없음
		cal.powerOn();
		
		// 2. 기본타입리턴
		int result1 = cal.add(10,10);
		int result2 = cal.sub(10,10);
		int result3 = cal.mul(10,10);
		double result4 = cal.div(10,10);
		System.out.println("add = " + result1);
		System.out.println("sub = " + result2);
		System.out.println("mul = " + result3);
		System.out.println("div = " + result4);
		cal.powerOff();
		System.out.println();
		
		// 3. 참조타입 리턴
		String result5 = cal.xxx();
		System.out.println(result5);
		System.out.println(cal.xxx());
		System.out.println();
		
		Calculator result6 = cal.yyy();
		int i1 = result6.add(1000, 10000);
		System.out.println("add = " + i1);
		
	}
}


class Calculator {
	
	void powerOn() { System.out.println("계산기전원온!!"); }
	int add(int x, int y) { 
		int result = x + y;
		return result; 
	}
	int sub(int x, int y) { return x-y; }
	int mul(int x, int y) { return x*y; }
	double div(int x, int y) { return x/y; }
	void powerOff() { System.out.println("계산기전원오프!!");}
	
	// 참조타입리턴
	String xxx() { return "참조타입을 리턴했습니다!!!";}
	
	Calculator yyy() {
		
		// Calculator 계산기 = new Calculator();	
		// return 계산기;
		return new Calculator();
	}
}
