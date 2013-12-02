require 'rspec'
require_relative '../lib/vertex'
require_relative '../lib/adjacencylistgraph'
require_relative '../lib/nearest_neighbor'
require_relative '../lib/graphfactory'

describe 'My behaviour' do

  it 'should return a Hamilton circle' do
    vertex1 = Vertex.new
    vertex2 = Vertex.new
    vertex3 = Vertex.new
    vertex4 = Vertex.new
    vertex5 = Vertex.new

    vertex1.add_neighbor vertex2, 9
    vertex1.add_neighbor vertex3, 1
    vertex1.add_neighbor vertex4, 5
    vertex1.add_neighbor vertex5, 7
    vertex2.add_neighbor vertex3, 6
    vertex2.add_neighbor vertex5, 6
    vertex3.add_neighbor vertex4, 9
    vertex4.add_neighbor vertex5, 6

    graph = AdjacencyListGraph.new
    graph << vertex1
    graph << vertex2
    graph << vertex3
    graph << vertex4
    graph << vertex5

    path = NearestNeighbor.run graph, vertex2

    expect(path.size).to be 6
  end

  it 'should return a complex Hamilton circle' do
    size = 100
    graph = GraphFactory.generate_graph(size)
    path = NearestNeighbor.run graph, graph.random_vertex

    expect(path.size).to be size+1
  end
end