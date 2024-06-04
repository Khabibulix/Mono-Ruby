class Player
    attr_accessor :symbols, :symbol
    def initialize
        @symbols = ["\uff2f", "\u25ce"]
        @symbol = symbols.sample
    end
end


