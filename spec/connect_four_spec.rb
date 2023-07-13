require './lib/connect_four'
describe ConnectFour do
  describe '#initialize' do
    it 'creates an empty 6x7 grid' do
      game = ConnectFour.new
      expect(game.grid).to eq([
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' ']
      ])
    end
  end

  describe '#drop_disc' do
    it 'drops a disc in the specified column' do
      game = ConnectFour.new
      game.drop_disc(0, 'X')
      expect(game.grid).to eq([
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', ' '],
        ['X', ' ', ' ', ' ', ' ', ' ', ' ']
      ])
    end
  end
  describe '#win?' do
    it 'returns true when there is a vertical win' do
      game = ConnectFour.new
      game.drop_disc(0, 'X')
      game.drop_disc(0, 'X')
      game.drop_disc(0, 'X')
      game.drop_disc(0, 'X')
      game.drop_disc(0, 'X')
      game.drop_disc(0, 'X')
      expect(game.win?('X')).to eq(true)
    end

    it 'returns true when there is a horizontal win' do
      game = ConnectFour.new
      game.drop_disc(0, 'X')
      game.drop_disc(1, 'X')
      game.drop_disc(2, 'X')
      game.drop_disc(3, 'X')
      game.drop_disc(4, 'X')
      game.drop_disc(5, 'X')
      game.drop_disc(6, 'X')
      expect(game.win?('X')).to eq(true)
    end

    it 'returns true when there is a diagonal win' do
      game = ConnectFour.new
      game.drop_disc(0, 'X')
      game.drop_disc(1, 'O')
      game.drop_disc(1, 'X')
      game.drop_disc(2, 'O')
      game.drop_disc(2, 'O')
      game.drop_disc(2, 'X')
      game.drop_disc(3, 'O')
      game.drop_disc(3, 'O')
      game.drop_disc(3, 'O')
      game.drop_disc(3, 'X')
      game.drop_disc(4, 'O')
      game.drop_disc(4, 'O')
      game.drop_disc(4, 'O')
      game.drop_disc(4, 'O')
      game.drop_disc(4, 'X')
      game.drop_disc(5, 'O')
      game.drop_disc(5, 'O')
      game.drop_disc(5, 'O')
      game.drop_disc(5, 'O')
      game.drop_disc(5, 'O')
      game.drop_disc(5, 'X')
      game.drop_disc(6, 'O')
      game.drop_disc(6, 'O')
      game.drop_disc(6, 'O')
      game.drop_disc(6, 'O')
      game.drop_disc(6, 'O')
      game.drop_disc(6, 'O')
      game.drop_disc(6, 'X')
      expect(game.win?('X')).to eq(true)
    end

    it 'returns false when there is no win' do
      game = ConnectFour.new
      expect(game.win?('X')).to eq(false)
    end
  end

  describe '#draw?' do
    it 'returns true when the game ends in a draw' do
      game = ConnectFour.new
      (0..6).each do |col|
        (0..5).each do |row|
          game.drop_disc(col, 'X')
        end
      end
      expect(game.draw?).to eq(true)
    end

    it 'returns false when the game is not a draw' do
      game = ConnectFour.new
      expect(game.draw?).to eq(false)
    end
  end
end