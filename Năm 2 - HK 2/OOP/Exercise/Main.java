class A {
 public int x = 10;
 public void display() {
 System.out.println(this.x);
 }
}
class B extends A {
 public int x = 20;
 @Override
 public void display() {
 System.out.println(this.x);
 }
}

public class Main {
    public static void main(String[] args) {
        A b = new B();
        b.display();
    }
}