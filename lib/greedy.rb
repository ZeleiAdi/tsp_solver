class Greedy
  def self.run graph, start
    @@graph = graph
    @@start = start

    @@edges

    edges = @@graph.edges
    shortest_edge = edges.shift

    @@edges

  end

end