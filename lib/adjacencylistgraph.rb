require_relative './Graph.rb'
require_relative 'vertex'


class AdjacencyListGraph

  @vertices

  def initialize
    @vertices = []
  end

  def << (vertex)
    @vertices << vertex
  end

  def random_vertex
    @vertices[rand(0...@vertices.size)]
  end

  def add_vertex vertex
    @vertices << vertex
  end

  def shortest_edge_of vertex
    vertex.sortest_edge
  end

  def breadth_first_search(vertex)
    vertex.visit
    vertex.neighbors.each do |vertex|
      unless vertex.visited?
        vertex.visit
        breadth_first_search vertex
      end
    end
  end

  def all_vertices_visited_except start
    @vertices.each do |vertex|
      if ((vertex != start) && (vertex.visited? == false))
          return false
        end
      end
    return true
  end

  def all_vertices_visited?
    @vertices.each do |vertex|
      unless vertex.visited?
        return false
      end
    end
    return true
  end

  def connected?
    breadth_first_search(@vertices[0])
    @vertices.each do |vertex|
      unless vertex.visited?
        return false
      end
    end
    return true
  end

  def clear_visit
    @vertices.each do |vertex|
      vertex.unvisit
    end
  end

  def print
    @vertices.each do |vertex|
      vertex.print
    end
  end
end