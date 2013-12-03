require 'rspec'
require_relative '../lib/adjacencylistgraph'
require_relative '../lib/vertex'
require_relative '../lib/matrix'

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

  it 'should return a minimum spanning tree in matrix form' do
    matrix = Matrix.new 5,5
    row0 = [0,1,2,7,0]
    row1 = [1,0,5,0,6]
    row2 = [2,5,0,8,3]
    row3 = [7,0,8,0,4]
    row4 = [0,6,3,4,0]
    matrix.define_row 0, row0
    matrix.define_row 1, row1
    matrix.define_row 2, row2
    matrix.define_row 3, row3
    matrix.define_row 4, row4

    alg = AdjacencyListGraph.new
    spanning_tree = alg.build_minimal_spanning_tree matrix
    spanning_tree.print
  end

end