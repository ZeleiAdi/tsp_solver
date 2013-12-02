require 'rspec'
require_relative '../lib/adjacencylistgraph'
require_relative '../lib/vertex'

describe 'AdjacencyListGraph' do

  it 'indicate if graph is not connected' do
    alg = AdjacencyListGraph.new
    vertex1 = Vertex.new
    vertex2 = Vertex.new
    vertex3 = Vertex.new
    vertex4 = Vertex.new
    alg.add_vertex(vertex1)
    alg.add_vertex(vertex2)
    alg.add_vertex(vertex3)
    alg.add_vertex(vertex4)
    vertex1.add_neighbor(vertex3, 10)
    vertex1.add_neighbor(vertex4, 10)

    alg.breadth_first_search(vertex1)
    expect(alg.connected?).to be false

    alg.clear_visit
    vertex2.add_neighbor(vertex3, 10)
    vertex2.add_neighbor(vertex4, 10)

    alg.breadth_first_search(vertex1)
    expect(alg.connected?).to be true
  end

  it 'should indicate if all vertices were visited except the start city' do
    alg = AdjacencyListGraph.new
    vertex1 = Vertex.new
    vertex2 = Vertex.new
    vertex3 = Vertex.new
    vertex4 = Vertex.new
    alg.add_vertex(vertex1)
    alg.add_vertex(vertex2)
    alg.add_vertex(vertex3)
    alg.add_vertex(vertex4)
    vertex2.visit
    expect(alg.all_vertices_visited_except vertex1).to be false
    vertex3.visit
    vertex4.visit
    expect(alg.all_vertices_visited_except vertex1).to be true
  end

end