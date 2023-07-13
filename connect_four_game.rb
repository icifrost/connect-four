require './lib/connect_four'
class ConnectFourGame
      def initialize
        @game = ConnectFour.new
        @current_player = 'X'
        @player_modes = { 'X' => :human, 'O' => :computer }
      end
    
      def set_player_mode(player, mode)
        @player_modes[player] = mode if @player_modes.key?(player)
      end
    
      def play
        loop do
          display_board
    
          if @player_modes[@current_player] == :human
            column = ask_for_column
            while !valid_column?(column)
              puts "Invalid column. Please choose a column number between 1 and 7."
              column = ask_for_column
            end
          else
            column = computer_move
          end
    
          row = @game.drop_disc(column - 1, @current_player)
    
          if @game.win?(@current_player)
            display_board
            puts "Player #{@current_player} wins!"
            break
          elsif @game.draw?
            display_board
            puts "It's a draw!"
            break
          end
    
          switch_players
        end
      end
    
      private
    
      def display_board
        puts "\n"
        @game.grid.each do |row|
          puts row.join(" | ")
        end
        puts "--" * 14
        puts " 1   2   3   4   5   6   7 "
        puts "\n"
      end
    
      def ask_for_column
        print "Player #{@current_player}, choose a column (1-7): "
        gets.chomp.to_i
      end
    
      def valid_column?(column)
        (1..7).include?(column)
      end
    
      def computer_move
        available_columns = (1..7).select { |col| valid_column?(col) }
        available_columns.sample
      end
    
      def switch_players
        @current_player = @current_player == 'X' ? 'O' : 'X'
      end
end

game = ConnectFourGame.new
puts "Connect Four"
puts "Select player modes:"
puts "1. Human vs. Human"
puts "2. Human vs. Computer"
puts "3. Computer vs. Computer"
print "Enter the player mode (1-3): "
mode = gets.chomp.to_i

case mode
when 1
  game.set_player_mode('X', :human)
  game.set_player_mode('O', :human)
when 2
  game.set_player_mode('X', :human)
  game.set_player_mode('O', :computer)
when 3
  game.set_player_mode('X', :computer)
  game.set_player_mode('O', :computer)
else
  puts "Invalid player mode. Exiting the game."
  exit
end

game.play