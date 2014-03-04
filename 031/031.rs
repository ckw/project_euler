static denom : &'static [int] = &[200,100,50,20,10,5,2,1];

fn main() {
  println!("{}", count(200, 200));
}

fn count(n : int, max : int) -> int {
  if n == 0{ return 1; }

  denom.iter()
       .filter(|d| {**d <= max})
       .map(|d| { if n - *d < 0 {0}
                  else {count(n - *d, *d)}
                }
           )
       .fold(0,|acc, x| {acc + x})
}
