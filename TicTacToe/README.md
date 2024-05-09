First "big" project in Ruby using OOP principles.

Credits: The Odin Project, there: 
https://www.theodinproject.com/lessons/ruby-tic-tac-toe

We want a console application that will:
. Display a game of Tic Tac Toe
. Update the grid using user inputs
. Respect the OOP principles

<pre>
I have 3 classes:
. First one is Cell that only have a content that is editable.

. Second one is Grid that has access to Cell. A Grid has a @width and its methods are:
    .Display_grid: Print the grid for user in console
    .Get_cell: Standard_getter to grab content of cell
    .Clear_the_grid: Self explanatory, reset the grid.
    .Create_the_grid: Create a 3d array of Cells using the width in parameter
    .Get_empty_cells: Grab all empty cells for computer to randomize choice next
    .Is_grid_full: Boolean that will be useful for checking the end of the game

.Last one is Game that will contain the main loop for game, currently in progress but a Game has a @grid and existing methods are:
    .Get_symbol_for_player: Let the player choose his symbol for the game, strip it if too long
    .Check_for_player_symbol_and_computer_symbol_inequality: Self explanatory, if by bad luck the symbols are the same we change computer one.
    .Asking_for_input_for_player: We ask for coordinates for cell that will be modified
    .Is_input_valid_for_player: We check if coordinates asked are not sh**
</pre>
