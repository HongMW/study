package com.lec.ex03_multi;

import com.lec.ex02_implements.RemoteControl;

public class SmartTelevision implements RemoteControl, Searchable {

	private int volume;
	
	@Override
	public void search(String url) {
		System.out.println(url = "을(를) 검색합니다!");
	}
	@Override
	public void powerOn() {
		System.out.println("Smart Tv를 파워온!");
		
	}

	@Override
	public void powerOff() {
		System.out.println("Smart Tv를 파워오프!");
		
	}

	@Override
	public void setVolume(int volume) {
		if(volume >= RemoteControl.MAX_VOLUME) {
			this.volume = RemoteControl.MAX_VOLUME;
		} else if(volume < RemoteControl.MIN_VOLUME) {
			this.volume = RemoteControl.MIN_VOLUME;
		}
		this.volume = volume;
		System.out.println("현재 Smaet TV볼륨은 = " + volume + "입니다!!");
	}

}
