require_relative '../lib/heuristics_gauge'
require_relative '../lib/matrix'
require_relative '../lib/spanning_tree'

describe 'Build Minimal Spanning Tree' do

  it 'should return a minimum spanning tree from a random graph' do
    graph = nil
    10.times do
      matrix = GraphFactory.create_graph_in_matrix_form 10
      graph = GraphFactory.transform_matrix_into_graph matrix
      puts graph.connected?
      spanning_tree = SpanningTree.build_minimal_spanning_tree matrix
      path_length = SpanningTree.path_length spanning_tree
      graph = GraphFactory.transform_matrix_into_graph spanning_tree
      puts "path length: #{path_length}"
    end
    expect(graph.connected?).to be true
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

    spanning_tree = SpanningTree.build_minimal_spanning_tree matrix
    #spanning_tree.print
    path_length = SpanningTree.path_length spanning_tree
    puts "path length: #{path_length}"
    expect(path_length > 0)
  end
end