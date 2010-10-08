import itertools
numlist = [i for i in itertools.permutations(["1.0", "3.0", "4.0", "6.0"])]
oplist = [i for i in itertools.product(["+", "-", "/", "*"], repeat=3)]
#braclist = [i for i in itertools.permutations(["(", ")", "", "", "", "", "", ""])]
braclist = [
    ["(", "", "", ")", "", "", "", ""],
    ["(", "", "", "", "", ")", "", ""],
    ["", "", "(", "", "", ")", "", ""],
    ["", "", "(", "", "", "", "", ")"],
    ["", "", "", "", "(", "", "", ")"]
    ]
for i in numlist:
    for j in oplist:
        for b in braclist:
            try:
                expr = b[0] + i[0] + b[1] + j[0] + b[2] + i[1] + b[3] + j[1] + b[4] + i[2] + b[5] + j[2] + b[6] + i[3] + b[7]
                ans = eval(expr)
                if ans == 24.0: print expr
            except: pass
