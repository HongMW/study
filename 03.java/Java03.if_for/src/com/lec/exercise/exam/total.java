package com.lec.exercise.exam;

import java.util.Scanner;

public class total {

	public static void main(String[] args) {
//		int tot =0;
//		
//		for(int i=0;i<=100;i+=3) {
//			tot += i;
//		}
//	System.out.println("3의 배수 총합 = " + tot);
//		int num1 = 1;
//		
//		for(int i=0;i<5;i++) {
//			for(int k=4;k>i;k--) {
//				System.out.print(" ");
//			}
//			
//			for(int j=0;j<num1;j++) {
//				System.out.print("*");
//			}
//			num1 = num1 + 2;
//			System.out.println();
//		}
//		int num2 = 7;
//		
//		for(int i=0;i<5;i++) {
//			for(int k=-1;k<i;k++) {
//				System.out.print(" ");
//			}
//			for(int j=num2;j>0;j--) {
//				System.out.print("*");
//			}
//			num2 = num2 - 2;
//			System.out.println();
//		}
		for(int i=1; i<=5; i++) {   
            for (int j=1; j<=5-i; j++) {
                System.out.print("  ");
            }
            for (int j=1; j<=i*2-1; j++) {
                System.out.print("* "); 
            }
            System.out.println();
        }
        
        for(int i=4; i>0; i--) {   
            for (int j=4; j>=i; j--) {
                System.out.print("  ");
            }
            for (int j=1; j<=i*2-1; j++) {
                System.out.print("* "); 
            }
            
            System.out.println();
	}
        
        while(true) {
            int num1 = (int)(Math.random()*6) + 1;
            int num2 = (int)(Math.random()*6) + 1;
            System.out.println("(" + num1 + ", " + num2 + ")");
            if(num1+num2==5){
            break;
            }
            }
        for(int x=0; x<10;x++) {
        	for(int y=0; y<10;y++) {
        		if(((4*x)+(5*y)) == 60) {
        		System.out.println("(" + x + ", " + y + ")");
        		}
        	}
        }
        for(int i=0;i<5;i++) {
    		for(int j=0;j<i+1;j++){
    		System.out.print('*');
    		}
    		System.out.println();
    		}
        System.out.println("-------------------------------");
        for(int i=0;i<5;i++) {
        	for(int j=5;j>i;j--) {
        	System.out.print("*");
        	}
        	System.out.println();
        }
        
        System.out.println("-------------------------------");
        for (int i = 1; i < 6; i++) {
            for(int j=5; j > i; j--) {
               System.out.print(" ");
            }
         for(int j=0; j < i; j++) {
            System.out.print("*");
         }
         System.out.println("");   
         }
      
        System.out.println("-------------------------------");
        for(int i=0;i<5;i++) {
        	for(int j=0;j<i;j++) {
        	System.out.print(' ');
        	}
        	for(int j=5;j>i;j--) {
        	System.out.print('*');
        	}
        	System.out.println();
        }
        System.out.println("-------------------------------");
        int num =1;
        for(int i=0;i<4;i++) {
        	for(int j=3;j>i;j--) {
        	System.out.print(' ');
        	}
        	for(int j=0;j<num;j++) {
        	System.out.print('*');
        	}
        	num = num + 2;
        	System.out.println();
        }
        
        System.out.println("-------------------------------");
        int num1 = 7;
        for(int i=0;i<5;i++) {
        	for(int j=0;j<i;j++) {
        		System.out.print(" ");
        	}
        	for(int j= num1;j>0;j--) {
        		System.out.print("*");
        	}
        	num1 = num1 - 2;
        	System.out.println();
        }
        System.out.println("-------------------------------");
        boolean run = true;

		int balance = 0;
		int select = 0;

		Scanner scan = new Scanner(System.in);

		while(run){
			System.out.println("---------------------------");
			System.out.println("1.예금|2.출금|3.잔고|4.종료");
			System.out.println("---------------------------");
			System.out.print("선택> ");

			select = scan.nextInt();

			if(select == 1){	
				System.out.println("예금액> ");
				balance += scan.nextInt();
			}else if(select == 2){
				System.out.println("출금액> ");
				balance -= scan.nextInt();
			}else if(select == 3){
				System.out.println("잔고> " + balance);
			}else{
				run = false;
			}
		}
		System.out.println("프로그램 종료");

}
}
