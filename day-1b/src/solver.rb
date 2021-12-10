# frozen_string_literal: true

class Solver
  attr_reader :measurements

  def initialize
    @measurements = File
      .readlines('./support/data.txt')
      .map(&:to_i)
  end

  def call
    processed_measurements.each_with_index.reduce(0) do |sum, (measurement, index)|
      next sum if index.zero?

      measurement > processed_measurements[index - 1] ? sum + 1 : sum
    end
  end

  def processed_measurements
    @processed_measurements ||= measurements.map.with_index do |measurement, index|
      next unless index > 1

      measurements[(index - 2)..index].reduce(:+)
    end.compact
  end
end
