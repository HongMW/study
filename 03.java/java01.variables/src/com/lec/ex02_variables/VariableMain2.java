package com.lec.ex02_variables;

public class VariableMain2 {

	public static void main(String[] args) {
		// 1. 뱐수의 선언
		int val1 = 10;
		int val2 = 20;
		
		// 2. 변수의 동시선언
		int a = 0, b, c;
		int x=10, y=20, z=30;
		System.out.println("a=" + a);
		System.out.println("x = " + x + ", y = " + y + ", z = " + z);
		System.out.println();
		
		// 3. 변수선언과 변수타입(기본타입, premetive type)
		//    1) 정수 : byte(1), short(2), char(2), int(4), long(8)
		
		// a. byte
		byte b1;	// -128~127
		byte b2;
		b1 = -128;
		b2 = 127;
		System.out.println("b1 = " + b1 + ", b2 = " + b2);
		
		// b1 = -129;	// 에러 : 표현할 수 있는 값의 범위를 초과
		//b2 = 128;	// 에러 : 표현할 수 있는 값의 범위를 초과
		b1 = (byte) -21231; // 강제형변환
		System.out.println("b1 = " + b1);
		System.out.println("---------------------------------");
		
		// b. char	: 한 개의 문자(내부적으로는 유니코드값(UTF-8문자셋의 코드정수값))으로 저장
		//			: 작은 따옴펴로 선언
		char chr1 = 'A';	// A는 내부적으로 65라는 정수값으로 저장
		System.out.println("chr1 = " + chr1);
		
		char chr2 = 66 + 1;	// A ~ Z : 65~90
		System.out.println("chr2 = " + chr2);
		
		char chr3 = 97;	// a ~ z : 97~122
		System.out.println("chr3 = " + chr3);
		
		char chr4 = 48;	// 0 ~ 9 : 48~57
		System.out.println("chr4 = " + chr4);
		
		char chr5 = 44033; // 가~핳 : 48~57
		System.out.println("chr5= " + chr5);
		
		// c. int
		int int1 = '핳';
		System.out.println("int1 = " + int1);
		int1 = 'z';
		System.out.println("int1 = " + int1);
		
		int1 = -2147483648;
		int1 = 2147483647;
		//int1 = -2147483649; // 범위에러
		//int1 = 2147483648;
		
		// d. long
		// long lng1 = -2147483649; // 에러 : Java에서 숫자의 기본데이터타입은 int
		
		long lng1 = -2147483649l;	// 정수 숫자를 long으로 선언하기 위해서는 l or L로 정의
		long lng2 = 2147483648L;
		
		// e. short
		short short1; // -2의 15승 ~ 2의 15승 -1의 범위값을 저장할 수 있다.
		System.out.println("--------------------------");
		//    2) 실수 : float(4), double(8)
		//       Java에서는 정수타입의 기본형이 int타입이지만 실수타입의 기본형은 double타입이다.
		//       float로 선언할 경우는 명시적으로 float임을 선언하거나 데이터타입변경(형변환)을 해야 한다.
		// a. float
		float f1 = 3.14f; // f or F는 명시적으로 실수타입의 값을 float타입으로 선언
		float f2 = 3.141592F;
		System.out.println("f1 = " + f1 + ", f2 = " + f2);
		
		double d1 = 3.14;
		double d2 = 3.141592;
		double d3 = 3.14d;
		double d4 = 3.141592D;
		// float f3 = 3.141592D; // 에러 : 강제형변환을 하던지 타입을 변경해야 한다.
		System.out.println("--------------------------");		
		
		//    3) 논리 : boolean(1), true와 false, 내부적으로는 true=1, false=0의 값을 가지고 있다.
		boolean bool1 = true;
		boolean bool2 = false;
		// boolean bool3 = 1;
		// boolean bool4 = 0;
			}

		}