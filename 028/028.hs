main = print $ succ $ sum $ fmap c_square [2..501]
  where c_square n = 16 * (n ^ 2) - 28 * n + 16

