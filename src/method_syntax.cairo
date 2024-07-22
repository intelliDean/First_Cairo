//Methods are similar to functions: we declare them with the fn keyword and a name, 
//they can have parameters and a return value, and they contain some code that’s run 
//when the method is called from somewhere else. Unlike functions, methods are defined 
//within the context of a struct (or an enum which we cover in Chapter 6), and their 
//first parameter is always self, which represents the instance of the type the 
//method is being called on.

#[derive(Copy, Drop)]
struct Rectangle {
    width: u64,
    height: u64,
}

trait RectangleTrait {
    fn area(self: @Rectangle) -> u64;
}

impl RectangleImpl of RectangleTrait {
    fn area(self: @Rectangle) -> u64 {
        (*self.width) * (*self.height)
    }
}

fn main() {
    let rect1 = Rectangle { width: 30, height: 50, };
    println!("Area is {}", rect1.area());
}

