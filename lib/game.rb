require "pry"

class Game

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    filled_positions = @board.cells.count { |i| i != " "}
    return @player_1 if filled_positions % 2 == 0
    return @player_2
  end

  def over?
    return false if @board.cells.include?(" ") == true
    return true if @board.cells.include?(" ") == false || @board.cells.count { |i| i == "X" } == 3 || @board.cells.count { |i| i == "O" } == 3
    false
  end

  def won?
    WIN_COMBINATIONS.each { |combo|
        winning_combo = combo.map { |i| @board.cells[i] }
        return combo if winning_combo.uniq.length == 1 && !winning_combo.include?(" ")
    }
    return false
  end

  def draw?
    return false if won? || over? == false
    true
  end

  def winner
    return nil if won? == false
    binding.pry
    @board.cells[won?.first]

  end
end
