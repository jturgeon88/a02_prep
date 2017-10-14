class Board
  attr_reader :grid

  def self.default_grid
    default_grid = Array.new(10) {Array.new(10)}

  end

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def count
    counter = 0
    @grid.each do |row|
      row.each do |space|
        if space == :s
          counter += 1
        end
      end
    end
    counter
  end

  def empty?(pos = nil)
    # puts "==============="
    # p @grid
    if pos
      # row_i = pos[0]
      # col_i = pos[1]
      self[pos].nil?
    else
      @grid.all? do |row|
        row.all? do |space|
          space == nil
        end
      end
    end
  end

  def full?
    @grid.all? do |row|
      row.all? do |space|
        space != nil
      end
    end
  end

  def place_random_ship
    raise "Board full" if full?
    pos = [rand(@grid.length), rand(@grid.length)]
    until empty?(pos) || full?
      pos = [rand(@grid.length), rand(@grid.length)]
    end
    self[pos] = :s
  end

  def won?
    @grid.all? do |row|
      row.none? do |space|
        space == :s
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end
end
