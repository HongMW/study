package com.robot.test;

import com.robot.inter.*;

public class Robot {

	private InterFly fly;
	private InterMissile missile;
	private InterSword sword;
	
	public String name;
	public int qty;
	
	public Robot(String name, int qty) {
		this.name = name;
		this.qty = qty;
	}
	
	public void shape() { System.out.println(this.name + "Robot입니다! 팔,다리,머리,몸통이 있습니다!"); }
	public void actionWalk() { System.out.println("걸을 수가 있습니다!"); }
	public void actionRun() { System.out.println("달릴 수가 있습니다!");}	
	
	public void actionFly(InterFly fly) {fly.fly();}
	public void actionMissile(InterMissile missile) { missile.missile(); }
	public void actionSword(InterSword sword) { sword.sword();}	
}
