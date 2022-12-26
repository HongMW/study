package com.lec.basic.poly1;

public class SamsungTV implements TV{
	
	// 초기화메서드
	public void initMethod() { System.out.println("==> 초기화메서드호출(초기화작업)"); }
	
	public SamsungTV() { System.out.println("==> SamsungTV() 생성자호출!!");}
	public void powerOn() { System.out.println("Samsung TV - pwerOn!!");}
	public void powerOff() { System.out.println("Samsung TV - pwerOff!!");}
	public void volumnUp() { System.out.println("Samsung TV - volumnup!!");}
	public void volumnDown() { System.out.println("Samsung TV - volumndown!!");}
}
