-- Basic function syntax and conditionals.
-- Now with type declarations...

-- For grins, I forced doubleMe to take only Ints
doubleMe :: Int -> Int
doubleMe x = x + x

-- Now, double us will be forced to use Ints only.
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
			then x
			else x*2

-- Takes a list of integers, extracts the even numbers and creates
-- a new list of strings based on whether the number is > or < 10.
-- Now declared with a type: The input must be a list of whole numbers
-- and it produces a list of strings ([Char])
boomBangs :: Integral a => [a] -> [[Char]]
boomBangs xs = [if x < 10 then "Boom!" else "Bang!" | x <- xs, even x]

-- Multiple predicates are allowed.
boomBangsOdd xs = [x | x <- xs, odd x, x `mod` 3 == 0]

-- Tuple time. Tuples can be composed of multiple types.

-- Compute the right triangles that have a perimeter == 24
buildTriangles as bs cs = [ (a,b,c) | c <- cs, b <- [head bs..c], a <- [head as..b], a^2 + b^2 == c^2, a+b+c == 24 ]
