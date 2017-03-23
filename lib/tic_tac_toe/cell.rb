module TicTacToe
  class Cell
    attr_reader :id, :mark

    def initialize(id, mark = nil)
      @id = id
      @mark = mark
    end

    def insert(mark)
      unless @mark.nil?
        message = "The cell ##{id} already contains a mark. Choose another."
        raise RuntimeError.new(message)
      else
        @mark = mark
      end
    end
  end
end
