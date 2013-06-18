main = print $ sum $ fmap (read . return) $ show $ product [1..100]
