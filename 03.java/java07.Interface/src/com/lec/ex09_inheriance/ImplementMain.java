package com.lec.ex09_inheriance;

public class ImplementMain {

	public static void main(String[] args) {
		
		ImplementC im = new ImplementC();
		im.methodA();
		im.methodB();
		im.methodC();
		System.out.println();
		
		// 1. im -> InterfaceA
		InterfaceA ia = im;
		ia.methodA();
//		ia.methodB();
//		ia.methodC();
		System.out.println();
		
		
		// 2. im -> InterfaceB
		InterfaceB ib = im;
//		ib.methodA();
		ib.methodB();
//		ib.methodC();
		System.out.println();
		
		// 3. im -> InterfaceC
		InterfaceC ic = im;
		ic.methodA();
		ic.methodB();
		ic.methodC();
	}

}
