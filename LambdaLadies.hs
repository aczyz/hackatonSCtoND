-- | Formuła
data Form = V Int       -- zmienna
          | F           -- falsum
          | C Form Form -- koniunkcja
          | D Form Form -- alternatywa
          | I Form Form -- implikacja
          | N           -- null, pusty kontekst
          deriving(Eq, Read, Show)
{-
instance Show Form where
    show (V i)   = "V" ++ show i
    show F       = "F"
    show (C a b) = show a ++ " ^ " ++ show b
    show (D a b) = show a ++ " v " ++ show b
    show (I a b) = show a ++ " -> " ++ show b
-}
-- | Sekwent - pierwszy element pary zawiera formuły, które znajdują się po 
-- lewej stronie sekwentu, drugi element pary zawiera formuły, które 
-- znajdują się po prawej stronie sekwentu
type Seq = ([Form], [Form])

-- | Typ przejsciowy -- ?
type ND = [(Form, Form)]

-- | Reguła SC - pierwszy element pary zawiera formuły, które znajdują się 
-- w przesłance, drugi element pary zawiera formuły, które znajdują się we 
-- wniosku 
type RuleSC = ([Seq], Seq)

-- | Reguła ND - pierwszy element pary zawiera formuły, które znajdują się 
-- w przesłance, drugi element pary zawiera formuły, które znajdują się we 
-- wniosku 
type RuleND = (ND, ND)


--f :: RuleSC -> RuleND
--f 
{-
cRec :: RuleSC -> RuleND
cRec ((x:xs, ys), (z:zs, as)) = case xs of
    [] -> cElim ((x:xs, ys), (z:zs, as))
    _  -> cIntr ((x:xs, ys), (z:zs, as))
-}
merge :: Seq -> ND
merge ([], _)       = []
merge ((x:xs), [y]) = [(x, y)] ++ merge (xs, [y])

swap' :: RuleND -> RuleND
swap' (x, y) = (y, x)

cIntr :: RuleSC -> RuleND
cIntr ([(xs, [y])], (zs, [a])) = (merge (xs, [y]), merge (zs, [a]))

cElim1 :: RuleSC -> RuleND
cElim1 ([(xs, [y])], (zs, [a])) = (merge (xs, [y]), [(head zs, a)])

cElim2 :: RuleSC -> RuleND
cElim2 ([(xs, [y])], (zs, [a])) = (merge (xs, [y]), [(head $ tail zs, a)])

dIntr1 :: RuleSC -> RuleND
dIntr1 s = swap' (cElim1 s)

dIntr2 :: RuleSC -> RuleND
dIntr2 s = swap' (cElim2 s)

mergeRec :: [Seq] -> [ND]
mergeRec []     = []
mergeRec (x:xs) = merge x : mergeRec xs

dElim :: RuleSC -> RuleND
dElim (xs, (ys, zs)) = (concat (mergeRec xs), merge (ys, zs))


p1 :: RuleSC
p1 = ([([V 1, V 2], [N])], ([C (V 1) (V 2)], [N]))

p2 :: RuleSC
p2 = ([([C (V 1) (V 2)], [N])], ([V 1, V 2], [N]))

p3 :: RuleSC
p3 = ([([V 1], [N]), ([V 1], [N])],([D (V 1) (V 2)], [N]))