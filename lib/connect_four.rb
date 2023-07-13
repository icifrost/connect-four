class ConnectFour
    attr_reader :grid
  
    def initialize
      @grid = Array.new(6) { Array.new(7, ' ') }
    end
  
    def drop_disc(column, disc)
      row = find_available_row(column)
      @grid[row][column] = disc
    end
  
    def win?(disc)
      vertical_win?(disc) || horizontal_win?(disc) || diagonal_win?(disc)
    end
  
    def draw?
      @grid.flatten.none?(' ')
    end
  
    private
  
    def find_available_row(column)
      (0..5).reverse_each do |row|
        return row if @grid[row][column] == ' '
      end
    end
  
    def vertical_win?(disc)
      @grid.transpose.any? { |column| column.join.include?(disc * 4) }
    end
  
    def horizontal_win?(disc)
      @grid.any? { |row| row.join.include?(disc * 4) }
    end
  
    def diagonal_win?(disc)
        diagonals = []
        rows = @grid.size
        cols = @grid.first.size
      
        # Check diagonals starting from the top-left corner
        (cols - 3).times do |col|
          (rows - 3).times do |row|
            diagonal = []
            4.times { |i| diagonal << @grid[row + i][col + i] }
            diagonals << diagonal.join
          end
        end
      
        # Check diagonals starting from the bottom-left corner
        (cols - 3).times do |col|
          (rows - 3).times do |row|
            diagonal = []
            4.times { |i| diagonal << @grid[row + 3 - i][col + i] }
            diagonals << diagonal.join
          end
        end
      
        diagonals.any? { |d| d.include?(disc * 4) }
    end
  end