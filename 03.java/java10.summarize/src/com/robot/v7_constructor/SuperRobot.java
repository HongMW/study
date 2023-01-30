package com.robot.v7_constructor;

import com.robot.inter.*;

public class SuperRobot extends Robot{

	public SuperRobot(String name, int qty, InterFly fly, InterMissile missile, InterSword sword) {
		super(name, qty, fly, missile, sword);
	}

}
