require_relative './oxygen_rating'
require_relative './c02_scrubber'

input = File.readlines('../../input.txt').map(&:strip)
byte_size = input.first.size
oxygen = OxygenRating.new(input.dup)
c02 = C02Scrubber.new(input.dup)

byte_size.times do |index|
  oxygen.perform(index)
  c02.perform(index)
end

puts oxygen.results * c02.results
