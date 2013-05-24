main = print $ theDifference 100

theDifference d = let sosq n = (n * (n + 1) * (2 * n + 1)) `div` 6
                      sqos n = (n * (n + 1) `div` 2) ^ 2
                  in sqos d - sosq d
