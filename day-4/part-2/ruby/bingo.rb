# frozen_string_literal: true

require_relative './board'

module Bingo
  @@winning_num = 0
  @@input = nil
  @@matrices = []
  @@winning_boards = []

  class << self
    def play!
      parse_data

      boards = @@matrices.map { |matrix| Board.new(matrix: matrix) }
      matrix_size = @@matrices.first.size - 1
      col = 0

      @@input.each do |num|
        boards.each do |board|
          update(board, num, col)
          col = col < matrix_size ? col + 1 : 0
        end
      end
    end

    private

    def parse_data
      matrix_index = -1

      File.foreach('../../input.txt', chomp: true).with_index do |line|
        if line.include?(',')
          @@input = line.split(',').map(&:to_i)
          next
        end

        if line.empty?
          matrix_index += 1
          next
        end

        @@matrices[matrix_index] = [] if @@matrices[matrix_index].nil?
        @@matrices[matrix_index] << line.split.map(&:to_i)
      end
    end

    def stop!
      p @@winning_boards.last.unmarked_spots.sum * @@winning_num
      exit
    end

    def add_winner(board)
      board.won = true
      @@winning_boards << board
    end

    def update(board, num, col)
      @@winning_num = num

      board.mark(spot: num)
      add_winner(board) if !board.won && (board.has_completed_row? || board.has_completed_column?)

      stop! if @@matrices.size == @@winning_boards.size
    end
  end
end
