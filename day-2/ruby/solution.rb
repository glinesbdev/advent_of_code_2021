def calculate_position(input)
  horizontal_pos = 0
  depth = 0

  input.each do |i|
    command, value = i.split

    case command
    when 'forward'
      horizontal_pos += value.to_i
    when 'down'
      depth += value.to_i
    when 'up'
      depth -= value.to_i
    end
  end

  horizontal_pos * depth
end

input = File.readlines('../input.txt')

puts calculate_position(input)
