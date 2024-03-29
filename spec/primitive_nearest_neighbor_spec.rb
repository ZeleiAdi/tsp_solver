require_relative '../lib/vertex'
require_relative '../lib/adjacencylistgraph'
require_relative '../lib/primitive_nearest_neighbor'
require_relative '../lib/graphfactory'
require_relative '../lib/heuristics_gauge'

describe 'Primitive Nearest Neighbor' do

  it 'should return a salesman path' do
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
    vertex2.add_neighbor vertex6, 1
    vertex3.add_neighbor vertex4, 9
    vertex4.add_neighbor vertex5, 6
    vertex6.add_neighbor vertex7, 10
    vertex7.add_neighbor vertex8, 4

    graph = AdjacencyListGraph.new
    graph << vertex1
    graph << vertex2
    graph << vertex3
    graph << vertex4
    graph << vertex5
    graph << vertex6
    graph << vertex7

    path = PrimitiveNearestNeighbor.run graph, vertex2

    expect(path.size).to be 21
  end

  #it 'should primitively but efficiently find a path from a random graph' do
  #  10.times do
  #    HeuristicsGauge.initialize 20
  #    HeuristicsGauge.load_graph
  #    time, path_found, path_length, stops = HeuristicsGauge.heuristics_performance :primitive_nearest_neighbor
  #    puts "time: #{time}, path: #{path_found}, length: #{path_length}, number of stops: #{stops}"
  #  end
  #end
end