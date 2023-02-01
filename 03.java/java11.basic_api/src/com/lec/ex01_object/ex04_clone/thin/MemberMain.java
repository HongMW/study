package com.lec.ex01_object.ex04_clone.thin;

public class MemberMain {

	public static void main(String[] args) {
		
		// 1. 원본객체
		Member org_member = new Member("hong", "홍길동", "12345", 1000, true);
		
		
		// 2. 복제객체
		Member clone_member = org_member.getMember();
		
		// 복제 후 패스워드 변경
		System.out.println("변경전 패스워드 = " + org_member.password);
		clone_member.password = "67890";
		System.out.println();
		
		System.out.println("[복제객체]");
		System.out.println(clone_member.id);
		System.out.println(clone_member.name);
		System.out.println(clone_member.password);
		System.out.println(clone_member.age);
		System.out.println(clone_member.adult);
		System.out.println();
		
		System.out.println("[원본객체]");
		System.out.println(org_member.id);
		System.out.println(org_member.name);
		System.out.println(org_member.password);
		System.out.println(org_member.age);
		System.out.println(org_member.adult);
		System.out.println();
		
		System.out.println(clone_member.hashCode());
		System.out.println(org_member.hashCode());
		System.out.println();
		
		System.out.println(clone_member.password.hashCode());
		System.out.println(org_member.password.hashCode());
		System.out.println("------------------------------------------");
		
		System.out.println(clone_member.scores.hashCode());
		System.out.println(org_member.scores.hashCode());
		System.out.println();
		
		System.out.println("원본 : 변경전 점수[0] = " + org_member.scores[0]);
		System.out.println("복제 : 변경전 점수[0] = " + clone_member.scores[0]);
		org_member.scores[0] = 100; // 원본 변경
		System.out.println("원본 : 변경후 점수[0] = " + org_member.scores[0]);
		System.out.println("복제 : 변경후 점수[0] = " + clone_member.scores[0]);
		
	}

}
