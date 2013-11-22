require_relative './Graph.rb'
require_relative 'vertex'


class AdjacencyListGraph

  include Graph

  @start_vertex
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

  def nearest_vertex_to vertex
  end

  def nearest_unvisited_vertex_to vertex
  end

  def shortest_edge
  end

  def shortest_untravelled_edge
  end

  def add_vertex vertex
    @vertices << vertex
  end

  def shortest_edge_of vertex
    vertex.sortest_edge
  end

  def number_of_remaining_unvisited_vertices

  end

  def sort_edges

  end

  #array for one cycle
  def search_for_cycle

  end

  def build_minimal_spanning_tree

  end

  def search_for_triangle

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