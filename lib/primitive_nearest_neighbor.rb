require_relative 'adjacencylistgraph'
require_relative 'vertex'

class PrimitiveNearestNeighbor

  def self.run graph, start
    @@graph = graph
    @@start = start
    @@path = []

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
    @@path << vertex

    if @@graph.all_vertices_visited?
      @@path.concat (@@path-[@@path.last]).reverse
      return :finished
    end

    next_stop = vertex.nearest_unvisited_neighbor
    if next_stop.nil?
      vertex.flags[:dead_end] = true
      @@path.reverse.each do |step_back|
        if (vertex != step_back) && (!step_back.flags[:dead_end])
          next_stop = step_back
          break
        end
      end
    end
    result = travel next_stop
    if result == :finished
      return :finished
    elsif result == :dead_end
      return :dead_end
    end
  end
end