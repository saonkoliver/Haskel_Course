-- Question 1
-- Write a function that checks if the monthly consumption of an electrical device is bigger, equal, or smaller than the maximum allowed and
-- returns a message accordingly.
-- The function has to take the hourly consumption of an electrical device, the hours of daily use, and the maximum monthly consumption allowed.
-- (Monthly usage = consumption (kW) * hours of daily use (h) * 30 days).
coms :: Double -> Double -> Double -> [Char]
coms x y z =
  if z > x * y * 30
    then "Lon hon"
    else
      if z == x * y * 30
        then "Bang"
        else "Nho hon"

-- Question 2
-- Prelude:
-- We use the function `show :: a -> String` to transform any type into a String.
-- So `show 3` will produce `"3"` and `show (3 > 2)` will produce `"True"`.

-- In the previous function, return the excess/savings of consumption as part of the message.

coms2 :: Double -> Double -> Double -> [Char]
coms2 x y z =
  let diff x y z = z - x * y * 30
   in if z > x * y * 30
        then "Lon hon gia tri gioi han la " ++ show (diff x y z)
        else
          if z == x * y * 30
            then "Bang gia tri gio han"
            else "Nho hon gia tri gioi han la " ++ show (abs (diff x y z))

-- Question 3
-- Write a function that showcases the advantages of using let expressions to split a big expression into smaller ones.
-- Then, share it with other students in Canvas.
--Tinh dien tich hinh vien phan: dau vao la ban kinh x va so do goc y
dienTichVienPhan :: Double->Double->Double
dienTichVienPhan x y=
  let dienTichHinhQuat x y = x*x*pi*y/360
      dienTichTamGiac x y = (x*x*sin(pi*y/180))/2
   in dienTichHinhQuat x y-dienTichTamGiac x y


-- Question 4
-- Write a function that takes in two numbers and returns their quotient such that it is not greater than 1.
-- Return the number as a string, and in case the divisor is 0, return a message why the division is not
-- possible. To implement this function using both guards and if-then-else statements.
quotient :: Double->Double-> [Char]
quotient x y
 | y==0 = "Can not divide!"
 | y /= 0 = if x/y<1 
              then show (x/y)
              else "quotient greater than 1"

-- Question 5
-- Write a function that takes in two numbers and calculates the sum of squares for the product and quotient
-- of those numbers. Write the function such that you use a where block inside a let expression and a
-- let expression inside a where block.
sumOfSquares :: Double -> Double -> [Char]
sumOfSquares x y = if y /= 0
                    then show (prods x y + qouts x y)
                   else   "Can not calculate"    
  where
    prods x y = (x*y)^2
    qouts x y =
      let check y= if y /= 0 then True else False
      in if check y == True 
          then (x/y)^2
          else 0