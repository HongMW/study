package com.lec.basic.poly3;

public class SonnySpeaker implements Speaker {

	public SonnySpeaker() {System.out.println("==> Sony Speaker 객체 생성"); }
	@Override
	public void volumnUp() { System.out.println("==> Sonny Speaker 볼륨업"); }
	@Override
	public void volumnDown() { System.out.println("==> Sonny Speaker 볼륨다운"); }
}
