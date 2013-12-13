#require 'rspec'
require_relative '../lib/vertex'
require_relative '../lib/adjacencylistgraph'
require_relative '../lib/intelligent_nearest_neighbor'
require_relative '../lib/graphfactory'
require_relative '../lib/heuristics_gauge'

describe 'Intelligent Path Find' do

  it 'should intelligently find a path' do
    vertex1 = Vertex.new
    vertex2 = Vertex.new
    vertex3 = Vertex.new
    vertex4 = Vertex.new
    vertex5 = Vertex.new
    vertex6 = Vertex.new
    vertex7 = Vertex.new
    vertex8 = Vertex.new

    vertex1.add_neighbor vertex2, 9
    vertex1.add_neighbor vertex3, 2
    vertex1.add_neighbor vertex4, 5
    vertex1.add_neighbor vertex5, 7
    vertex2.add_neighbor vertex3, 6
    vertex2.add_neighbor vertex5, 6
    vertex2.add_neighbor vertex6, 10
    vertex3.add_neighbor vertex4, 9
    vertex4.add_neighbor vertex5, 6
    vertex6.add_neighbor vertex7, 1
    vertex7.add_neighbor vertex8, 4

    graph = AdjacencyListGraph.new
    graph << vertex1
    graph << vertex2
    graph << vertex3
    graph << vertex4
    graph << vertex5
    graph << vertex6
    graph << vertex7
    graph << vertex8

    path = IntelligentNearestNeighbor.run graph, vertex6

    expect(path.size < 15)
  end

  it 'should intelligently find a path from a random graph' do
    10.times do
      HeuristicsGauge.initialize 20
      HeuristicsGauge.load_graph
      time, path_found, path_length = HeuristicsGauge.heuristics_performance :primitive_nearest_neighbor
      puts "path: #{path_found}, length: #{path_length}"
    end
  end

end