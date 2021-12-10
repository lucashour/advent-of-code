# frozen_string_literal: true

class Solver
  attr_reader :measurements

  def initialize
    @measurements = File
      .readlines('./support/data.txt')
      .map(&:to_i)
  end

  def call
    measurements.each_with_index.reduce(0) do |sum, (measurement, index)|
      next sum if index.zero?

      measurement > measurements[index - 1] ? sum + 1 : sum
    end
  end
end
