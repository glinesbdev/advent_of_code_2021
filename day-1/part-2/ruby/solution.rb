# Original Solution -- Modified for testability
# input = File.readlines('../../input.txt').map { |i| i.strip.to_i }
# count = 0

# input.each_cons(3).reduce { |acc, window| count += acc.reduce(&:+) < window.reduce(&:+) ? 1 : 0; acc = window }

# puts count

class Day1Part2
  def initialize
    @input = File.readlines(File.expand_path('../../../input.txt', __FILE__), chomp: true).map(&:to_i)
    @count = 0
  end

  def run
    @input.each_cons(3).reduce { |acc, window| @count += acc.reduce(&:+) < window.reduce(&:+) ? 1 : 0; acc = window }
    @count
  end
end
