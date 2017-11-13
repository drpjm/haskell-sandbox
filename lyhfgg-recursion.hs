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


