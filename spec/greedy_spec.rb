require 'rspec'
require_relative '../lib/sadfs'
require_relative '../lib/graphfactory'

describe 'Greedy' do

  it 'should do something' do
    greedy = Greedy.new
    graph = GraphFactory.create_graph_with 17, :adjacencylistgraph
    greedy.run
  end
end