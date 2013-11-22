require 'rspec'
require_relative '../lib/matrix'
require_relative '../lib/adjacencylistgraph'
require_relative '../lib/graphfactory'
describe 'My behaviour' do

  it 'should generate mostly connected graphs' do

    counter = 0
    20.times do
      matrix = Matrix.new 10, 10
      GraphFactory.fill_matrix matrix
      alg = GraphFactory.transform_matrix_into_graph matrix
      alg.breadth_first_search alg.random_vertex
      if alg.connected?
        counter +=1
        matrix.print
        puts ''
      end
    end
    expect(counter).to be > 4
    puts counter
  end
end