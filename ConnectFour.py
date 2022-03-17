# ConnectFour.py
import numpy as np
import sys
def droppiece(player, player_symbol):
    position = int(input("{}: Drop your piece in the desired position: 1 2 3 4 5 6 7".format(player))) - 1
    try:
        row_position = np.where(table[:, position] == "-")[0][-1]
    except: #Computer throws an exception if the position is not valid:
        print("Column full or invalid position! Program will end because of the error. Please start again.")
        sys.exit()
    table[row_position, position] = "{}".format(player_symbol)

def showtable():
    for x in range(rows_table):
        print(" ".join(table[x]))

#Set up the table for the game:
table = np.array([["-", "-", "-", "-", "-", "-", "-"]] * 6)
rows_table = np.size(table, axis = 0)
columns_table = np.size(table, axis = 1)

while True:
    #Loops game until someone wins:
    continue_or_not = input("Did someone win?: Answer with \"Yes\" or \"No\": ")
    if continue_or_not.lower() == "yes":
        break
    if continue_or_not.lower() == "no":
        pass
    else:
        print("Answer not valid. Please answer with \"Yes\" or \"No\"")
        continue

    #First player drops their piece:
    droppiece("Player 1", "x")
    showtable()

    #Second player drops their piece:
    droppiece("Player 2", "o")
    showtable()

print("Game ended!")