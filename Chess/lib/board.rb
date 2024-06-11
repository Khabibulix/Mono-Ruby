class Board
    attr_reader :width, :height, :grid
    def initialize(width=8)
        @width = width
        @height = width
        @grid = create_grid
    end

    def create_grid
        Array.new(@width) {Array.new(@width, ".")}
    end
end