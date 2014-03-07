use std::vec::MutableTotalOrdVector;

/* urgh. 10x haskell version.
   ./032  2.48s user 0.00s system 99% cpu 2.497 total
*/
fn main() {
  let xs = range(1, 98).to_owned_vec();
  let ys = range(1, 2498).to_owned_vec();
  let canonical = "123456789".as_bytes().chunks(1).to_owned_vec().map(|x| {x[0]});
  let mut products : ~[int] = ~[];

  for &x in xs.iter(){
    for &y in ys.iter(){

      let prod = x * y;
      let res = prod.to_str() + x.to_str() + y.to_str();
      let mut res_p = res.as_bytes().chunks(1).to_owned_vec().map(|x| {x[0]});

      res_p.sort();

      if res_p.equals(&canonical) {products.push(prod);}
    }
  }

  products.sort();
  products.dedup();
  println!("{:?} {:?}", products, products.iter().fold(0,|acc, &x| {acc + x}));
}
