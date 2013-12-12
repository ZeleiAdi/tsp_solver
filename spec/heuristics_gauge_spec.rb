require 'rspec'
require_relative '../lib/heuristics_gauge'

describe 'Performance Measure' do

  it 'should evaluate and compare heuristics path attributes' do
    HeuristicsGauge.initialize 20
    HeuristicsGauge.load_graph
    nn_time, solution, nn_sum, nn_stops = HeuristicsGauge.heuristics_performance :nearest_neighbor
    pnn_time, solution2, pnn_sum, pnn_stops = HeuristicsGauge.heuristics_performance :primitive_nearest_neighbor
    puts "primitive runtime = #{pnn_time}, depth runtime = #{nn_time}"
    puts "nearest neighbor sum = #{nn_sum}, number of stops = #{nn_stops}"
    puts "primitive nearest neighbor sum = #{pnn_sum}, number of stops = #{pnn_stops}"
    expect(nn_sum > 0)
    expect(pnn_sum > nn_sum)
    expect((pnn_time < nn_time) && (solution == solution2))
  end

end