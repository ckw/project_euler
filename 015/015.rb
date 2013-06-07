def fac n
  (1..n).reduce(:*) || 1
end

side = ARGV[0].to_i
numerator = fac(2 * side)
x = fac(side)
denominator = x * x

puts (numerator / denominator)
