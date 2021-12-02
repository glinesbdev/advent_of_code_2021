input = File.readlines('../../input.txt').map { |i| i.strip.to_i }
count = 0

input.each_cons(3).reduce { |acc, window| count += acc.reduce(&:+) < window.reduce(&:+) ? 1 : 0; acc = window }

puts count
