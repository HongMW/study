package com.lec.ex03_interface;

public class Button {
	
	private OnClickListner listner;
	XXX xxx;
	
	// 메서드
	void click() {
		listner.OnClick();
	}
	
	public void setListner(OnClickListner listner) { 
		this.listner = listner;
	} // 여기서 받고 위 프라이빗으로 받고 밑 터치의 온클릭으로 보낸다
	
	// 중첩인터페이스
	interface OnClickListner {
		void OnClick();
	}
}

interface XXX {
	void OnClick();
}