# ConnectFour.py
import numpy as np
import sys

class player:
    def __init__(self, name, symbol):
        self.name = name
        self.symbol = symbol

def droppiece(playeer):
    position = int(input("{}: Drop your piece in the desired position: 1 2 3 4 5 6 7".format(playeer.name))) - 1
    try:
        row_position = np.where(table[:, position] == "-")[0][-1]
    except: #Computer throws an exception if the position is not valid:
        print("Column full or invalid position! Program will end because of the error. Please start again.")
        sys.exit()
    table[row_position, position] = "{}".format(playeer.symbol)

def showtable():
    for x in range(rows_table):
        print(" ".join(table[x]))

#Set up the table and players for the game:
table = np.array([["-", "-", "-", "-", "-", "-", "-"]] * 6)
rows_table = np.size(table, axis = 0)
columns_table = np.size(table, axis = 1)
player1 = player("Player 1", "x")
player2 = player("Player 2", "o")

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
    droppiece(player1)
    showtable()

    #Second player drops their piece:
    droppiece(player2)
    showtable()

print("Game ended!")