package com.lec.ex10_abstract.method;

public class AnimalMain {

	public static void main(String[] args) {
		
		// Animal animal = new Animal();
		Dog dog = new Dog();
		Cat cat = new Cat();
		Bird bird = new Bird();
		
		dog.breath();
		cat.breath();
		bird.breath();
		System.out.println();
		
		dog.sound();
		cat.sound();
		bird.sound();
		System.out.println();
		
		dog.move();
		cat.move();
		bird.move();
		
		// 3. 다향성
		animalSound(dog);
		animalSound(cat);
		animalSound(bird);
		animalSound(new 호랑이());
		animalSound(new 사자());
	}
	
	public static void animalSound(Animal animal) {
		animal.sound();
	}

//	public static void animalSound(Dog dog) {
//		dog.sound();
//	}
//	public static void animalSound(Cat cat) {
//		cat.sound();
//	}
//	public static void animalSound(Bird bird) {
//		bird.sound();
//	}
}

class 사자 extends Animal {

	@Override
	void sound() {
		System.out.println("사자가 어흥 소리를 낸다!");
		
	}

	@Override
	void move() {
		System.out.println("사자가 어슬렁 어슬렁 움직인다!");
		
	}
	
}
class 호랑이 extends Animal {

	@Override
	void sound() {
		System.out.println("호랑이가 어흥 소리를 낸다!");
		
	}

	@Override
	void move() {
		System.out.println("호랑이가 어슬렁 어슬렁 움직인다!");
		
	}
	
}
