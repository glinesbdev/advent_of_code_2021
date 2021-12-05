# frozen_string_literal: true
# Check git history for original solution -- Modified for testability

require_relative './board'

module Bingo
  @@winning_num = 0
  @@input = nil
  @@matrices = []
  @@winning_boards = []
  @@stop_called = false

  class << self
    def play!
      parse_data
      boards = @@matrices.map { |matrix| Board.new(matrix: matrix) }

      @@input.each do |num|
        boards.each do |board|
          break if @@stop_called

          update(board, num)
        end
      end

      @@winning_boards.last.unmarked_spots.sum * @@winning_num
    end

    private

    def parse_data
      matrix_index = -1

      File.foreach(File.expand_path('../../../input.txt', __FILE__), chomp: true).with_index do |line|
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
      @@stop_called = true
    end

    def add_winner(board)
      board.won = true
      @@winning_boards << board
    end

    def update(board, num)
      @@winning_num = num

      board.mark(spot: num)
      add_winner(board) if !board.won && (board.has_completed_row? || board.has_completed_column?)

      stop! if @@matrices.size == @@winning_boards.size
    end
  end
end
