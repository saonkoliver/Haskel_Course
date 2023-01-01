-- Question 1
-- Lets say you have the nested values defined bellow. How would you get the value of
-- 4 by using only pattern matching in a function?

nested :: [([Int], [Int])]
nested = [([1, 2], [3, 4]), ([5, 6], [7, 8])]

lastOfTuple :: ([Int], [Int]) -> [Int]
lastOfTuple (_, x) = x

lastOfList :: [Int] -> Int
lastOfList (x : y : []) = y

--let a=nested!!0
--let b=lastOfTuple a 
--lastOfList b

-- Question 2
-- Write a function that takes a list of elements of any type and, if the list has 3 or more elements, it
-- removes them. Else, it does nothing. Do it two times, one with multiple function definitions and one with
-- case expressions.

question2 :: [Int] -> [Int]
question2 [x] = [x]
question2 [x, y] = [x,y]
question2 (x:y:z:[]) = [x,y,z]
question2 (x:rest) = []


question2' :: [Int] -> [Int]
question2' a= case a of []-> []
                        [x]  -> [x]
                        [x, y] -> [x,y]
                        (x:y:z:[]) -> [x,y,z]
                        (x:rest)  -> []
-- Question 3
-- Create a function that takes a 3-element tuple (all of type Integer) and adds them together
question3 :: (Int,Int,Int)-> Int
question3 (a,b,c)= read x
                    let x= show a ++ show b ++ show c
-- Question 4
-- Implement a function that returns True if a list is empty and False otherwise.
question4 :: [Int] -> Bool
question4 x case() of 
                  |x==[] -> True
                  |otherwise-> False

-- Question 5
-- Write the implementation of the tail function using pattern matching. But, instead of failing if
-- the list is empty, return an empty list.
question5 :: [Int] -> [Int]
question5 [] = []
question5 [x] = [x]
question5 (rest:x) = [x]

-- Question 6
-- write a case expression wrapped in a function that takes an Int and adds one if it's even. Otherwise does nothing.
-- (Use the `even` function to check if the number is even.)
question6:: Int -> Int
question6 x case() of
                |x mod 2 == 0 -> x+1
                | otherwise -> x