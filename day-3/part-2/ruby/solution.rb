# Check git history for original solution -- Modified for testability

require_relative './oxygen_rating'
require_relative './c02_scrubber'

class Day3Part2
  def initialize
    @input = File.readlines(File.expand_path('../../../input.txt', __FILE__), chomp: true)
    @byte_size = @input.first.size
    @oxygen = OxygenRating.new(@input.dup)
    @c02 = C02Scrubber.new(@input.dup)
  end

  def run
    @byte_size.times do |index|
      @oxygen.perform(index)
      @c02.perform(index)
    end

    @oxygen.results * @c02.results
  end
end
