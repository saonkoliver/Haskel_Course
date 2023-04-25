
import Data.List
import System.CPUTime (getCPUTime)
import System.Directory(doesDirectoryExist, doesFileExist, listDirectory)
import Text.XHtml (thead)
import System.FilePath --((</>))

{-
We imported some functions that you'll need to complete the homework.
FilePath is just a synonym for String. Although, make sure to follow the standard path
representation when using them (https://en.wikipedia.org/wiki/Path_(computing).
getCPUTime    :: IO Integer
doesDirectoryExist :: FilePath -> IO Bool
listDirectory :: FilePath -> IO [FilePath]
You can hover over the functions to know what they do.
-}

{-
-- Question 1 --
Define an IO action that counts the number of files in the current directory
and prints it to the terminal inside a string message.
-}

-- listFiles :: IO ()
{-import System.Directory (doesDirectoryExist, listDirectory)
import System.FilePath ((</>))-}
countFiles :: [FilePath] -> IO Int
countFiles  [] = return $ 0
countFiles (x:xs) = do
  isDiretory <- doesDirectoryExist x
  if not isDiretory 
    then do
      c <- countFiles xs
      return $ 1 + c
    else do
      countFiles xs

      
countFilesInCurrentDirectory :: IO ()
countFilesInCurrentDirectory = do 
  isTrue <- doesDirectoryExist "."
  if isTrue 
    then do      
      files <- listDirectory "."
      --let numFiles = length $ filter (\f -> notElem f [".", ".."]) files
      numFiles <- countFiles files
      putStrLn $ "The current directory contains " ++ show numFiles ++ " files."
    else do
      putStrLn $ "The current directory contains zero files."
  
  
--import System.Directory (listDirectory)
--import System.FilePath ((</>))

listFiles :: IO ()
listFiles = do
  files <- listDirectory "."
  --let numFiles = length $ files
  let numFiles = length $ filter (\f -> notElem f [".", ".."]) files
  putStrLn $ "The current directory contains " ++ show numFiles ++ " files."
  putStrLn $ show files
{-
-- Question 2 --
Write an IO action that asks the user to type something, then writes the message
to a file called msg.txt, and after that, it reads the text from the msg.txt
file and prints it back. Use the writeFile and readFile functions.
-}

createMsg :: IO ()
createMsg = do
  putStr "Type a message: "
  message <- getLine
  writeFile "msg.txt" message
  putStrLn "Message saved to msg.txt"
  savedMessage <- readFile "msg.txt"
  putStrLn $ "The saved message is: " ++ savedMessage


{-
-- Context for Questions 3 and 4 --
In cryptography, prime numbers (positive integers only divisible by themselves and 1) play a fundamental
role in providing unbreakable mathematical structures. These structures, in turn, are leveraged to
establish secure encryption.
But, generating primes is a computational straining problem, as we will measure in the following exercise.
This is because, to know whether a number is a prime number, you first need to know all the previous primes
and then check that they are not a divisor of this number. So, this problem gets bigger and bigger!
Our lead cryptographer provided us with 3 different algorithms (primes1, primes2, and primes3). All three
correctly produce a list of all the prime numbers until a limit (that we provide as a parameter).
Our job is not to understand these algorithms but to measure which is the fastest and print the largest
prime number below our limit. Do it step by step, starting with question 3.
-}

primes1 :: Integer -> [Integer]
primes1 m = sieve [2 .. m] 
 where
  sieve [] = []
  sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p > 0]

primes2 :: Integer -> [Integer]
primes2 m = sieve [2 .. m]
 where
  sieve (x : xs) = x : sieve (xs \\ [x, x + x .. m])
  sieve [] = []

primes3 :: Integer -> [Integer]
primes3 m = turner [2 .. m]
 where
  turner [] = []
  turner (p : xs) = p : turner [x | x <- xs, x < p * p || rem x p /= 0]

{-
-- Question 3 --
Define an IO action that takes an IO action as input and calculates the time it takes to execute.
Use the getCPUTime :: IO Integer function to get the CPU time before and after the IO action.
The CPU time here is given in picoseconds (which is 1/1000000000000th of a second).
-}

printPrimes1 :: IO ()
printPrimes1 = do
  putStr "Type a number: "
  getN <- getLine
  let num = read getN :: Integer
  putStrLn $ show (num)  
  let myList = primes1 num
  putStrLn $ show myList

printPrimes2 :: IO ()
printPrimes2 = do
  --putStr "Type a number: "
  --getN <- getLine
  --let num = read getN :: Int
  --putStrLn $ show (n)  
  --let myList = primes1 n 
  putStrLn $ show (primes2 (15000))

printPrimes3 :: IO ()
printPrimes3 = do
  --putStr "Type a number: "
  --getN <- getLine
  --let num = read getN :: Int
  --putStrLn $ show (n)  
  --let myList = primes1 n 
  putStrLn $ show (primes3 (15000))


