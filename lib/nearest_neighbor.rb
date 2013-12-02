require_relative 'adjacencylistgraph'
require_relative 'vertex'
class NearestNeighbor

  def self.run graph, start
    @@graph = graph
    @@start = start
    @@path = []
    @@path << start

    @@align = 0

    result = travel start
      if (result == :finished)
        return @@path
      end
    puts 'Path not found'
    return nil
  end

  def self.travel vertex
    vertex.visit
    @@align += 1

    @@align.times {print "   "}
    puts vertex.id

    @@path << vertex

    if ((vertex.neighbor? @@start) && (@@graph.all_vertices_visited?))
      puts "finished"
      return :finished
    end
    list = vertex.ordered_unvisited_neighbors
    list.each do |neighbor|
      result = travel neighbor
      if (result == :finished)
        puts "finished"
        return :finished
      end
    end
    vertex.unvisit
    @@align -= 1
    @@path -= [vertex]
  end
end