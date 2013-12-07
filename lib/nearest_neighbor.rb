require_relative 'adjacencylistgraph'
require_relative 'vertex'
class NearestNeighbor
  @@debug = false

  def self.run graph, start
    @@graph = graph
    @@start = start
    @@path = []
    @@align = 0

    result = travel start
      if result == :finished
        @@path.each do |vertex|
          vertex.print
        end
        return @@path
      end
    puts 'Path not found'
    return nil
  end

  def self.travel vertex
    vertex.visit
    if @@debug
      @@align += 1

      @@align.times {print '   '}
      puts vertex.id
    end

    @@path << vertex

    if (vertex.neighbor? @@start) && (@@graph.all_vertices_visited?)
      @@path << @@start
      puts 'finished'
      return :finished
    end
    list = vertex.ordered_unvisited_neighbors
    list.each do |neighbor|
      result = travel neighbor
      if result == :finished
        puts 'finished'
        return :finished
      end
    end
    vertex.unvisit
    if @@debug
      @@align -= 1
    end
    @@path -= [vertex]
  end
end