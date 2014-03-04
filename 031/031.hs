main = print $ count 200 200
 where cs = [200,100,50,20,10,5,2,1]
       count amt maxC =
           let f a c = if a - c < 0 then 0 else count (a - c) c
           in if amt == 0 then 1 else sum . map (f amt) . dropWhile (>maxC) $ cs
