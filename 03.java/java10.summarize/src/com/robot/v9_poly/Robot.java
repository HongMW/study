package com.robot.v9_poly;

import com.robot.inter.*;

public class Robot {

	public String name;
	public int qty;

	private InterFly fly;
	private InterMissile missile;
	private InterSword sword;
	
	// 생성자 : 다형성
	public Robot() {}
	public Robot(String name, int qty) {
		this.name = name;
		this.qty = qty;
	}
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

	// 메서드 : 다형성
	// 개별기능
	public void actionFly() { fly.fly(); }
	public void actionMissile() { missile.missile(); }
	public void actionSword() { sword.sword();}	
	
	public void actionFly(InterFly fly) { fly.fly(); }
	public void actionMissile(InterMissile missile) { missile.missile(); }
	public void actionSword(InterSword sword) { sword.sword();}	

	public void makeRobot() {
		shape();
		actionWalk();
		actionFly();
		actionMissile();
		actionSword();
	}
	
	public void makeRobot(InterFly fly, InterMissile missile, InterSword sword) {
		shape();
		actionWalk();
		actionFly(fly);
		actionMissile(missile);
		actionSword(sword);		
	}
	
	@Override
	public String toString() {
		return this.name + "Robot의 생산수량 = " + this.qty;
	}
	
}
