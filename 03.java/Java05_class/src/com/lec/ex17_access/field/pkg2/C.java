package com.lec.ex17_access.field.pkg2;

import com.lec.ex17_access.field.pkg1.A;

public class C {
	
	public C() {
	A a = new A();
	
	//필드
	a.field1 = 10;		// public
	// a.field2 = 10;	// default (x)
	// a.field3 = 10;	// private (x)
	
	//메서드
	a.method1();
	//a.method2();	// default (x)
	// a.method3();	// private (x)
}
}


