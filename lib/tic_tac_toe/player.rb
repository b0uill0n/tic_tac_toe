module TicTacToe
  class Player
    attr_reader :name, :mark

    def initialize(name, mark)
      @name = name
      @mark = mark
    end

    def place(id)
      { id: id, mark: @mark }
    end
  end
end
