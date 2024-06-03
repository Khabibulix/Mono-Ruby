class Grid
    attr_accessor :total_size
    def initialize(columns = 7, rows = 6)
        @total_size = columns * rows
    end
end