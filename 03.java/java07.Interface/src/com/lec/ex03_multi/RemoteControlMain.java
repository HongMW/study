package com.lec.ex03_multi;

import com.lec.ex02_implements.RemoteControl;

public class RemoteControlMain {

	public static void main(String[] args) {
		
		// 1. 자식객체 -> 부모객체러 형변환 RemoteControl에는 search가 없음
		RemoteControl rc = new SmartTelevision();
		rc.powerOn();
		rc.setVolume(5);
		rc.setMute(true);
		// rc.search(); // 
		System.out.println();
		
		// 2. 자식객체 -> 부모 : Seachable에는 search메서드만 존재, 나머지메서드는 호출불가
		SmartTelevision stv = new SmartTelevision();
		Searchable rc2 = stv;
		// rc2.powerOn();
		// rc2.setVolume(5);
		// rc2.setMute(true);
		rc2.search("www.google.com");
		
	}

}
