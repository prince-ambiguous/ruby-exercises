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
    @board.map.with_index do |row, idx|
      row.map.with_index do |cell, idx|
        if idx != 2
          print " #{cell} |"
        else
          print " #{cell} \n"
        end
      end
      print "---+---+---\n" if idx != 2
    end
  end

  def ary(_prm1, prm2)
    @board = Array.new(3) { Array.new(3) }
    @board.map.with_index do |row, idx_r|
      row.map.with_index do |cell, idx_c|
        cell = case idx_r
               when 0
                 idx_c + 1
               when 1
                 idx_c + 4
               else
                 idx_c + 7
               end
        cell = @symbol if prm2 == cell
        cell
      end
    end
  end

  def play_move(symbol, value)
    @symbol = symbol
    @value = value
    @board = ary(@symbol, @value)
  end
end

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
    puts 'Enter Move position '
    @move_position = gets.chomp.to_i
  end
end

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
    if human.player_selection == 'X'
      puts "Player selects 'X';\nplayer recieves 1st Move: "
      play_round(human, board)
    else
      puts "Player selects 'O';\nComputer recieves 1st Move: "
      play_round(computer, board)
    end

    board.print_board
  end

  def get_input(player1, player2)
    @player1 = player1.get_selection
    @player2 = player2.selection(player1.player_selection)
  end

  def play_round(player, board)
    board.print_board
    if player.player_selection == @player1
        board.play_move(@player1, player.get_move)
    else
        board.play_move(@player2, player.get_move)
        puts "Computer move"
    end
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
