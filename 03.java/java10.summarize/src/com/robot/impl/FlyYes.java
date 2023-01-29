package com.robot.impl;

import com.robot.inter.InterFly;

public class FlyYes implements InterFly{

	@Override
	public void fly() {
		System.out.println("날수가 있습니다!");
	}

}
