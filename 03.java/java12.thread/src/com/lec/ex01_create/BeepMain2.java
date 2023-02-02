package com.lec.ex01_create;

import java.awt.Toolkit;

public class BeepMain2 {

	public static void main(String[] args) {
		
		// Thread객체를 만드는 방법
		// 1. 외부에 클래스 생성(BeepTask1.java, Runnable구현객체)
//		Runnable beepTask = new BeepTask1();
//		Thread thread = new Thread(beepTask);
//		thread.start();
		
		
		
		// 2. 익명객체(인터페이스)
		Thread thread2 = new Thread(new Runnable() {
			
			@Override
			public void run() {// 띵소리를 5번
				Toolkit toolkit = Toolkit.getDefaultToolkit();
				for(int i=0;i<5;i++) {
					toolkit.beep();
					try {
						Thread.sleep(500);
					} catch (InterruptedException e) {
						e.printStackTrace();
					} // 0.5초
				}
			}
		});
		thread2.start();
		
		// 3. 람다식
		
		
		
		
		// 띵출력을 5번
				for(int i=0;i<5;i++) {
					System.out.println("띵~~");
					try {
						Thread.sleep(500);
					} catch(InterruptedException e) {
						e.printStackTrace();
					}
				}
	}

}
