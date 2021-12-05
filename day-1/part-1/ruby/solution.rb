# Original Solution -- Modified for testability
# input = File.readlines('../../input.txt').map { |i| i.strip.to_i }
# count = 0

# input.inject { |acc, num| count += acc < num ? 1 : 0; acc = num }

# p count

class Day1Part1
  def initialize
    @input = File.readlines(File.expand_path('../../../input.txt', __FILE__), chomp: true).map(&:to_i)
    @count = 0
  end

  def run
    @input.inject { |acc, num| @count += acc < num ? 1 : 0; acc = num }
    @count
  end
end
