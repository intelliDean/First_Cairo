
//constamt are always immutable and cannot be used with mut keyword
const BIRTH_YEAR: u32 = 1994;
const ONE_HOUR_IN_SECONDS: u32 = consteval_int!(60 * 60);

fn main() {
    println!("Hello, World!");

    variable();

    shadowing();

    shadowingPro();
}

//variables in cairo are immutable by default
fn variable() {
    let mut x = 5;
    println!("Here, the value of x is: {}", x);

    x = 6;
    println!("Here, the value of x is: {}", x);
   

    println!("I was born in {}", BIRTH_YEAR);
}

fn shadowing() {
    let x = 5;
    let x = x + 1;
    {
        let x = x * 2;
        println!("Inner scope x value is: {}", x);
    }
    println!("Outer scope x value is: {}", x);
}

fn shadowingPro() {

    let x: u64 = 2;
    println!("The value of x is {} of type u64", x);

    // converts x to a felt, type annotation is required.
    let x: felt252 = x.into(); 
    println!("The value of x is {} of type felt252", x);
}

