# frozen_string_literal: true
# Check git history for original solution -- Modified for testability

require_relative './board'

module Game
  @@last_num = 0
  @@last_marked_board = nil
  @@input = nil
  @@matrices = []
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

      @@last_marked_board.unmarked_spots.sum * @@last_num
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

    def update(board, num)
      @@last_num = num
      @@last_marked_board = board

      board.mark(spot: num)
      stop! if board.has_completed_row? || board.has_completed_column?
    end
  end
end
