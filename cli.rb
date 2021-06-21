require 'readline'
require './rover'

grid = [0,0]

line = Readline::readline('Grid dimensions: > ')
Readline::HISTORY.push(line)
grid = line.split(' ').map &:to_i
raise 'Invalid grid values' unless grid.size == 2

loop do
  rover = Rover.new(grid)

  line = Readline::readline('[Rover] Initial position: > ')
  break if line.nil? || line == 'quit'
  Readline::HISTORY.push(line)
  init_coords = line.split(' ')
  raise 'Invalid coordinates' unless init_coords.size == 3

  rover.position = [init_coords[0].to_i, init_coords[1].to_i]
  rover.direction = init_coords[2]

  line = Readline::readline('[Rover] Instructions: > ')
  break if line.nil? || line == 'quit'
  Readline::HISTORY.push(line)
  rover.instructions = line.split(' ')

  final_position = rover.explore
  puts final_position
end


