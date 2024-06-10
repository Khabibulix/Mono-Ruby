# frozen_string_literal: true

require_relative 'node'

class Board
  attr_accessor :total_size, :grid

  def initialize(columns = 7, rows = 6)
    @total_size = columns * rows
    @grid = create_grid
  end

  def create_grid
    grid = Array.new(6) { Array.new(7, '.') }
    grid.each_with_index do |row, row_index|
      row.each_with_index do |_cell, col_index|
        grid[row_index][col_index] = Node.new([row_index, col_index])
      end
    end
    grid
  end

  def add(column, symbol)
    array_column = []
    c = 0

    6.times do
      array_column.push(grid[c].values_at(column))
      c += 1
    end

    return grid[-1][column].value = symbol if array_column.all? { |node| node[0].value == '.' }

    row_of_last_empty_element = array_column.select { |e| e[0].value == '.' }[-1][-1].position[0]
    grid[row_of_last_empty_element][column].value = symbol if inside?([row_of_last_empty_element, column])
  end

  def get_non_empty_nodes
    result = []
    grid.each do |row|
      row.each do |cell|
        result.push(cell) if cell.value != '.'
      end
    end
    result
  end

  def separate_by_symbol(symbol)
    get_non_empty_nodes.select { |node| node.value == symbol }
  end

  def display
    @grid.each do |row|
      p row.map(&:value).join('  ')
    end
  end

  def clear
    @grid.each do |row|
      row.each do |cell|
        cell.value = '.'
      end
    end
  end

  def inside?(pos)
    return true if pos[0].between?(0, 5) && pos[1].between?(0, 6)

    false
  end

  def searching_for_victory_in_hash(hash, mode)
    temp_array = []
    hash.each_key do |key|
      next unless hash[key].length >= 4

      if mode == 'col'
        hash[key].each { |node| temp_array.push(node[0]) }
      else
        hash[key].each { |node| temp_array.push(node[1]) }
      end

      return true if temp_array.sort == temp_array[0].upto(temp_array[-1]).to_a
    end
    false
  end

  def checking_for_left_diagonal(pos, symbol)
    row = pos[0]
    col = pos[1]
    return false if col < 4

    # Bottom left diagonal computed
    if row < 2
      grid[row + 1][col - 1].value == symbol && grid[row + 2][col - 2].value == symbol && grid[row + 3][col - 3].value == symbol
    # Top left diagonal computed
    else
      grid[row - 1][col - 1].value == symbol && grid[row - 2][col - 2].value == symbol && grid[row - 3][col - 3].value == symbol
    end
  end

  def checking_for_right_diagonal(pos, symbol)
    row = pos[0]
    col = pos[1]
    return false if col > 4

    # Bottom right diagonal computed
    if row < 2
      grid[row + 1][col + 1].value == symbol && grid[row + 2][col + 2].value == symbol && grid[row + 3][col + 3].value == symbol
    # Top right diagonal computed
    else
      grid[row - 1][col + 1].value == symbol && grid[row - 2][col + 2].value == symbol && grid[row - 3][col + 3].value == symbol
    end
  end

  # populate_hash(hash_name, "row"/"col", "X")
  def populate_hash(hash, mode, symbol)
    array_to_check = separate_by_symbol(symbol)

    case mode
    when 'col'
      array_to_check.each do |node|
        hash[node.position[1]].push(node.position)
      end

    when 'row'
      array_to_check.each do |node|
        hash[node.position[0]].push(node.position)
      end
    end
    hash
  end

  def victory?(symbol)
    array_to_check = separate_by_symbol(symbol)
    return false if array_to_check.length < 4

    columns_hash = Hash.new { |h, k| h[k] = [] }
    rows_hash = Hash.new { |h, k| h[k] = [] }

    populate_hash(columns_hash, 'col', symbol)
    populate_hash(rows_hash, 'row', symbol)

    array_to_check.each do |node|
      return true if checking_for_left_diagonal(node.position, symbol)
      return true if checking_for_right_diagonal(node.position, symbol)
    end

    return true if searching_for_victory_in_hash(columns_hash, 'col')
    return true if searching_for_victory_in_hash(rows_hash, 'row')

    false
  end
end
