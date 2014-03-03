#! /usr/bin/env ruby

@denom = [200,100,50,20,10,5,2,1]

def count(n, max)
  return 1 if n == 0
  @denom.drop_while{|d| d > max}.map{|d| n - d < 0 ? 0 : count(n - d, d)}.reduce(:+)
end

puts count(ARGV[0].to_i, @denom.sort.reverse.first)
