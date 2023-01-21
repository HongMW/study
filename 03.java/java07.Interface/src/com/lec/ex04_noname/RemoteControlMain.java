package com.lec.ex04_noname;

import com.lec.ex02_implements.RemoteControl;

public class RemoteControlMain {

	public static void main(String[] args) {
		
		// 1. 인터페이스 객체를 생성할 수 없다,
		//RemoteControl tv = new RemoteControl();
		
		// 2. 익명구현객체
		RemoteControl tv = new RemoteControl() {
			public void powerOn() {	System.out.println("파워온!!");}
			public void powerOff() { System.out.println("파워오프!!");}
			public void setVolume(int num) {System.out.println("볼륨 = " + num); }
		};
		tv.powerOn();
		tv.setVolume(5);
		tv.powerOff();
		RemoteControl.changeBattery();
		System.out.println();
		
		RemoteControl audio = new RemoteControl() {
			public void setVolume(int num) {/*실행블럭*/}
			public void powerOn() {/*실행블럭*/}
			public void powerOff() {/*실행블럭*/}	
		};
		
		RemoteControl radio = new RemoteControl() {
			public void setVolume(int num) {search();}
			public void powerOn() {/*실행블럭*/}
			public void powerOff() {/*실행블럭*/}
			void search() {/* 내부에서만 사용가능한 메서드 즉, 외부로 호출불가*/}
			
		};
		// Radio.saerch 호출불가
	}

}
