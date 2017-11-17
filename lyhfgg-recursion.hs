-- Example: computing the maximum recursively.
-- Always think of the base case: singleton list
--      The max of a singleton IS the element.
maximum' :: (Ord a) => [a] -> a  
maximum' [] = error "maximum of empty list"  
maximum' [x] = x  
maximum' (x:xs)   
        | x > maxTail = x  
        | otherwise = maxTail  
        where maxTail = maximum' xs  

anotherMaximum' :: (Ord a) => [a] -> a
anotherMaximum' [] = error "No max within an empty list."
anotherMaximum' [x] = x
anotherMaximum' (x:xs) = max x (anotherMaximum' xs)

-- Replicate example: take an int (n) and a value, return a list with that value
-- repeated n times.
-- The input param n needs to be Num and Ord, since Num is not a subclass of Ord
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n value
    | n <= 0 = []
    | otherwise = value:replicate' (n-1) value

-- Recursive take
-- Base case(s): take from [] is just [], and take 0 from list is just the list
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

-- And now reverse...
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- zip needs two edge conditions to handle two params
zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

-- elem takes an element (of equality type, Eq) and a list and returns whether
-- the element is in the list
-- edge case: the empty list will never have the element
-- recursion: pop the head and compare to a, if == then True, otherwise, 
-- call elem' on the tail
elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | a == x    = True
    | otherwise = a `elem'` xs

-- Quicksort in Haskell using recursion
-- edge case: the empty list is sorted
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
    let smaller = quicksort [a | a <- xs, a <= x]
        bigger = quicksort [a | a <- xs, a > x]
    in smaller ++ [x] ++ bigger





