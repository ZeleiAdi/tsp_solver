require_relative 'adjacencylistgraph'
require_relative 'vertex'

class Greedy
  def self.run graph, start
    @@graph = graph
    @@start = start

    @@edges = []
    @@alg = AdjacencyListGraph.new

    edges = @@graph.edges.sort_by {|edge| edge.weight}
    shortest_edge = edges.shift
    vertex1 = Vertex.new
    vertex2 = Vertex.new
    vertex1.id = shortest_edge.vertex1_id
    vertex2.id = shortest_edge.vertex2_id


    @@edges

  end

end