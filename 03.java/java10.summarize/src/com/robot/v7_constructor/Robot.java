package com.robot.v7_constructor;

import com.robot.inter.*;

//실습1. makeRobot을 Robot의 생성자로 Refactoring
public class Robot {

	public String name;
	public int qty;

	private InterFly fly;
	private InterMissile missile;
	private InterSword sword;
	
	
	public Robot(String name, int qty, InterFly fly, InterMissile missile, InterSword sword) {
		this.name = name;
		this.qty = qty;
		this.fly = fly;
		this.missile = missile;
		this.sword = sword;
	}
	
	// 공통기능
	public void shape() { System.out.println(this.name + "Robot입니다! 팔,다리,머리,몸통이 있습니다!"); }
	public void actionWalk() { System.out.println("걸을 수가 있습니다!"); }
	public void actionRun() { System.out.println("달릴 수가 있습니다!");}	
	
	// 개별기능
	public void actionFly() { fly.fly(); }
	public void actionMissile() { missile.missile(); }
	public void actionSword() { sword.sword();}	
	
	// 생산공장
	public void makeRobot() {
		shape();
		actionWalk();
		actionFly();
		actionMissile();
		actionSword();
	}
	
	@Override
	public String toString() {
		return this.name + "Robot의 생산수량 = " + this.qty;
	}
}
