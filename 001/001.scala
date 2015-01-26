object Main{
  //scala Main  0.79s user 0.11s system 128% cpu 0.694 total
  //union doesn't remove duplicates...
  def main(args : Array[String]) : Unit = {
    println((3 to 999 by 3).toSet.union((5 to 999 by 5).toSet).sum)
  }
}
