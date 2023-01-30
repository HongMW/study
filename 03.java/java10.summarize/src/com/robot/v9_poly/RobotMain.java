package com.robot.v9_poly;

import com.robot.impl.*;

// 실습3. 매개변수의 다형성 -> setter없이 action???메서드만 가지고 작성???
public class RobotMain {

	public static void main(String[] args) {
		
		System.out.println("=== Robot V9.0 (다형성(생성자,메서드) ===");
		System.out.println();

		Robot robot = null;
		
		robot = new Robot("Cheap", 5);
		robot.makeRobot(new FlyYes(), new MissileNo(), new SwordWood());
		System.out.println(robot.toString() + "\n");

		robot = new Robot("Standard", 10);
		robot.makeRobot(new FlyYes(), new MissileYes(), new SwordLaser());
		System.out.println(robot.toString() + "\n");
		
		robot = new Robot("Super", 5);
		robot.makeRobot(new FlyYes(), new MissileYes(), new SwordUltraJJang());
		System.out.println(robot.toString() + "\n");
	

	}

}
