module Codewars.Kata.SqIntoSq where

diminuidor :: [Int] -> [Int] -> Int -> Maybe [Int]
diminuidor fatoresUsados fatoresRestantes areaRestante
  | not (null fatoresRestantes) && areaRestante > maiorAreaRestante =  diminuidor (maiorFatorRestante : fatoresUsados) (init fatoresRestantes) (areaRestante-maiorAreaRestante)
  | not (null fatoresRestantes) && areaRestante <= maiorAreaRestante = diminuidor fatoresUsados (init fatoresRestantes) areaRestante
  | not (null fatoresUsados) && areaRestante > 0  = Just (1 : fatoresUsados)
  | null fatoresUsados && areaRestante > 0  = Just [1]
  | not (null fatoresUsados) && areaRestante == 0 = Just fatoresUsados
  | otherwise = Nothing
  where
    maiorFatorRestante = last fatoresRestantes
    maiorAreaRestante = maiorFatorRestante ^ 2

decompose n =
  diminuidor [] [1..n-1] (n^2)
