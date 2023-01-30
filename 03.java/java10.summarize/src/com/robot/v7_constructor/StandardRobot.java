package com.robot.v7_constructor;

import com.robot.inter.*;

public class StandardRobot extends Robot{

	public StandardRobot(String name, int qty, InterFly fly, InterMissile missile, InterSword sword) {
		super(name, qty, fly, missile, sword);
	}

}
