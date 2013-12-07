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

  it 'should return an ordered list of unvisited neighbors' do
    vertex1 = Vertex.new
    vertex2 = Vertex.new
    vertex3 = Vertex.new
    vertex4 = Vertex.new
    vertex3.visit
    vertex1.add_neighbor vertex2, 9
    vertex1.add_neighbor vertex3, 1
    vertex1.add_neighbor vertex4, 5
    ordered_unvisited_neighbors = vertex1.ordered_unvisited_neighbors
    expect(vertex3.visited?).to be true
    expect(ordered_unvisited_neighbors.size).to be 2
    expect(ordered_unvisited_neighbors[0]).to be vertex4
    expect(ordered_unvisited_neighbors[1]).to be vertex2
  end

  it 'should return an edge between a specific neighbor' do
    vertex1 = Vertex.new
    vertex2 = Vertex.new
    vertex3 = Vertex.new
    vertex4 = Vertex.new

    vertex1.add_neighbor vertex2, 9
    vertex1.add_neighbor vertex3, 1
    vertex1.add_neighbor vertex4, 5

    edge = vertex1.edge_to_neighbor vertex2
    expect(edge.weight).to be 9
  end

end
