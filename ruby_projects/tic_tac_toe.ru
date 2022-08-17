# frozen_string_literal: true

# Creates_the_board
class Board
  def initialize
    @board = [
      %w[1 2 3],
      %w[4 5 6],
      %w[7 8 9]
    ]
    @value = 0
    @symbol
  end
  attr_accessor :value

  def print_board
    @board.map.with_index do |row, idx1|
      row.map.with_index do |cell, idx2|
        if idx2 != 2
          print " #{cell} |"
        else
          print " #{cell} \n"
        end
      end
      print "---+---+---\n" if idx1 != 2
    end
  end

  def ary(value)
    @board.map do |row|
      row.map do |cell|
        cell = @symbol if value == cell.to_i
        cell
      end
    end
  end

  def play_move(symbol, value)
    @symbol = symbol
    @board = ary(value)
  end
end

# Takes_input_from_the_user
class HumanPlayer
  attr_reader :player_selection

  def initialize
    @player_selection
    @move_position
  end

  def get_selection
    puts 'Enter X | O'
    choice = gets.chomp.upcase
    if %w[X O].include?(choice)
      @player_selection = choice
    else
      puts 'ERROR:'
    end
  end

  def get_move
    puts "\nEnter Move position "
    @move_position = gets.chomp.to_i
  end
end

# Creates_a_computer_and_selects_values_at_random
class ComputerPlayer
  attr_reader :player_selection

  def initialize
    @player_selection
    @move_position
  end

  def selection(human_selection)
    @player_selection = human_selection == 'X' ? 'O' : 'X'
  end

  def get_move
    @move_position = rand(1..9)
  end
end

# Takes_input_and_plays_the_game
class Game
  def initialize
    @player1
    @player2
    @win_state = []
  end

  def start
    print 'Tic-Tac-Toe  '
    board = Board.new
    human = HumanPlayer.new
    computer = ComputerPlayer.new

    get_input(human, computer)
    board.print_board
    match(human, computer, board)
  end

  def get_input(player1, player2)
    @player1 = player1.get_selection
    @player2 = player2.selection(player1.player_selection)
  end

  def match(human, computer, board)
    if human.player_selection == 'X'
      puts "Player selects 'X';\nplayer recieves 1st Move: "
      start_iteration_with(board, human, computer)
    else
      puts "Player selects 'O';\nComputer recieves 1st Move: "
      start_iteration_with(board, computer, human)
    end
  end

  def start_iteration_with(board, player1, player2)
    # player_choice = player.player_selection
    i = 0
    while i < 9
      if i.even?
        play_round(board, player1)
      else
        play_round(board, player2)
      end
      i += 1
      # player_choice = player_choice == 'X' ? 'O' : 'X'
    end
  end

  def play_round(board, player)
    move = player.get_move
    if player.to_s.include?('HumanPlayer')
      board.play_move(@player1, move)
      puts "\nPlayer move #{move}\n"
    else
      board.play_move(@player2, move)
      puts "\nComputer move #{move}\n"
    end
    board.print_board
  end
end

game = Game.new
game.start

# board = Board.new
# human = HumanPlayer.new
# computer = ComputerPlayer.new

# board.print_board
# board.play_move(human.get_selection, human.get_move)
# computer.selection(human.player_selection)
# board.print_board
