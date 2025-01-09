t1 = (
    [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
    ]
)

t2 = (
    [
        [1, 2, 3, 4, 5],
        [6, 7, 8, 9, 10],
        [11, 12, 13, 14, 15],
        [16, 17, 18, 19, 20],
        [21, 22, 23, 24, 25]
    ]
)

t = t2

print(sum(list(map(sum, [[1,2],[2,3], [9, 11]]))))


def count(chessBoard):
    t = chessBoard
    n = len(t) # dimensao tabuleiro
    c_list = list(range(2, n+1)) # dimensao das possibilidades de agrupamento
    # c_list = [2]

    contador = {}

    for c in c_list:
        for i, linha in enumerate(t):
            if (n - i) >= c: # ultima linha de pivots
                for j, square in enumerate(linha):
                    if (n - j) >= c: # ultima coluna de pivots
                        # pivot^i,j

                        # t[i][j]   + t[i][j+1]   ... t[i][j+(c-1)]
                        # t[i+1][j] + t[i+1][j+1] ... t[i+1][j+(c-1)]
                        # .
                        # .
                        # .
                        # t[i+(c-1)][j] + ...         t[i+(c-1)][j+(c-1)]

                        linhaC = [[t[I][J] for J in range(j, (j + c))] for I in range (i, (i + c))]
                        if sum(list(map(sum, linhaC))) == sum(list(map(len, linhaC))):
                            if c not in contador.keys():
                                contador[c] = 1
                            else:
                                contador[c] += 1
    return contador

count(t2)
