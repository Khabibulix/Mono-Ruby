## README:

README document is excellent. I didn't even make one lol. The only thing I
would like to have seen is a description of the project, something like "A
simple CLI game of tic-tac-toe where the user plays a game against the
computer", or something like that. You have something similar like this, under
"We want a console application that will ...", but these describe some of the
goals of the project and not a description of what the program is. But this is
a pedantic point. Excellent!

## Functionality:

Great work on the general game logic. While playing the game in the terminal, I
found your instructions to be clear and readable. There are a few things that I
thought could be improved, however these are all very minor.

1. When you prompt the user to choose their symbol, I am able to type an
   arbitrarily long string, which the game allows. For example, I typed 'asdf'
   as my symbol, and the grid printed this after the first move:
    ```
    asdf . .
    . . .
    . . .
    ```
2. I was testing whether the diagonal-wins work. The Top-Left to Bottom-Right
   diagonal worked, but the opposite ont (top-right to bottom-left) did not.
   Here is the output of one of the games that didn't work:
   ```
   Grid is currently like this:
   X . 1
   . 1 X
   1 . X

   Please enter the row of the cell you want to play
   ```
   (My symbol was `1`). But this one did:
   ```
   Please enter the row of the cell you want to play
   3
   Please enter the column of the cell you want to play
   3
   1 . X
   . 1 .
   . X 1
   You won, congratulations
   ```

3. There are no instructions at the beginning of the game that tell the user
   which numbers are allowable as rows/columns. This is very minor however, and
   the game tells us (after we input an incorrect number) to enter a number
   between 1 and 3. Good job handling this detail. 

4. When the user is prompted to enter the row/column number, the input is
   displayed on the next line. Again very minor, but I think it would be more
   intuitive if the input prompt was displayed on the same line as the prompt
   that asks us to enter and number. You can accomplish this like this:

    ```ruby
    print('Please enter the row of the cell you want to play: ')
    gets.chomp
    ```

    I haven't read your code yet but I assume you did `puts('Please...')` and
    then `gets`, however `puts` adds a newline character at the end, and
    `print()` does not add the new line. Again, extremely minor and does not
    affect the functionality of the game. (More of a personal preference)

Apart from the first and second points, your code seems to accomplish the
requirements of the project and the user interface is clean and readable.

## Cell.rb
I like this class. Very simple. Provides a clean interface for `Grid` to
get/set the contents of each cell in the display. The method `get_content` is
however redundant because you already have `attr_reader`. This class could be
simplified even further by using `attr-accessor` instead of reader. With the
accessor, you automatically get getter/setter methods without having to define
your own. In this case, the class would become 
```ruby
class Cell
  attr-accessor :content
  def initalize(content)
    @content = content
  end
end
```
and we could read `content` by doing `cell_instance.content` and set it using
`cell_instance.content = 'X'`.

The simplicity/brevity of this class makes me think that its existence might be
unjustified if we instead set up the structure (and methods) of the grid data
to accomodate easy access to each cell. But then again, doing this would
increase the complexity of the `Grid` class which we might not want to do. Just
something to think about.
    -- After going through Grid.rb and Game.rb, I understand why you made the
    Cell class. With each Cell its own object you can easily modify them
    without having to keep track of its position within the grid. Excellent 
    work!

In terms of style, everything is perfect except for the method names and
indentation. Apparently we are supposed to name out setter methods like
`def content=(new_content)`, which just let's us do
`cell_instance.content = 'X'`. It's a bit of syntactic sugar I believe and I
personally don't like it lol but in general people will opt for
`attr_reader/writer/accessor` for getters/setters. As for indentation, the ruby
way is 2 spaces. IMO 2 space indentation is ludicrous, but the whole point of
ruby is to be unoppinionated about such things and adhere to community
standards. Of course this is entirely inconsequential lol, so do what your
heart wills.

## Grid.rb
A few notes on style:

- again, try to use 2 space indentation (if only to not offend ruby
  enthusiasts)

- the only time we should include open/close parentheses is when they are
  absolutely necessary, i.e. when we define a method with parameters or call a
  method with arguments. When defining/calling 0-ary functions (functions
  without parameters), we 'should' omit the empty parentheses. (When I first
  encountered this I thought it was ludicrous but this is the ruby way :P)

In general, your code was very readable. I like all of the interfaces (methods)
you have included in this class. They are all named appropriately, and without
even looking at the code I could easily guess what they do. The logic of each
function is also very clear and simple. I like that you made `create_grid`
private, as it is the only method that needs to be private. The data structure
you chose for the grid was the right one :P. I also like that you use `attr-reader` (I see a lot of ppl using `attr_accessor` which is unnecessary).

I only have 2 criticisms here:

1. Don't use for loops. It is generally 'looked down upon' to use for loops in
   Ruby because the loop variable in for loops is bound to the enclosing scope.
   So if I did `for i in 0..10`, after the loop finishes executing, the
   variable `i` is still accessible after the loop and is equal to the value
   `10` (this is the same as python if I'm not mistaken). Instead, opt for
   `#each`, `#each_with_index`, `#each_index`, `#map`, `#filter`, `#reduce`,
   etc. I will add some comments in your code to show you some idiomatic Ruby
   things.

2. Prefer accessing instance variables through `@instance_variable` over using
   `self.instance_variable`, and  use `self` only when necessary. I think the
   reason why is because when we access `self.thing` inside an instance method,
   Ruby tries to access an instance method, and not an instance variable. iirc
   the ruby style guide urges us to use self only when required, which is when
   we define class methods, when we need to call a setter method from inside
   the class, or when we name a method that over-rides a reserved keyword (like
   if we did `def to_s`). So for example in `display_grid`, `clear_the_grid`,
       and `get_empty_cells`, you can replace `self.grid` with `@grid` and the
       functionality of the code should be unchanged.

I have also added a few notes in the code for you to check out. Overall, the
class is very well written in my opinion. The complexity is quite low and it 
provides exactly the right amount of 
## Game.rb
