import Data.Char
import System.IO
import LambdaLadies
{-

strlen :: IO ()
strlen = do putStr "Wybierz regułę w rachunku sekwentów: \n 1 : lewa koniunkcja \n 2 : prawa koniunkcja \n 3 : lewa alternatywa \n 4 : prawa alternatywa \n 5 : lewa implikacja \n 6 : prawa implikacja \n 7 : falsum \n Wybierz formułę (podaj liczbę): "
            xs <- getLine
<<<<<<< HEAD
            if xs == "1" then
                putStr "The string has "
            else putStrLn (show (cIntr p1) :: String)
             putStr "The string has "
            putStr (show (length xs))
            putStrLn " characters"
-}

main :: IO ()
main = do
    putStrLn (" Wybierz regułę w rachunku sekwentów: \n 1 : lewa koniunkcja \n 2 : prawa koniunkcja \n 3 : lewa alternatywa \n 4 : prawa alternatywa \n 5 : lewa implikacja \n 6 : prawa implikacja \n 7 : falsum \n Wybierz formułę (podaj liczbę): ")
    xs <- getLine
    let xs2 = trans xs
    let xs3 = f2 xs
    putStrLn ("wybrałeś " ++ xs2)
    putStrLn ("Twoja formuła w rachunku sekwentów ma postać:" ++ f2 xs)


trans :: String -> String
trans x = case x of
        "1" -> "lewą koniunkcję"
        "2" -> "prawą koniunkcję"
        "3" -> "lewą alternatywę"
        "4" -> "prawą alternatywę"
        "5" -> "lewą implikację"
        "6" -> "prawą implikację"
        "7" -> "falsum"

f2 :: String -> String
f2 x = case x of
  "1" -> "([([V 1, V 2], [N])], ([C (V 1) (V 2)], [N]))"
  "2" -> "([([V 1, V 2], [N])], ([C (V 1) (V 2)], [N]))"
  "3" -> "([([V 1, V 2], [N])], ([C (V 1) (V 2)], [N]))"
  "4" -> "([([V 1, V 2], [N])], ([C (V 1) (V 2)], [N]))"
  "5" -> "([([V 1, V 2], [N])], ([C (V 1) (V 2)], [N]))"
  "6" -> "([([V 1, V 2], [N])], ([C (V 1) (V 2)], [N]))"
  "7" -> "([([V 1, V 2], [N])], ([C (V 1) (V 2)], [N]))"


