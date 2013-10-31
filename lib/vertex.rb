require_relative 'edge'

class Flag
  @truth_value

  def initialize (truth_value = false)
    @truth_value = truth_value
  end

  def switch
    @value = !@value
  end

  def turn_on
    @value = true
  end

  def turn_off
    @value = false
  end
end


class Vertex
  @edges
  @visited

  attr_accessor :flags

  def initialize
    @edges = []
    @visited = false
    @flags = [Flag.new, Flag.new]
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
    return false
  end

  def add_edge (edge)
    @edges << edge
  end

  def visited?
    @visited
  end


  def shortest_edge
    min_weight = 0
    min_edge
    @edges.each do |edge|
      if edge.weight < min_weight
        min_edge = edge
        min_weight = edge.weight
      end
    end
  end

  def bind vertex, edge_weight
    edge = Edge.new self, vertex, edge_weight
    self.add_edge edge
    vertex.add_edge edge
  end

  def print
    edges.each do |edge|
      edge.print
    end
  end

end

