package com.lec.ex03_interface;

public class Call implements Button.OnClickListner{

	@Override
	public void OnClick() {System.out.println("전화를 겁니다!!!");}

}
