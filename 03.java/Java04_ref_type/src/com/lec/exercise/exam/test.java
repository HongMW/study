package com.lec.exercise.exam;

import java.util.Scanner;

public class test {

	public static void main(String[] args) {
//		int[] array={1,5,3,8,2};
//		   int max = 0;
//		   
//		   for(int i=0;i<array.length;i++) {
//		   		if(array[i] > max) {
//		   		max = array[i];
//		   		}
//		   }
//		   System.out.println("max = " + max);
//		   System.out.println();
//		   
//  int[][] array ={
//					{95, 86},
//					{83, 92, 96},
//					{78, 83, 93, 87, 88}
//				  };  
//
//	int sum = 0;
//	double avg = 0;
//	
//	int cnt = 0;
//	
//	for(int i=0;i<array.length;i++) {
//		for(int j=0;j<array[i].length;j++) {
//			sum += array[i][j];
//		}
//		cnt += array[i].length;
//	}
//	avg = (double) sum / cnt;
//	
//	System.out.println("sum = " + sum);
//	System.out.println("avg = " + avg);
		   
	boolean run = true;
	int studentNum = 0;
	int[] scores = null;
	Scanner scan = new Scanner(System.in);

	while(run){
		System.out.println("------------------------------------------------------");
		System.out.println("1.학생수 | 2.점수입력 | 3.점수리스트 | 4.분석 | 5.종료");
		System.out.println("------------------------------------------------------");
		System.out.print("선택> ");
		

		int select = scan.nextInt();

		if(select == 1){	
			System.out.print("학생수> ");
			studentNum = scan.nextInt();
			scores = new int[studentNum];
		}else if(select == 2){
			for(int i=0;i<studentNum;i++) {
			System.out.print("scores[" + i + "]");
			scores[i] = scan.nextInt();
			}
		}else if(select == 3){
			for(int i=0;i<studentNum;i++) {
				System.out.println("scores [" + i + "] : " + scores[i]);
			}
		}else if(select == 4){
			int max = 0;
			int sum = 0;
			double avg = 0.0;
			
			for (int i=0;i<studentNum;i++) {
				if(scores[i] > max) {
				max = scores[i];
				}
				sum += scores[i];
			}
			
			avg = (double)sum / studentNum;
			System.out.println("최고 점수 = " + max);
			System.out.println("평균 점수 = " + avg);
		}else if(select == 5){
			run = false;
		}
		}
		System.out.println("프로그램 종료");
	
	}

}
