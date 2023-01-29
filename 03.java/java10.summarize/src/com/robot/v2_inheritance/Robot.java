package com.robot.v2_inheritance;

public class Robot {

	public int qty;
	public String name;
	
	public Robot(String name, int qty) {
		super();
		this.qty = qty;
		this.name = name;
	}
	
	public void shape() { System.out.println(this.name + "입니다! 팔, 다리, 머리 , 몸통이 있습니다!"); }
	public void actionWalk() { System.out.println("걸을 수가 있습니다!"); }
	public void actionRun() {System.out.println("달리 수가 있습니다!");}
	
}
