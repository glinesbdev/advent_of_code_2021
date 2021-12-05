# Check git history for original solution -- Modified for testability

class Day2Part2
  def initialize
    @input = File.readlines(File.expand_path('../../../input.txt', __FILE__), chomp: true)
    @horizontal_pos = 0
    @depth = 0
    @aim = 0
  end

  def run
    @input.each do |i|
      command, value = i.split
      value = value.to_i

      case command
      when 'forward'
        @horizontal_pos += value
        @depth += @aim * value
      when 'down'
        @aim += value
      when 'up'
        @aim -= value
      end
    end

    @horizontal_pos * @depth
  end
end
