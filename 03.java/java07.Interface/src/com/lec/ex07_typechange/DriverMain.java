package com.lec.ex07_typechange;

public class DriverMain {

	public static void main(String[] args) {
		
		Vehicle vehicle = new Bus();
		vehicle.run();
		// vehicle.checkFare(); (x)
		System.out.println();
		
		Bus bus = (Bus) vehicle;	// 강제형변환
		bus.run();
		bus.checkFare();
	}

}
