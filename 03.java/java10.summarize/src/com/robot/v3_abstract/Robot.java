package com.robot.v3_abstract;

public abstract class Robot {

	public String name;
	public int qty;
	
	public Robot(String name, int qty) {
		this.name = name;
		this.qty = qty;
	}
	
	public void shape() { System.out.println(this.name + "입니다! 팔, 다리, 머리 , 몸통이 있습니다!"); }
	public void actionWalk() { System.out.println("걸을 수가 있습니다!"); }
	public void actionRun() {System.out.println("달리 수가 있습니다!");}
	
	public abstract void actionFly();
	public abstract void actionMissile();
	public abstract void actionSword();
}

class CheapRobot extends Robot {

	public CheapRobot(String name, int qty) {
		super(name, qty);
	}

	@Override
	public void actionFly() {
		System.out.println(this.name + "은 거의 날지 못합니다!");
	}

	@Override
	public void actionMissile() {
		System.out.println(this.name + "은 미사일이 없습니다!");
	}

	@Override
	public void actionSword() {
		System.out.println(this.name + "은 검이 없습니다!");
	}
	
	
}

class StandardRobot extends Robot {

	public StandardRobot(String name, int qty) {
		super(name, qty);
	}

	@Override
	public void actionFly() {
		System.out.println(this.name + "은 어느정도 날수 있습니다!");
	}

	@Override
	public void actionMissile() {
		System.out.println(this.name + "은 미사일이 있습니다!");
	}

	@Override
	public void actionSword() {
		System.out.println(this.name + "은 목검이 있습니다!");
	}
	
}

class SuperRobot extends Robot {

	public SuperRobot(String name, int qty) {
		super(name, qty);
	}

	@Override
	public void actionFly() {
		System.out.println(this.name + "은 자유자재로 날아다닙니다!");
	}

	@Override
	public void actionMissile() {
		System.out.println(this.name + "은 미사일이 있습니다!");
	}

	@Override
	public void actionSword() {
		System.out.println(this.name + "은 광선검이 있습니다.");
	}
	
}