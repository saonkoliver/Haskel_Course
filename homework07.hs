-- Question 1
-- Investigate the `Bounded` type class. What behaviours it provides?
{-
Lớp kiểu của Bound có giới hạn trên và giới hạn dưới, có thể được kiểm
tra bằng cách sử dụng các hàm minBound và maxBound.
minBound và maxBound rất đáng quan tâm vì chúng có một kiểu (Bounded
a) => a. Theo nghĩa nào đó, chúng là hằng số đa hình [theo nghĩa có thể biến hình
vào kiểu nào cũng được].
Tất cả các bộ cũng là thành viên của Bounded nếu như các thành phần trong bộ
là thành viên thuộc lớp này:
-}

-- Question 2
-- The types Int and Word bellong to the same type classes. What is the difference
-- between them? Check maybe the maxBound and minBound parameter for both types.
{-
Cùng là số nguyên: Int là kiểu nguyên, Word là kiểu số tự nhiên
maxBound :: Int
9223372036854775807

minBound :: Int
-9223372036854775808

minBound :: Word
0
maxBound :: Word
18446744073709551615

-}

-- Question 3
-- Investigate the `Enum` type class. What behaviours provides?
{-
Các phần tử của Enum là những kiểu được đánh thứ tự lần lượt — chúng có
thể đếm được (enumerate). Ưu điểm chính của lớp Enum là chúng ta có thể dùng
các kiểu của nó làm dãy danh sách. Chúng cũng định nghĩa sẵn các đối tượng liền
sau và liền trước, mà ta có thể nhận được lần lượt bằng cách gọi
hàm succ và pred.
Các kiểu trong lớp này gồm:
(), Bool, Char, Ordering, Int, Integer, Float và Double.
-}

-- Question 4
-- Add type signatures to the functions below and use type variables and type classes.
-- Then uncomment the functions and try to compile.


-- Question 5
-- Investigate the numeric type classes to figure out which behaviors 
--they provide to change between numeric types.
{-

Num là một lớp kiểu số. Các thành viên của nó có thuộc tính là khả năng giữ vai
trò của con số. Ta hãy xét kiểu của một con số:
Dường như là các số nguyên cũng là hằng số đa hình. Chúng có thể đóng vài
trò của bất kì kiểu nào thuộc lớp Num (Int, Integer, Float, or Double)

Ví dụ, chúng ta có thể kiểm tra kiểu của toán tử *:
ghci> :t (*)
(*) :: (Num a) => a -> a -> a

Nó nhận vào hai số cùng kiểu rồi trả lại một số cũng kiểu đó. Điều này lý giải tại
sao (5 :: Int) * (6 :: Integer) sẽ gây ra lỗi về kiểu trong khi 5 * (6
:: Integer) thì lại được và ra kết quả là một Integer vì 5 có thể đóng vai trò
là một Integer hoặc Int.
Để gia nhập lớp Num, một kiểu phải là “bạn” sẵn với Show và Eq.
-}
