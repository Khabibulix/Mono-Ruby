Before-last project for Ruby Section of The Odin Project.

Credits:
https://www.theodinproject.com/lessons/ruby-connect-four


h2>How to launch</h2><br>
Go in main directory and type:
<pre>ruby .\main.rb</pre>

<h2>How the project is organized</h2><br>
My sourcecode is in <em>lib</em> folder and contains four files: <br>
<br>
<pre>
    . board.rb
    . game.rb
    . node.rb
    . player.rb
</pre> <br>

The <em>spec</em> folder contains all tests for these files.

<h2>Which do what</h2>
 <br>
 <h3>Board</h3>

 In <em>Board</em> you will find methods to create the grid, add to the grid, display the grid and check for victory.

 <br>

 To check for victory, I choosed to:
 <ol>
    <li>Grab all-non empty nodes that contains the symbol searched</li>
    <li>Check for each node in this array-shaped data-structure</li>
    <li>Populating a hash where key is the row or the column number</li>
    <li>Check all values for key and sees if it matches</li>
 </ol>

  <h3>Game</h3>

   In <em>Game</em> you will find all input/output and computer logic for the game. The logic is just randomized, not an intelligent player that will detect if you are about to win.

   
<h2>How this project made me better</h2>

I learned a lot about <em>TDD</em> and about <em>Rspec</em>. At the half of the project I encountered some strange bugs (spoiler: caused by dumb typos) and a step-back with TDD helped me out.

