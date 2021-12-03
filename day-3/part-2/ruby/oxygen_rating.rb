require_relative './submarine'

class OxygenRating < Submarine
  def perform(index)
    if @input.size > 1
      @zeroes = @input.count { |o| o[index] == '0' }
      @ones = @input.count { |o| o[index] == '1' }
      @input.select! { |o| o[index] == matcher }
    end
  end

  def matcher
    @zeroes < ones ? '1' : (@zeroes == ones) ? '1' : '0'
  end
end
