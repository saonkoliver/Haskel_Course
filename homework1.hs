-- Question 1
-- Write a multiline comment below.
{-This is multiline comment
  We use curly bracket with a single dash to
    open and close multi-line comments
  In the case one-line comment, we only use a double dash
-}
-- Question 2
-- Define a function that takes a value and multiplies it by 3.
multipliesBy3 x= x * 3
-- Question 3
-- Define a function that calculates the area of a circle.
areaOfCircle r = pi * r^2 
-- Question 4
-- Define a function that calculates the volume of a cylinder by composing the previous function together with the height of the cylinder. 
volumeOfCylinder r h = h*areaOfCircle r
-- Question 5
-- Define a function that takes the height and radius of a cylinder and checks if the volume is greater than or equal to 42.
compareVol r h= volumeOfCylinder r h>42

   