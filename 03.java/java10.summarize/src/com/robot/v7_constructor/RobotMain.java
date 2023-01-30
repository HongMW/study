package com.robot.v7_constructor;

import com.robot.impl.*;

public class RobotMain {

	public static void main(String[] args) {
		
		System.out.println("=== Robot V7.0 (생성자) ===");
		System.out.println();
		
		Robot robot = null;
		robot = new CheapRobot("Ceap", 5, new FlyYes(), new MissileNo(), new SwordLaser());
		robot.makeRobot();
		System.out.println(robot.toString() + "\n");
		
		robot = new StandardRobot("Standard", 10, new FlyYes(), new MissileNo(), new SwordUltraJJang());
		robot.makeRobot();
		System.out.println(robot.toString() + "\n");
		
		robot = new SuperRobot("Super", 10, new FlyYes(), new MissileYes(), new SwordUltraJJang());
		robot.makeRobot();
		System.out.println(robot.toString() + "\n");
	}

}
