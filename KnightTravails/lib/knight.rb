class Knight
    attr_accessor :symbol, :x_pos, :y_pos
    def initialize(x_pos = 4, y_pos = 4)
        @symbol = "\u265E"
        @x_pos = x_pos
        @y_pos = y_pos
    end

    def move
        p "Nothing here for now"
    end
end
