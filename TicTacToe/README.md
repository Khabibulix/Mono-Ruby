First "big" project in Ruby using OOP principles.

Credits: The Odin Project, there: 
https://www.theodinproject.com/lessons/ruby-tic-tac-toe

We want a console application that will:
<pre>
. Display a game of Tic Tac Toe
. Update the grid using user inputs
. Respect the OOP principles
</pre>

<h2>How to launch</h2><br>
Go in main directory and type:
<pre>ruby .\Game.rb</pre>

<h2>Main structure of program</h2><br>

I have 3 classes:
<pre>
. First one is Cell that only have a content that is editable.

. Second one is Grid that has access to Cell. A Grid has a @width and its methods are:
    .Display_grid: Print the grid for user in console

    .Get_cell: Standard_getter to grab content of cell

    .Get_rows: Return all 3 rows in a 3d array

    .Get_cols: Return all 3 cols in a 3d array

    .Get_diagonals: Return all 2 diagonals in a 3d array

    .Edit_the_grid: Simple setter that take row (Integer) col (Integer) and content (String) in parameters

    .Clear_the_grid: Self explanatory, reset the grid.

    .Create_the_grid: Create a 3d array of Cells using the width in parameter

    .Get_empty_cells: Grab all empty cells for computer to randomize choice next

    .Is_grid_full: Boolean that will be useful for checking the end of the game

.Last one is Game that will contain the main loop for game, currently in progress but a Game has a @grid and existing methods are:
    .Play_the_game: Main logic here, with turns between player and computer, call for victory and end of game
    .Prepare the game: Only runs at the beginning of the program, call these two methods: 
        .Get_symbol_for_player: Let the player choose his symbol for the game, strip it if too long
        .Check_for_player_symbol_and_computer_symbol_inequality: Self explanatory, if by bad luck the symbols are the same we change computer one.
    .Asking_for_input_for_player: We ask for coordinates for cell that will be modified
    .Is_input_valid_for_player: We check if coordinates asked are not sh**
</pre>
