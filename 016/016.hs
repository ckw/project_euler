
main = print . sum . fmap (read . return) . show $ 2 ^ 1000
