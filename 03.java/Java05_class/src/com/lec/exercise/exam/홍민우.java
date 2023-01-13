/*
1. 객체와 클래스에 대한 설명으로 틀린 것은 무엇입니까?	답 : ③
① 클래스는 객체를 생성하기 위한 설계도(청사진)와 같은 것이다.
② new 연산자로 클래스의 생성자를 호출함으로써 객체가 생성된다.
③ 하나의 클래스로 하니의 객체만 생성할 수 있다.
④ 객체는 클래스의 인스턴스이다.

2. 클래스의 구성멤버가 아닌 것은 무엇입니까?	답 : ④
① 필드(field)
② 생성자(constructor)
③ 메소드(method)
④ 로컬 변수(local variable)

3. 필드, 생성자, 메소드에 대한 설명으로 틀린 것은 무엇입니까?	답 : ④
① 필드는 객체의 데이터를 저장한다.
② 생성자는 객체의 초기화를 담당한다.
③ 메소드는 객체의 동작부분으로, 실행코드를 가지고 있는 블록이다.
④ 클래스는 반드시 필드와 메소드를 가져야 한다.

4. 필드에 대한 설명으로 틀린 것은 무엇입니까?	답 : ③
① 필드는 메소드에서 사용할 수 있다.
② 인스턴스필드초기와는 생성자에서 할 수 있다.
③ 필드는 반드시 생성자 선언 전에 선언되어야 한다.
④ 필드는 초기값을 주지 않더라도 기본값으로 자동 초기화된다.

5. 생성자에 대한 설명으로 틀린 것은 무엇입니까?		답 : ①
① 객체를 생성하려면 생성자 호출이 반드시 필요한 것은 아니다.
② 생성자는 다른 생성자를 호출하기위해 this()를 사용할 수 있다.
③ 생성자가 선언되지 않으면 컴파일러가 기본 생성자를 추가한다.
④ 외부에서 객체를 생성할 수 없도록 생성자에 private 접근 제한자를 붙일 수 있다.

6. 메소드에 대한 설명으로 틀린 것은 무엇입니까?		답 : ④
① 리턴값이 없는 메소드는 리턴 타입을 void로 해야 한다.
② 리턴 타입이 있는 메소드는 리턴값을 지정하기 위해 반드시 return문이 있어야 한다
③ 매개값의 수를 모를 경우 "..."를 이용해서 매개 변수를 선언할 수 있다.
④ 메소드의 이름은 중복해서 선언할 수 없다.

7. 메소드 오버로딩에 대한 설명으로 틀린 것은 무엇입니까?	답 : ②
① 동일한 이름의 메소드를 여러 개 선언하는 것을 말한다.
② 반드시 리턴 타입이 달라야 한다.
③ 매개 변수의 타입, 수, 순서를 다르게 선언해야 한다.
④ 매개값의 타입 및 수에 따라 호출될 메소드가 선택된다.

8. 인스턴스 멤버와 정적 멤버에 대한 설명으로 틀린 것은 무엇입나까?	답 : ②
① 정적 멤버는 static으로 선언된 필드와 메소드를 말한다.
② 인스턴스 필드는 생성자 및 정적 블록에서 초기화될 수 있다
③ 정적 필드와 적적 메소드는 객체 생성 없이 클래스를 통해 접근할 수 있다.
④ 인스턴스 필드와 메소드는 객체를 생성하고 사용해야 한다.

9. final 필드와 상수 (static final)에 대한 설명으로 틀린 것은 무엇입니까?	답 : ②
① final 필드와 상수는 초기값이 저장되면 값을 변경할 수 없다.
② final 필드와 상수는 생성자에서 초기화될 수 있다.
③ 상수의 이름은 대문자로 작성하는 것이 관례이다.
④ 상수는 객체 생성없이 클래슷 통해 사용할 수 있다.

10. 패키지에 대한 설명으로 틀린 것은 무엇입니까?	답 : ④
① 패키지는 클래스들을 그룹화시키는 기능을 한다.
② 클래스가 패키지에 소속되려면 패키지 선언을 반드시 해야 한다.
③ import문은 다른 패키지의 클래스를 사용할 때 필요하다.
④ mycompany 패키지에 소속된 클래스는 yourcompany에 옮겨 놓아도 동작한다.

11. 접근 제한에 대한 설명으로 틀린 것은 무엇입니까?		답 : ③
① 접근 제한자는 클래스, 필드, 생성자, 메소드의 사용을 제한한다. 
② public 접근 제한은 아무런 제한 없이 해당 요소를 사용할 수 있게 한다.
③ default 접근 제한은 해당 클래스 내부에서만 사용울 허가한다.
④ 외부에서 접근하지 못하도록 하려면 private 접근 제한을 해야 한다.

12. 다음 클래스에서 해당 멤버가 필드, 생성자, 메소드중 어떤 것인지 빈칸을 채우세요.
① 필드
② 생성자
③ 메소드

13. 현실 세계의 회원을 Member 클래스로 모델링하려고 합니다. 회원의 데이터로는 이름, 아이디, 패스워드, 나이가 있습니다. 이 데이터들을 가지는 Member 클래스를 선언해보세요.
	public class Member {
	String name;
	String id;
	String password;
	int age;
	}


14. 위위에서 작성한 Member 클래스에 생성자를 추가하려고 합니다. 다음과 같이 Member 객체를 생성할 때 name 필드와 id 필드를 외부에서 받은 값으로 초기화하려면 생성자를 어떻게 선언해야 합니까?
 	public class Member {
	String name;
	String id;
	String password;
	int age;
 	Member(String name, String id) {
        	this.name = name;
        	this.id = id;
    	}
	}

15. MemberService 클래스에 login() 메소드와 logout() 메소드를 선언하려고 합니다. login() 메소드를 호출할 때에는 매개값으로 id와 password 를 제공하고, 
 logout() 메소드는 id 만 매개값으로 제공합니다. MemberService 클래스와 login(), logout() 메소드를 선언해보세요.

	package com.lec.exercise.exam;

public class MemberServiceExample {

	public static void main(String[] args) {
		 MemberService memberService = new MemberService();
	        boolean result = memberService.login("hong", "12345");
	        if(result) {
	            System.out.println("로그인 되었습니다. ");
	            memberService.logout("hong");
	        } else {
	            System.out.println("id 또는 password 가 올바르지 않습니다. ");
	        }
	}
}

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


16. PrintExample 클래스에서 Printer 객체를 생성하고 println() 메소드를 호출해서 매개값을 콘솔에 출력하여고 합니다. println() 메소드의 
 매개값으로는 int, boolean, double, String 값을 줄 수 있습니다. Printer 클래스에서 println() 메소드를 선언해보세요.
package com.lec.exercise.exam;

public class PrinterExample {

	public static void main(String[] args) {
		Printer printer = new Printer();
        printer.println(10);
        printer.println(true);
        printer.println(5.7);
        printer.println("홍길동");
	}

}

package com.lec.exercise.exam;

public class Printer {
	  void println(int a) {
	        System.out.println(a);
	    }
	    void println(boolean a) {
	        System.out.println(a);
	    }
	    void println(double a) {
	        System.out.println(a);
	    }
	    void println(String a) {
	        System.out.println(a);
	    }
}


17. 16번 문제에서는 Printer 객체를 생성하고 println() 메소드를 생성했습니다. Printer 객체를 생성하지 않고 PrinterExample 클래스에서 다음과 같이 호출하려면
 Printer 클래스를 어떨게 수정하면 될까요?
 
public class Printer{
    static void println(int a) {
        System.out.println(a);
    }
    static void println(boolean a) {
        System.out.println(a);
    }
    static void println(double a) {
        System.out.println(a);
    }
    static void println(String a) {
        System.out.println(a);
    }
}

18. ShopService 객체를 싱글톤으로 만들고 싶습니다. ShopServiceExample 클래스에서 shopService 의 getInstance() 메소드로 싱글톤을 얻을 수 있도록 shopService 클래스를 작성해보세요.
public class ShopServiceExample {
    public static void main(String[] args) {
        ShopService obj1 = ShopService.getInstance();
        ShopService obj2 = ShopService.getInstance();

        if(obj1 == obj2) {
            System.out.println("같은 ShopService 객체 입니다. ");
        } else {
            System.out.println("다른 ShopService 객체 입니다. ");
        }
    }
}

public class ShopService {
    private static ShopService shopService = new ShopService();
        
    private ShopService() { }
        
    static ShopService getInstance() {
    return shopService;
    }
}

19. 은행 계좌 객체인 Account 객체는 잔고 (balance) 필드를 가지고 있습니다. balance 필드는 음수값이 될 수 없고, 최대 백만 원까지만 저장할 수 있습니다. 외부에서 balance 필드를 마음대로 변경하지 못하도록 하고,
 0 <= balance <= 1,000,000 범위의 값만 가질 수 있도록 Account 클래스를 작성해보세요.

① Setter 와 Getter 를 이용하세요.
② 0과 1,000,000 은 MIN_BALANCE 와 MAX_BALANCE 상수를 선언해서 이용하세요.
③ Setter 의 매개값이 음수이거나 백만 원을 초과하면 현재 balance 값을 유지하세요.
 
 package com.lec.exercise.exam;
public class AccountExample {
    public static void main(String[] args) {
        Account account = new Account();

        account.setBalance(10000);
        System.out.println("현재 잔고: " + account.getBalance());

        account.setBalance(-100);
        System.out.println("현재 잔고: " + account.getBalance());

        account.setBalance(2000000);
        System.out.println("현재 잔고: " + account.getBalance());

        account.setBalance(300000);
        System.out.println("현재 잔고: " + account.getBalance());
    }
}

class Account {
    public static final int MIN_BALANCE = 0;
    public static final int MAX_BALANCE = 1000000;
		
    private int balance;
		
    public int getBalance() {
        return balance;
    }
		
    public void setBalance(int balance) {
        if( balance < Account.MIN_BALANCE || balance > Account.MAX_BALANCE ) {
            return;
        }
        this.balance = balance;
    }
}
*/