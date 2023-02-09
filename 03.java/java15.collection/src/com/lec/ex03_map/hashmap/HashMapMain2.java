package com.lec.ex03_map.hashmap;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

public class HashMapMain2 {

	public static void main(String[] args) {
		
		Map<Student, Integer> map = new HashMap<>();
		
		map.put(new Student(1, "소향"), 80);
		map.put(new Student(1, "소향"), 90);
		System.out.println("총 객체수 = " + map.size());
		
	}

}

class Student {
	
	private int sno;
	private String name;
	
	public Student(int sno, String name) {
		super();
		this.sno = sno;
		this.name = name;
	}

	@Override
	public String toString() {
		return "Student [sno=" + sno + ", name=" + name + "]";
	}

	// 실습. hashCode, equals를 사용자가 재정의해 동일객체 부여
	// 
	
	@Override
	public int hashCode() {
		return this.sno + this.name.hashCode();
		//return Objects.hash(name, sno);
	}

//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj)
//			return true;
//		if (obj == null)
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		Student other = (Student) obj;
//		return Objects.equals(name, other.name) && sno == other.sno;
//	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Student) {
			Student std = (Student) obj;
			return(this.sno == std.sno) && (this.name.equals(std.name));
		}
		return super.equals(obj);
	}
		
}