printPrimes :: (Integer -> [Integer]) -> IO ()
printPrimes primes = do
  putStr "Type a number: "
  getN <- getLine
  let num = read getN :: Integer
  putStrLn $ show (num)  
  let myList = primes num
  putStrLn $ show myList


--import System.CPUTime ()
timeIO :: IO a -> IO (Double)
timeIO action = do
  startTime <- getCPUTime
  _ <- action
  endTime <- getCPUTime
  let diff = fromIntegral (endTime - startTime) / (10 ^ 12)
  return diff

  -- timeIO $ printPrimes primes1
-- 1: 0.265625; 2: 2.9375; 3: 0.125
{-
-- Question 4 --
Write an action that retrieves a value from the standard input, parses it as an integer,
and compares the time all three algorithms take to produce the largest prime before the
limit. Print the number and time to the standard output.
-}
printPrimes' :: (Integer -> [Integer]) -> Integer -> IO ()
printPrimes' primes m = do  
  let myList = primes m
  putStrLn $ show $ last myList

benchmark :: IO() 
benchmark = do
  putStr "Type a number: "
  getN <- getLine
  let num = read getN :: Integer
  startTime <- getCPUTime
  _ <- printPrimes' primes1 num
  endTime <- getCPUTime
  let diff1 = fromIntegral (endTime - startTime) / (10 ^ 12)
  putStrLn $ show (diff1)
  startTime <- getCPUTime
  _ <- printPrimes' primes2 num
  endTime <- getCPUTime
  let diff2 = fromIntegral (endTime - startTime) / (10 ^ 12)
  putStrLn $ show (diff2)
  startTime <- getCPUTime
  _ <- printPrimes' primes3 num
  endTime <- getCPUTime
  let diff3 = fromIntegral (endTime - startTime) / (10 ^ 12)
  putStrLn $ show (diff3)

{-
 -- Question 5 -- EXTRA CREDITS -- (In case the previous ones were too easy)
Write a program that prints the directory tree structure from the current folder.
Below you can see an example output of how such a structure looks like:
.
├── foo1.hs
├── foo2.hs
├── bar1
    ├── bar2
    ├── foo3.hs
    ├── foo4.hs
    └── bar3
        └── foo5.hs
└── bar5
    ├── bar6
    ├── foo6.hs
    └── foo7.hs
HINT: You can use the function doesDirectoryExist, which takes in a FilePath and returns
True if the argument file exists and is not a directory, and False otherwise.
-}

--import System.Directory (listDirectory, doesDirectoryExist)
--mapM_ function to print each element 
--mapM_ là một hàm bậc cao hơn trong Haskell lấy một hàm và một danh sách, và áp dụng hàm cho từng phần tử của danh sách theo trình tự. Trong trường hợp này, nó lấy hàm và danh sách, và áp dụng hàm cho từng phần tử của danh sách.
--map is a higher-order function in Haskell that takes a function and a list as arguments, and applies the function to each element in the list, returning a new list with the results.
--checkDirectory :: FilePath -> IO()
--checkDirectory [] = []
--checkDirectory = do
  printDirStruct :: IO ()
  printDirStruct = printItemsSameLevel 0 "."
    where 
      printItemsSameLevel :: Int -> FilePath -> IO ()
      printItemsSameLevel level path = do
        filesAndFolders <- listDirectory path
        
        if null filesAndFolders
          then return ()
          else do
            let firstItems = init filesAndFolders
                lastItem = last filesAndFolders
                
                preSpace = replicate (4 * level) ' '
                
                normalBranch = "├── "
                endBranch    = "└── "
  
                printItemAndInside :: String -> String -> IO()
                printItemAndInside branchLine itemName = do
                  putStrLn $ preSpace ++ branchLine ++ itemName -- print item itself
                  -- check if this item is a file or folder
                  let fPath = path ++ "/" ++ itemName
                  isFile <- doesFileExist fPath
                  if isFile 
                      then return ()  -- item is a file
                      else printItemsSameLevel (level + 1) fPath -- item is a folder, recruise for all sub-items inside
            
            -- print structure for first items
            mapM_ (printItemAndInside normalBranch) firstItems
            -- print structure for last item
            printItemAndInside endBranch lastItem

{-
            printDirectoryTree :: FilePath -> IO ()
printDirectoryTree path = do
  isDirectory <- doesDirectoryExist path
  if isDirectory
    then do      
      putStrLn $ takeFileName path 
      files <- listDirectory path      
      let subPaths = map (\file -> path ++"/" ++ file) files
      mapM_ printDirectoryTree subPaths
    else putStrLn $ "|_" ++  takeFileName path
-}
{-
kiểm tra đường dẫn, nếu là thư mục, in tên thư mục
nếu chỉ có files thì in files
-}
    --printDirectoryTree "C:/Users/NguyenKimSao/Desktop/Test"
{-

printTree :: IO ()
printTree = do
  dir <- listDirectory "."
  printDirectoryTree dir
-}
