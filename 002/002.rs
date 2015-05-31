/*
./rs  0.00s user 0.00s system 0% cpu 0.004 total
*/

fn main(){
  println!("{}", fib_sum(4_000_000));
}

fn fib_sum(i : u64) -> u64{
    let (mut a, mut b, mut sum) = (1, 1, 0);
    while a < i {
        if a & 1 != 0 {sum = sum + a;};
        b = a + b;
        a = b - a;
    }
    sum
}
