require_relative './submarine'

class C02Scrubber < Submarine
  def perform(index)
    if @input.size > 1
      @zeroes = @input.count { |c| c[index] == '0' }
      @ones = @input.count { |c| c[index] == '1' }
      @input.select! { |c| c[index] == matcher }
    end
  end

  def matcher
    (@zeroes > @ones) ? '1' : (@zeroes == @ones) ? '0' : '0'
  end
end
