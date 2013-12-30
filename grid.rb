class Grid
  attr_accessor :days, :size, :padding, :width, :height

  def initialize
    @days = 10000
    @size = 1
    @padding = 1
    @width = 300
    @height = 300
  end

  def coords
    (0..days).map do |day|
      [col_value(day),row_value(day)]
    end
  end

  private

  def row_value(day)
    row(day) * (size + padding)
  end

  def col_value(day)
    (day * (size + padding)) - (row(day) * days_per_row * (padding + size))
  end

  def days_per_row
    width / (padding + size)
  end

  def row(day)
    (day / days_per_row).floor
  end

  def days
    @days - 1
  end
end

grid = Grid.new
grid.days = 4
grid.width = 4
grid.height = 4
p grid.coords == [[0,0], [2,0], [0,2], [2,2]]

grid = Grid.new
grid.days = 4
grid.size = 2
grid.width = 6
grid.height = 6
p grid.coords == [[0,0], [3,0], [0,3], [3,3]]

grid = Grid.new
grid.days = 4
grid.size = 2
grid.padding = 2
grid.width = 8
grid.height = 8
p grid.coords == [[0,0], [4,0], [0,4], [4,4]]

grid = Grid.new
grid.days = 4
grid.size = 2
grid.padding = 2
grid.width = 9
grid.height = 9
p grid.coords == [[0,0], [4,0], [0,4], [4,4]]
