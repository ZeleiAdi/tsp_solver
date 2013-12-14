#require 'rspec'
require_relative '../lib/heuristics_gauge'

describe 'Performance Measure' do

  it 'should evaluate and compare heuristics path attributes' do
    2.times do
      HeuristicsGauge.initialize 20
      HeuristicsGauge.load_graph
      nn_time, solution, nn_sum, nn_stops = HeuristicsGauge.heuristics_performance :nearest_neighbor
      pnn_time, solution2, pnn_sum, pnn_stops, path_matrix, graph_matrix = HeuristicsGauge.heuristics_performance :spanning_tree
      puts "primitive runtime = #{pnn_time}, depth runtime = #{nn_time}"
      puts "nearest neighbor sum = #{nn_sum}, number of stops = #{nn_stops}"
      puts "primitive nearest neighbor sum = #{pnn_sum}, number of stops = #{pnn_stops}"
      puts 'path matrix:'
      path_matrix.print
      puts 'graph matrix:'
      graph_matrix.print
    end
  end

  it 'should generate a matrix from a path' do
    HeuristicsGauge.initialize 5
    HeuristicsGauge.load_graph
    HeuristicsGauge.heuristics_performance :primitive_nearest_neighbor
    path_matrix = HeuristicsGauge.transform_path_into_matrix
    puts 'path:'
    HeuristicsGauge.show_path
    puts 'matrix'
    HeuristicsGauge.show_matrix
    puts 'path_matrix'
    path_matrix.print
  end
end