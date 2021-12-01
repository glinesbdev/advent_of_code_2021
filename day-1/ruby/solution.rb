input = File.readlines('../input.txt').flat_map { |i| i.gsub("\n", '').to_i }
count = 0

input.inject { |acc, num| count += acc < num ? 1 : 0; acc = num }

puts count
