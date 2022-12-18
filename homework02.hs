-- Question 1
-- Add the type signatures for the functions below and then remove the comments and try to compile.
-- (Use the types presented in the lecture.)

--f1:: float->float->float
--f1 x y z = x ** (y/z)
f1 :: Double->Double->Double->Double
f1 x y z = x ** (y/z)


f2 :: Double->Double->Double->Double
f2 x y z = sqrt (x/y - z)

--khong biet làm
--f3 :: Bool->Bool->List
--f3 x y = [x == True] ++ [y]
f4:: Double->Double->Double->Bool
f4 x y z = x == (y + z)

--f5:: list->list->list->Bool
--f5 [x] [y] [z] = [x] == ([y] ++ [z])


-- Question 2
-- Why should we define type signatures of functions? How can they help you? How can they help others?

----ANSWER: help the compiler return te correct type that you want
-- if not, the compiler returns the errors

{- copy
--It may make the code easier for humans to read. (OTOH, if you have dozens of tiny definitions, sometimes the type signatures add more clutter.)
--If your implementation is wrong, the compiler may infer the wrong type. This may cause other functions' types to be inferred wrong, finally resulting in a type error very far away from the actual broken function.
--You may want to give a function a less polymorphic type than it could have, for performance reasons.
--You may want to use type aliases. This allows you to quickly change a type in several places, and also to document some of the intent behind a value. (Compare FilePath vs String.)
--The compiler can figure out types automatically, but not all external tools can do this. (E.g., originally Haddock would refuse to produce documentation for functions lacking an explicit type signature - although I gather this is fixed now.)-}

-- Question 3
-- Why should you define type signatures for variables? How can they help you?

----ANSWER: help to give the corect values for each variable 

-- Question 4
-- Are there any functions in Haskell that let you transform one type to the other? Try googling for the answer.
--ANSWER: in my opition: no way

-- Question 5
-- Can you also define in Haskell list of lists? Did we showed any example of that? How would you access the inner
-- most elements?
----ANSWER: 
addVal :: Int -> [Int] -> [[Int]]
addVal i [] = []
addVal i (x:xs) =  [i,x] : addVal i xs