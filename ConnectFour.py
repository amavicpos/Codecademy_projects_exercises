# ConnectFour.py
import numpy as np

table = np.array([["-", "-", "-", "-", "-", "-", "-"], ["-", "-", "-", "-", "-", "-", "-"], ["-", "-", "-", "-", "-", "-", "-"], ["-", "-", "-", "-", "-", "-", "-"], ["-", "-", "-", "-", "-", "-", "-"], ["-", "-", "-", "-", "-", "-", "-"]])
rows_table = np.size(table, axis = 0)
columns_table = np.size(table, axis = 1)

while True:
    continue_or_not = input("Did someone win?: Answer with \"Yes\" or \"No\" ")
    if continue_or_not.lower() == "yes":
        break
    if continue_or_not.lower() == "no":
        pass
    else:
        print("Answer not valid. Please answer with \"Yes\" or \"No\"")
        continue

    position1 = int(input("Player 1: Drop your piece in the desired position: 1 2 3 4 5 6 7")) - 1
    row_position1 = np.where(table[:, position1] == "-")[0][-1]
    table[row_position1, position1] = "x"

    for x in range(rows_table):
        print(" ".join(table[x]))

    position2 = int(input("Player 2: Drop your piece in the desired position: 1 2 3 4 5 6 7")) - 1
    row_position2 = np.where(table[:, position2] == "-")[0][-1]
    table[row_position2, position2] = "o"

    for x in range(rows_table):
        print(" ".join(table[x]))

print("Game ended!")