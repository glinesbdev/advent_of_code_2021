# frozen_string_literal: true

require 'ostruct'

class Board
  def initialize(matrix:)
    @rows = []

    matrix.size.times do |index|
      @rows << OpenStruct.new(numbers: matrix[index], marked: [])
    end
  end

  def mark(spot:)
    @rows.each do |row|
      if row.numbers.include?(spot)
        row.marked << spot
      end
    end
  end

  def unmarked_spots
    @rows.flat_map { |row| (row.numbers - row.marked) }
  end

  def has_completed_row?
    @rows.any? { |row| (row.numbers - row.marked).empty? }
  end

  def has_completed_column?(col)
    completed = false
    row_size = @rows.first.numbers.size

    (0...row_size).each do |index|
      row = @rows[index]
      completed = row.marked.include?(row.numbers[col])

      break unless completed
    end

    completed
  end
end
