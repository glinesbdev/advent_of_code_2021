# Check git history for original solution -- Modified for testability

class Day3Part1
  def initialize
    @input = File.readlines(File.expand_path('../../../input.txt', __FILE__), chomp: true)
    @byte_size = @input.first.size
    @byte = []
  end

  def run
    (0...@byte_size).each_with_index do |_, index|
      zeroes = 0
      ones = 0

      @input.each do |num|
        zeroes += 1 if num[index] == '0'
        ones += 1 if num[index] == '1'
      end

      @byte << (zeroes > ones ? '0' : '1')
    end

    gamma = @byte.join.to_i(2)
    epsilon = gamma ^ (1 << @byte.size) - 1

    gamma * epsilon
  end
end
