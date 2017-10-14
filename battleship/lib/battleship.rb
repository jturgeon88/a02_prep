class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
    @player = player
    @board = board

  end

  def attack(pos)
    row_i = pos[0]
    col_i = pos[1]
    @board.grid[row_i][col_i] = :x
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def play_turn
    # @player.get_play
    self.attack(@player.get_play)
  end
end
