class Cell
    attr_reader :content
    def initialize(content)
      @content = content
    end

    def change_content(new_content)
      @content = new_content
    end

    def get_content
      self.content
    end
end
