class Rover
  attr_accessor :position
  attr_accessor :instructions
  attr_accessor :grid

  DIRECTIONS = ['N','E','S','W']

  def initialize(grid)
    raise "Invalid grid value" if(grid[0] < 0 || grid[1] < 0)
    @grid = grid
  end

  def direction=(direction_string)
    raise 'Invalid orientation' unless DIRECTIONS.include?(direction_string)
    @direction = DIRECTIONS.index(direction_string)
  end

  def direction
    DIRECTIONS[@direction]
  end

  def explore
    instructions.each do |command|
      case command
      when 'L'
        rotate(:left)
      when 'R'
        rotate(:right)
      when 'M'
        move
      else
        raise 'Invalid command'
      end
    end
    return "#{position.join(' ')} #{direction}"
  end

  private

  def rotate(direction)
    case direction
    when :left
      @direction -= 1
    when :right
      @direction += 1
    end
    @direction = @direction % 4
  end

  def move
    case DIRECTIONS[@direction]
    when 'N'
      position[1] += 1
    when 'E'
      position[0] += 1
    when 'S'
      position[1] -= 1
    when 'W'
      position[0] -= 1
    end
    raise 'Invalid movement: rover outside grid' if position[0] < 0 || position[1] < 1
  end
end
