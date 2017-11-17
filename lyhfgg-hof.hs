-- Currying. All functions in Haskell take ONE parameter.
-- Multi-parameter functions are really repeated applications of partial
-- functions

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

-- Partial applicatino of multThree to create a new function over two elements
-- let multTwoWithFive = multThree 5

-- For infix functions, we create a "section"
divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

-- Functions as parameters: (a -> a)
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- applyTwice (*5) 5
-- applyTwice (++ " HI ")

-- Create zipWith function using HOF
-- Recursive, so base cases are empty lists
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c] 
zipWith' f _ [] = []
zipWith' f [] _ = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
-- HOF abstract away common patterns.

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f x y = f y x

-- Maps and Filters

