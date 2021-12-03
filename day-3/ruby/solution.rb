input = File.readlines('../input.txt').map(&:strip)

byte_size = input.first.size
byte = []

(0...byte_size).each_with_index do |_, index|
  zeroes = 0
  ones = 0

  input.each do |num|
    zeroes += 1 if num[index] == '0'
    ones += 1 if num[index] == '1'
  end

  byte << (zeroes > ones ? '0' : '1')
end

gamma = byte.join.to_i(2)
epsilon = gamma ^ (1 << byte.size) - 1

puts gamma * epsilon
