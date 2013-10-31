require_relative '../lib/vertex'

describe Vertex do
  it '' do
    vertex = Vertex.new
    expect(vertex.visited?).to be false
  end

  it '' do
    vertex1 = Vertex.new
    vertex2 = Vertex.new
    vertex1.add_neighbor vertex2, 5
    expect(vertex1.neighbor? vertex2).to be true
    expect(vertex2.neighbor? vertex1).to be true
  end

end