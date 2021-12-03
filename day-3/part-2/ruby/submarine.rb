class Submarine
  attr_reader :zeroes, :ones

  def initialize(input)
    @input = input
  end

  def results
    @input.first.to_i(2)
  end

  protected # protected against oneself...??? 🤷‍♂️

  def matcher
    raise 'Implement `matcher function in child class'
  end

  def perform
    raise 'Implement `perform` function in child class'
  end
end
