-- Function Syntax chapter.

-- One can pattern match over any data type
-- example: recursive factorial
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Pattern matching with tuples
-- Adding 2D vectors: we might just call fst and snd to extract
-- the components and add. Instead, one can pattern match.
addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- Example: a new head function...
head' :: [a] -> a
head' [] = error "Cannot call head on an empty list!"
head' (x:_) = x

-- Recursive implementation of length using list pattern matching
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs
-- In the above code, we do not care about the head, so only bind the rest.

-- Patterns, the @ syntax
capital :: String -> String
capital "" = "Empty string!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
-- "all" maintains the whole

-- BMI Calculation function
computeBmi :: (RealFloat a) => a -> a -> a
computeBmi weight height = weight / height ^ 2

-- Guards example: the BMI function
-- They are specified using '|' after the function parameter list.
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell w h
        | computeBmi w h <= 18.5 = "Go eat a steak!"
        | computeBmi w h <= 25.0 = "Looks good to me."
        | computeBmi w h <= 30.0 = "Whoa nelly!"
        | otherwise = "You busted the scale!"

-- Example with infix function
myCompare :: (Ord a) => a -> a -> Ordering 
a `myCompare` b
    | a > b = GT
    | a == b = EQ
    | otherwise = LT

-- We can add the "where" keyword to bind values for the guards.
bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' w h
        | bmi <= 18.5        = "Go eat a steak!"
        | bmi <= 25.0        = "Looks good to me."
        | bmi <= 30.0        = "Whoa nelly!"
        | otherwise     = "You busted the scale!"
    where bmi = w / h ^ 2
-- You can also pattern match. Alternate where:
{- where bmi = w / h ^ 2
	 (skinny, normal, fat) = (18.5, 25.0, 30.0) -}

-- Where blocks may also have functions...
calcBmis :: (RealFloat a) => [(a,a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
        where bmi w h = w / h ^ 2

-- Lets act like where, but ARE expressions themselves.
-- So they can go anywhere an expression can!
-- Example: BMI calculation with let
calcBmis' :: (RealFloat a) => [(a,a)] -> [a]
calcBmis' xs = [bmi | (w,h) <- xs, let bmi = w /h ^ 2, bmi > 25.0]
-- The let above binds to the output (bmi) and anything else within the comprehension.

-- Case expressions have the same behavior as function pattern matching, but
-- they can be used anywhere!
describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                               [x] -> "a singleton list."   
                                               xs -> "a longer list."

-- The same function can use where:
describeList' :: [a] -> String
describeList' xs = "The list is " ++ what xs
    where   what [] = "empty."
            what [x] = "a singleton list."
            what xs = "a longer list."

