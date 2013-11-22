require 'rspec'
require_relative '../lib/matrix'
require_relative '../lib/vertex'

describe 'Basic Representation' do

  it 'should generate matrix with given row and column numbers' do

    #To change this template use File | Settings | File Templates.
    matrix = Matrix.new(5, 9)
    expect(matrix.row_count).to eq(5)
    expect(matrix.column_count).to eq(9)

    expect(matrix[3, 7]).to eq(0)

    matrix[3, 7] = Vertex.new
    expect(matrix[3, 7]).to be_an_instance_of(Vertex)

  end
end