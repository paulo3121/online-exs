module CountSquares (count) where

three = [
  [1,2,3],
  [1,1,6],
  [1,1,9]
  ]

five = [
  [1,1,1,1,1],
  [1,1,1,1,1],
  [1,1,1,1,1],
  [1,1,1,1,1],
  [1,1,1,1,1]
  ]

isSquareEmpty square
  | all (== 1) square = 1
  | otherwise = 0

getPieceByCors tabuleiro cors =
  let
    linha = head cors
    coluna = last cors
  in
    (tabuleiro !! linha) !! coluna

getSquares tabuleiro squareDimension pivot =
  let
    linhaPivot = head pivot
    colunaPivot = last pivot
    linhas = [linhaPivot..(linhaPivot + squareDimension - 1)]
    colunas = [colunaPivot..(colunaPivot + squareDimension - 1)]
    squareCors = sequence [linhas, colunas]
  in
    map (getPieceByCors tabuleiro) squareCors

getPivots tabuleiro tabuleiroDimension squareDimension =
  let
    lastPivotRowColumn = tabuleiroDimension - squareDimension
    linhas = zip [0..lastPivotRowColumn] tabuleiro
  in
    sequence [[0..lastPivotRowColumn],[0..lastPivotRowColumn]]

getCountSquareDimension tabuleiro tabuleiroDimension squareDimension =
  let
      pivots = getPivots tabuleiro tabuleiroDimension squareDimension
      squares = map (getSquares tabuleiro squareDimension) pivots
      countSquare =  sum (map isSquareEmpty squares)
      countSquareDimension = (squareDimension, countSquare)
  in
    countSquareDimension

count tabuleiro =
  let tabuleiroDimension = length tabuleiro
      squareDimensions = [2..tabuleiroDimension]
      countSquareDimension = map (getCountSquareDimension tabuleiro tabuleiroDimension) squareDimensions

  in
    filter (\(x, y) -> y > 0) countSquareDimension
