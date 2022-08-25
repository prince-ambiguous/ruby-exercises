# frozen_string_literal: true

# Creates_the_board
class Board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @value = 0
    @symbol
  end
  attr_accessor :value

  def print_board
    @board.map.with_index do |cell, idx|
      if idx != 2 && idx != 5 && idx != 8
        print " #{cell} |"
      elsif idx == 8
        print " #{cell}\n"
      else
        print " #{cell}\n"
        print "---+---+---\n"
      end
    end
  end

  def ary(value)
    @board.map do |cell|
      cell = @symbol if value == cell.to_i
      cell
    end
  end

  def play_move(symbol, value)
    @symbol = symbol
    @board = ary(value)
  end

  def game_won?(win_states)
    win = false
    win_states.map do |pattern|
      no_of_X = 0
      no_of_O = 0
      pattern.map do |idx|
        if @board[idx.to_i] == 'X' || @board[idx.to_i] == 'O'
          if @board[idx.to_i] == 'X'
            no_of_X += 1
          else
            no_of_O += 1
          end
        end
      end

      if no_of_X == 3 || no_of_O == 3
        win = true
      end
    end
    win
  end

  def win_patterns
    win_patterns = [
      %w[0 1 2],
      %w[3 4 5],
      %w[6 7 8],
      %w[0 3 6],
      %w[1 4 7],
      %w[2 5 8],
      %w[0 4 8],
      %w[2 4 6]
    ]
  end
end

# Takes_input_from_the_user
class HumanPlayer
  attr_reader :player_selection

  def initialize
    @player_selection
    @move_position
  end

  def name
    return 'Player'
  end

  def get_selection
    puts 'Enter X | O'
    choice = gets.chomp.upcase
    if %w[X O].include?(choice)
      @player_selection = choice
    else
      puts 'ERROR:'
      get_selection
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

  def name
    return 'Computer'
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
    @moves = []
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
        if game_over?(board) == true 
          puts "#{player1.name} won the match"
          break
        end
      else
        play_round(board, player2)
        if game_over?(board) == true 
          puts "#{player2.name} won the match"
          break
        end
      end
      i += 1
      # player_choice = player_choice == 'X' ? 'O' : 'X'
    end
  end

  def play_round(board, player)
    move = player.get_move
    if player.to_s.include?('HumanPlayer')
      while check_move_validity(move) == false
        print 'invalid move!'
        move = player.get_move
      end
      board.play_move(@player1, move)
      puts "\nPlayer move #{move}\n"
    else
      move = player.get_move while check_move_validity(move) == false
      board.play_move(@player2, move)
      puts "\nComputer move #{move}\n"
    end
    board.print_board
  end

  def check_move_validity(move)
    if @moves.include?(move) == false
      save_move(move)
      true
    else
      false
    end
  end

  def save_move(move)
    @moves.push(move)
  end

  def game_over?(board)
    if board.game_won?(board.win_patterns()) == true
      puts "\n---- GAME OVER! ----\n"
      true
    else
      false
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
