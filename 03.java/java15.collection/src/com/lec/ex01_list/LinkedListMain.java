package com.lec.ex01_list;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class LinkedListMain {

	public static void main(String[] args) {
		
		List<String> arrList = new ArrayList<>();
		List<String> linkList = new LinkedList<>();
		
		// ArrayList vs LinkedList 성능 비교
		// add, remove 속도비교
		long start, finishi;
		
		// a. ArrayList  // 90%정도 어레이리스트를 사용한다.
		start = System.nanoTime();
		
		for(int i=0;i<100000;i++) {
			arrList.add(0, String.valueOf(i));
		}
		finishi = System.nanoTime();
		System.out.println("ArrayList의 소요시간 = " + (finishi - start) + "ns");
		
		// b. LinkedList
		start = System.nanoTime();
		for(int i=0;i<100000;i++) {
			linkList.add(0, String.valueOf(i));
		}
		finishi = System.nanoTime();
		System.out.println("LinkedList의 소요시간 = " + (finishi - start) + "ns");
	}

}
