package com.lec.exercise.exam;

public class MemberService {
	String id = "hong";
    String password = "12345";

    public boolean login(String id, String password) {
        if(this.id == id && this.password == password) {
            return true;
        } else {
            return false;
        }
    }    

    public void logout(String id) {
        if(this.id == id) {
            System.out.println("로그아웃 되었습니다. ");
        }
    }
}
