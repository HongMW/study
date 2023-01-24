package com.lec.ex03_interface;

public class ButtonMain {

	public static void main(String[] args) {
		
		Button button = new Button();
		button.setListner(new Call());
		button.click();
		
		button.setListner(new Message());
		button.click();
		
		// 실습. YouTube, SendMail
		button.setListner(new YouTube());
		button.click(); // 동영상을 시청합니다!!
		
		button.setListner(new SendMail());
		button.click(); // 메일을 보냅니다!!
	}

}

class YouTube implements Button.OnClickListner{

	@Override
	public void OnClick() {System.out.println("동영상을 시청합니다!!");}

}

class SendMail implements Button.OnClickListner{

	@Override
	public void OnClick() {System.out.println("메일을 보냅니다!!");}

}
