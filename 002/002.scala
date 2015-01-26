object Main{
  //scala Main  0.78s user 0.10s system 122% cpu 0.714 total

  def main(args: Array[String]): Unit = {
    println(fibsLessThanN(4000000).filter(even).sum)
  }

  def fibsLessThanN(n: Long): List[Long] = {
    fibsLessThanNPrime(n, 0, 1, List())
  }

  def fibsLessThanNPrime(n: Long, prev: Long, curr: Long, acc: List[Long]): List[Long] = {
    if(curr > n) acc else fibsLessThanNPrime(n, curr, prev + curr, curr :: acc)
  }

  def even(n: Long) = {
    n % 2 == 0
  }
}
