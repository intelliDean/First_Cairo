//constamt are always immutable and cannot be used with mut keyword
const BIRTH_YEAR: u32 = 1994;
const ONE_HOUR_IN_SECONDS: u32 = consteval_int!(60 * 60);

fn main() {
    println!("Hello, World!");

    variable();

    shadowing();

    shadowingPro();

    scalar_types();

    tup();

    println!("result is {}", testing_function(10));
}

//variables in cairo are immutable by default
fn variable() {
    let mut x = 5;
    println!("Here, the value of x is: {}", x);

    x = 6;
    println!("Here, the value of x is: {}", x);

    println!("I was born in {}", BIRTH_YEAR);
}

fn variablesAreImmutable() {
    //by default, variables are immutable unless used with mut keyword to signifies it's mutable
    let mut name = 'Dean';

    name = 'Michael';

    name = 'James';
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

//=======================DATA TYPES==============================================
//scalar and compound

fn unwrapping() {
    let x: felt252 = 3;

    let y: u32 = x.try_into().unwrap();
}

//scalar types: felts, integers, booleans
fn scalar_types() {
    // addition
    let sum = 5_u128 + 10_u128;
    println!("5 + 10 = {}", sum);

    // subtraction
    let difference = 95_u128 - 4_u128;
    println!("95 - 4 = {}", difference);

    // multiplication
    let product = 4_u128 * 30_u128;
    println!("4 x 30 = {}", product);

    // division
    let quotient1 = 56_u128 / 32_u128; //result is 1
    let quotient2 = 64_u128 / 32_u128; //result is 2
    println!("56 / 32 = {}", quotient1);
    println!("64 / 32 = {}", quotient2);

    // remainder
    let remainder = 43_u128 % 5_u128; // result is 3
    println!("43 mod 5 = {}", remainder);
}

fn boolean() {
    let t = true;

    let f: bool = false;
}

// ==========================STRING=================================================
//short strings uses simple quotes
//ByteArray uses double quotes.

fn char() {
    let my_first_char = 'C';
    let my_first_char_in_hex = 0x43;

    let my_first_string = 'Hello world';
    let my_first_string_in_hex = 0x48656C6C6F20776F726C64;
}

fn bytesArray() {
    let long_string: ByteArray = "this is a string which has more than 31 characters";
}


// ==========================COMPOUND TYPES=====================================
//TUPLE
fn tup() {
    let tup: (u32, u64, bool) = (10, 20, true);

    // let tup = (500, 6, true);

    //destructuring
    let (x, y, z) = (500, 6, true);

    if y == 6 {
        println!("y is 6!");
    }
}

// ==========================TYPE CONVERSION=====================================

fn conertInto() {
    let my_u8: u8 = 10;
    let my_u16: u16 = my_u8.into();
    let my_u32: u32 = my_u16.into();
    let my_u64: u64 = my_u32.into();
    let my_u128: u128 = my_u64.into();

    let my_felt252 = 10;
    // As a felt252 is smaller than a u256, we can use the into() method
    let my_u256: u256 = my_felt252.into();
    let my_other_felt252: felt252 = my_u8.into();
    let my_third_felt252: felt252 = my_u16.into();
}

fn tryConvertInto() {
    let my_u256: u256 = 10;

    // Since a u256 might not fit in a felt252, we need to unwrap the Option<T> type
    let my_felt252: felt252 = my_u256.try_into().unwrap();
    let my_u128: u128 = my_felt252.try_into().unwrap();
    let my_u64: u64 = my_u128.try_into().unwrap();
    let my_u32: u32 = my_u64.try_into().unwrap();
    let my_u16: u16 = my_u32.try_into().unwrap();
    let my_u8: u8 = my_u16.try_into().unwrap();

    let my_large_u16: u16 = 2048;
    let my_large_u8: u8 = my_large_u16.try_into().unwrap(); // panics with 'Option::unwrap failed.'
}

fn testing_function(number: u32) -> u32 {
    number + 1
    // return number + 1;

}