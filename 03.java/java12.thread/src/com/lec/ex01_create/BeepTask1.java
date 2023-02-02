package com.lec.ex01_create;

import java.awt.Toolkit;

public class BeepTask1 implements Runnable {

	@Override
	public void run() {
		
		// 띵소리를 5번
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

}
