require_relative '../lib/matrix'
require_relative '../lib/adjacencylistgraph'
require_relative '../lib/graphfactory'
describe 'My behaviour' do

  #it 'should generate mostly connected graphs' do
  #  counter = 0
  #  20.times do
  #    matrix = Matrix.new 10, 10
  #    GraphFactory.fill_matrix matrix
  #    alg = GraphFactory.transform_matrix_into_graph matrix
  #    alg.breadth_first_search alg.random_vertex
  #    if alg.connected?
  #      counter +=1
  #      matrix.print
  #      puts ''
  #    end
  #  end
  #  expect(counter).to be > 4
  #  puts counter
  #end
  #it 'should generate a graph' do
  #  GraphFactory.generate_graph(10).print
  #end

  it 'should generate a specific graph from a specific matrix' do
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

    graph = GraphFactory.transform_matrix_into_graph matrix
    graph.print
  end
end