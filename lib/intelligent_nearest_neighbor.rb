require_relative 'adjacencylistgraph'
require_relative 'vertex'

module IntelligentNearestNeighbor
  def self.run graph, start
    @@distance_table = {}
    @@path = []
    @@graph = graph
    @@start = start

    @@distance_table[start] = 0

    result = travel start
    if result == :finished
      @@graph.vertices.each do |vertex|
        puts "#{vertex.id} ->#{@@distance_table[vertex]}"
      end
      puts "#{start.id} ->#{@@distance_table[start]}"

      @@path.each do |vertex|
        puts vertex.id
      end
      result = go_home @@path.last

      if result == :finished
        @@path.each { |vertex| vertex.print }
        return @@path
      end
    end
    puts 'Path not found'
    return nil
  end

  def self.travel vertex
    vertex.visit
    @@path << vertex

    if(@@distance_table[vertex].nil?)
      min = Float::INFINITY
      neighbors = vertex.neighbors
      neighbors.each do |neighbor|
        edge = vertex.edge_to_neighbor neighbor
        if (@@distance_table[neighbor] &&  edge.weight < min)
          min = @@distance_table[neighbor] + edge.weight
        end
      end
      @@distance_table[vertex] = min
    end

    if @@graph.all_vertices_visited?
      return :finished
    end

    next_stop = vertex.nearest_unvisited_neighbor
    if next_stop.nil?
      vertex.flags[:dead_end] = true
      @@path.reverse.each do |step_back|
        if (vertex != step_back) && (!step_back.flags[:dead_end])
          next_stop = step_back
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

  def self.go_home vertex
    if (vertex == @@start)
      return :finished
    end

    min = Float::INFINITY
    min_neighbor = nil
    neighbors = vertex.neighbors
    neighbors.each do |neighbor|
      edge = vertex.edge_to_neighbor neighbor
      if (@@distance_table[neighbor] + edge.weight < min)
        puts vertex.id
        min = @@distance_table[neighbor] + edge.weight
        min_neighbor = neighbor
      end
    end

    @@path << min_neighbor
    result = go_home min_neighbor
    if result == :finished
      return :finished
    end
  end
end