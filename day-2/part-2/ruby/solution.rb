def calculate_position(input)
  horizontal_pos = 0
  depth = 0
  aim = 0

  input.each do |i|
    command, value = i.split
    value = value.to_i

    case command
    when 'forward'
      horizontal_pos += value
      depth += aim * value
    when 'down'
      aim += value
    when 'up'
      aim -= value
    end
  end

  horizontal_pos * depth
end

input = File.readlines('../../input.txt')

puts calculate_position(input)
