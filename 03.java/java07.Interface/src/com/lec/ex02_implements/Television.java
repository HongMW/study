package com.lec.ex02_implements;

public class Television implements RemoteControl{

	private int volume;
	
	@Override
	public void powerOn() {
		System.out.println("TV Power ON!!");
		
	}

	@Override
	public void powerOff() {
		System.out.println("TV Power Off!!");
		
	}

	@Override
	public void setVolume(int volume) {
		if(volume >= RemoteControl.MAX_VOLUME) {
			this.volume = RemoteControl.MAX_VOLUME;
		} else if(volume < RemoteControl.MIN_VOLUME) {
			this.volume = RemoteControl.MIN_VOLUME;
		}
		this.volume = volume;
		System.out.println("현재 TV볼륨은 = " + volume + "입니다!!");
	}

	
	

}
