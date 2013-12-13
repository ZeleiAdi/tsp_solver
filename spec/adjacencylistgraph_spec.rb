require_relative '../lib/adjacencylistgraph'
require_relative '../lib/graphfactory'
require_relative '../lib/matrix'
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

  it 'should check for any vertex with odd degree' do
    alg = AdjacencyListGraph.new
    vertex1 = Vertex.new
    vertex2 = Vertex.new
    vertex3 = Vertex.new
    vertex4 = Vertex.new

    vertex1.add_neighbor(vertex3, 10)
    vertex1.add_neighbor(vertex4, 10)

    alg.add_vertex(vertex1)
    alg.add_vertex(vertex2)
    alg.add_vertex(vertex3)
    alg.add_vertex(vertex4)
    expect(alg.has_vertex_with_odd_degree)

    vertex3.add_neighbor(vertex4, 10)
    expect(!alg.has_vertex_with_odd_degree)
  end

  it 'indicate if graph is not connected with DFS' do

    vertex1 = Vertex.new
    vertex2 = Vertex.new
    vertex3 = Vertex.new
    vertex4 = Vertex.new
    vertex5 = Vertex.new
    vertex6 = Vertex.new
    vertex7 = Vertex.new

    vertex1.add_neighbor vertex2, 10
    vertex1.add_neighbor vertex5, 10
    vertex2.add_neighbor vertex3, 10
    vertex2.add_neighbor vertex4, 10
    vertex5.add_neighbor vertex6, 10
    vertex6.add_neighbor vertex7, 10

    graph = AdjacencyListGraph.new
    graph << vertex1
    graph << vertex2
    graph << vertex3
    graph << vertex4
    graph << vertex5
    graph << vertex6
    graph << vertex7

    result = graph.detect_cycle(vertex1)

    expect(result != :cycle)
    vertex4.add_neighbor vertex5, 10

    expect(result == :cycle)
  end

  it 'should provide a list of vertices by traversing the graph using DFS' do
    vertex1 = Vertex.new
    vertex2 = Vertex.new
    vertex3 = Vertex.new
    vertex4 = Vertex.new
    vertex5 = Vertex.new
    vertex6 = Vertex.new
    vertex7 = Vertex.new

    vertex1.add_neighbor vertex2, 10
    vertex1.add_neighbor vertex5, 10
    vertex2.add_neighbor vertex3, 10
    vertex2.add_neighbor vertex4, 10
    vertex5.add_neighbor vertex6, 10
    vertex6.add_neighbor vertex7, 10

    graph = AdjacencyListGraph.new
    graph << vertex1
    graph << vertex2
    graph << vertex3
    graph << vertex4
    graph << vertex5
    graph << vertex6
    graph << vertex7

    graph.depth_first_search vertex1
    graph.dfs_path.each do |vertex|
      vertex.print
    end
  end
end