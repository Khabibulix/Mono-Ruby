# frozen_string_literal: true

class Player
  attr_accessor :symbols, :symbol, :adversary_symbol

  def initialize
    @symbols = %w[O X]
    @symbol = grab_symbol_and_delete_it
    @adversary_symbol = @symbols[0]
  end

  def grab_symbol_and_delete_it
    symbol_to_return = symbols.sample
    symbols.delete(symbol_to_return)
    symbol_to_return
  end
end
