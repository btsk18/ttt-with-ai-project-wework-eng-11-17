class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(i)
    @cells[i.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    @cells.count { |x| x != " " }
  end

  def taken?(i)
    @cells[i.to_i - 1] != " "
  end

  def valid_move?(i)
    int = i.to_i
    int >= 1 && int <= 9 && taken?(i) == false
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end
end
