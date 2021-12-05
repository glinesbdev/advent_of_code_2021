# Check git history for original solution -- Modified for testability

class Day2Part1
  def initialize
    @input = File.readlines(File.expand_path('../../../input.txt', __FILE__), chomp: true)
    @horizontal_pos = 0
    @depth = 0
  end

  def run
    @input.each do |i|
      command, value = i.split

      case command
      when 'forward'
        @horizontal_pos += value.to_i
      when 'down'
        @depth += value.to_i
      when 'up'
        @depth -= value.to_i
      end
    end

    @horizontal_pos * @depth
  end
end
