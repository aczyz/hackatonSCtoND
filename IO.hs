import Data.Char
import System.IO
import LambdaLadies

strlen :: IO ()
strlen = do putStr "Wybierz regułę w rachunku sekwentów: \n 1 : lewa koniunkcja \n 2 : prawa koniunkcja \n 3 : lewa alternatywa \n 4 : prawa alternatywa \n 5 : lewa implikacja \n 6 : prawa implikacja \n 7 : falsum \n Wybierz formułę (podaj liczbę): "
            xs <- getLine
            if xs == "1" then
                putStr "The string has "
            else putStrLn (show (cIntr p1) :: String)