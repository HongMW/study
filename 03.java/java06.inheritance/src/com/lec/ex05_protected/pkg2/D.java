package com.lec.ex05_protected.pkg2;

import com.lec.ex05_protected.pkg1.A;

public class D extends A {

	public D () {
		// A a = new A();	// protected (x), 직접접근불가
		super();			// 상속관계일경우 부모생성자 접근가능
		this.field1 = "";
		// this.field2 = "";	//private (x)
		this.method_a();		// 상속관계일 경우 부모메서드 접근가능
	}
}
