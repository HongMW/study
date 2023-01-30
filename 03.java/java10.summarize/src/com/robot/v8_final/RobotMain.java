package com.robot.v8_final;

import com.robot.impl.*;

//실습2. Cheap, Standard, Super을 없애고 Robot클래스 한개만 작성??
public class RobotMain {

	public static void main(String[] args) {
		
		System.out.println("=== Robot V8.0 (최종) ===");
		System.out.println();
		
		Robot robot = null;
		
		robot = new Robot("Cheap", 5, new FlyYes(), new MissileNo(), new SwordLaser());
		robot.makeRobot();
		System.out.println(robot.toString() + "\n");
		
		robot = new Robot("Standard", 10, new FlyYes(), new MissileNo(), new SwordUltraJJang());
		robot.makeRobot();
		System.out.println(robot.toString() + "\n");		
		
		robot = new Robot("Super", 10, new FlyYes(), new MissileYes(), new SwordUltraJJang());
		robot.makeRobot();
		System.out.println(robot.toString() + "\n");		
	}

}
