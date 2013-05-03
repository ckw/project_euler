fn main() {
  //so stupid
  let mut sum = 0;
  let mut threes = 3;
  let mut fives = 5;
  let mut fifteens = 15;

  loop {
    if(threes > 999){ break;}
    sum = sum + threes;
    threes += 3;
  }

  loop {
    if(fives > 999){ break;}
    sum = sum + fives;
    fives += 5;
  }

  loop {
    if(fifteens > 999){ break;}
    sum = sum - fifteens;
    fifteens += 15;
  }

  println(fmt!("sum: %?", sum));
}
