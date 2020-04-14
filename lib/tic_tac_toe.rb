class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(userinput)
  userinput.to_i - 1
  end

  def move(index, value = "X")
    @board[index] = value
  end

  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && position_taken?(index) == false
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip.to_i)
      if valid_move?(index) == true
        move(index, current_player)
        display_board
      else
        turn
      end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
      counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |winning_com|
      @board[winning_com[0]] == @board[winning_com[1]] &&
      @board[winning_com[1]] == @board[winning_com[2]] &&
      position_taken?(winning_com[0])
    end
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    if full? && !won?
      true
    end
  end

  def over?
    if won? || draw? || full?
      true
    end
  end

  def winner
    if champion = won?
      @board[champion.first]
    end
  end

  def play
    counter = 0
    while counter < 9
      turn
      counter += 1
    end
  end
end
