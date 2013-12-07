require_relative 'edge'

class Vertex
  attr_accessor :flags
  @edges
  @visited
  @@id_incr = 1
  attr_accessor :id

  def initialize
    @id = @@id_incr
    @@id_incr += 1
    @edges = []
    @visited = false
    @flags = {}
  end

  def clear_flags
    @flags.clear
  end

  def neighbors
    @edges.map do |edge|
      edge.get_pair(self)
    end
  end

  def edges
    @edges
  end

  def nearest_unvisited_neighbor
    unvisited_edges = @edges.select {|edge| !edge.get_pair(self).visited?}
    shortest_unvisited_edge = unvisited_edges.min_by{|edge| edge.weight}
    unless shortest_unvisited_edge.nil?
      shortest_unvisited_edge.get_pair(self)
    end
  end

  def ordered_unvisited_neighbors
      sorted_edges = @edges.sort_by do |edge|
        edge.weight
    end
    sorted_unvisited_vertices = []
    sorted_edges.each do |edge|
      pair = edge.get_pair(self)
      unless pair.visited?
        sorted_unvisited_vertices << pair
      end
    end
    sorted_unvisited_vertices
  end

  def degree
    @edges.size
  end

  def add_neighbor (vertex, weight)
    edge = Edge.new self, vertex, weight
    @edges << edge
    vertex.add_edge edge
  end

  def neighbor? (vertex)
    @edges.each do |edge|
      if edge.get_pair(self) == vertex
        return true
      end
    end
    false
  end

  def add_edge (edge)
    @edges << edge
  end

  def edge_to_neighbor vertex
    edge = @edges.find {|edge| edge.get_pair self == vertex}
  end

  def visit
    @visited = true
  end

  def unvisit
    @visited = false
  end

  def visited?
    @visited
  end

  def bind(vertex, edge_weight)
    edge = Edge.new self, vertex, edge_weight
    self.add_edge edge
    vertex.add_edge edge
  end

  def print
    puts @id
  end
end

