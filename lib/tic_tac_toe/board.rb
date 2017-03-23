module TicTacToe
  class Board
    MAP = {
      1 => [0, 0],
      2 => [0, 1],
      3 => [0, 2],
      4 => [1, 0],
      5 => [1, 1],
      6 => [1, 2],
      7 => [2, 0],
      8 => [2, 1],
      9 => [2, 2]
    }.freeze

    WIN_COMBOS = [
      [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]
    ].freeze

    attr_reader :grid

    def initialize
      create_board
    end

    def print
      rendered_rows =
        @grid.map do |row|
          row.map { |cell| cell.mark.nil? ? cell.id : cell.mark}.join(' | ')
        end

      puts
      puts rendered_rows.join("\n--+---+--\n")
    end

    def process_move(move)
      row, col = MAP[move[:id]]
      @grid[row][col].insert(move[:mark])
    end

    def game_over
      return :win if winner?
      return :tie if tie?
      false
    end

    private

    def create_board
      @grid = Array.new(3) { Array.new(3) }
      MAP.each { |id, i| @grid[i[0]][i[1]] = Cell.new(id) }
    end

    def winner?
      WIN_COMBOS.each do |combo|
        next if all_empty?(combo)
        return true if all_same?(combo)
      end

      false
    end

    def all_empty?(combo)
      combo.all? do |cell|
        row, col = MAP[cell]
        @grid[row][col].mark.nil?
      end
    end

    def all_same?(combo)
      first = @grid[MAP[combo[0]][0]][MAP[combo[0]][1]].mark

      combo.all? do |cell|
        row, col = MAP[cell]
        @grid[row][col].mark == first
      end
    end

    def tie?
      @grid.flatten.map { |cell| cell.mark }.none? { |cell| cell.nil? }
    end
  end
end
