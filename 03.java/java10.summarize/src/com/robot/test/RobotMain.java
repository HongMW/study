package com.robot.test;

import com.robot.impl.*;
import com.robot.inter.*;

public class RobotMain {

	public static void main(String[] args) {
		
		System.out.println("=== Robot V6.0 (공통메서드) ===");
		System.out.println();
		
		Robot robot = null;
		
		robot = new CheapRobot("Cheap", 5);
		makeRobot(robot, new FlyNo(), new MissileNo(), new SwordWood());
		
		robot = new StandardRobot("Standard", 10);
		makeRobot(robot, new FlyYes(), new MissileYes(), new SwordLaser());
		
		robot = new SuperRobot("Super", 5);
		makeRobot(robot, new FlyYes(), new MissileYes(), new SwordUltraJJang());
	}

	private static void makeRobot(Robot robot, InterFly fly, InterMissile missile, InterSword sword) {
		robot.shape();
		robot.actionWalk();
		robot.actionRun();
		robot.actionFly(fly);
		robot.actionMissile(missile);
		robot.actionSword(sword);
		System.out.println(robot.name + "Robot의 생산수량 = " + robot.qty);
		System.out.println();
	}
	
	// 실습1. makeRobot을 Robot의 생성자로 Refactoring
	// 실습2. Cheap, Standard, Super을 없애고 Robot클래스 한개만 작성??
	// 실습3. 매개변수의 다형성 -> setter없이 action???메서드만 가지고 작성???
/*
 
 		import com.robot.inter.*;

		public class Robot {

		InterFly fly;
		InterMissile missile;
		InterSword sword;
		
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
 		
		public static void main(String[] args) {
		
		System.out.println("=== Robot V6.0 (공통메서드) ===");
		System.out.println();
		
		Robot robot = null;
		
		robot = new CheapRobot("Cheap", 5);
		makeRobot(robot, new FlyNo(), new MissileNo(), new SwordWood());
		
		robot = new StandardRobot("Standard", 10);
		makeRobot(robot, new FlyYes(), new MissileYes(), new SwordLaser());
		
		robot = new SuperRobot("Super", 5);
		makeRobot(robot, new FlyYes(), new MissileYes(), new SwordUltraJJang());
		}

		private static void makeRobot(Robot robot, InterFly fly, InterMissile missile, InterSword sword) {
		robot.shape();
		robot.actionWalk();
		robot.actionRun();
		robot.actionFly(fly);
		robot.actionMissile(missile);
		robot.actionSword(sword);
		System.out.println(robot.name + "Robot의 생산수량 = " + robot.qty);
		System.out.println();
	}
	
	
*/
}
