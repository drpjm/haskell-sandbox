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
