# frozen_string_literal: true

require 'ostruct'
require 'securerandom'

class Board
  attr_reader :rows, :columns
  attr_accessor :won

  def initialize(matrix:)
    @rows = []
    @columns = []
    @won = false

    matrix.size.times do |index|
      @rows << OpenStruct.new(numbers: matrix[index], marked: [])
    end

    matrix.size.times do |index|
      cols = []

      @rows.size.times do |rindex|
        cols << matrix[rindex][index]
      end

      @columns << OpenStruct.new(numbers: cols, marked: [])
    end
  end

  def mark(spot:)
    [@rows, @columns].flatten.each do |item|
      item.marked << spot if item.numbers.include?(spot)
    end
  end

  def unmarked_spots
    @rows.flat_map { |row| (row.numbers - row.marked) }
  end

  def has_completed_row?
    @rows.any? { |row| (row.numbers - row.marked).empty? }
  end

  def has_completed_column?
    @columns.any? { |column| (column.numbers - column.marked).empty? }
  end
end
