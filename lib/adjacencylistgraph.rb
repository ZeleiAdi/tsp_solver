require_relative 'vertex'
require_relative 'matrix'

class AdjacencyListGraph

  attr_accessor :vertices
  attr_accessor :dfs_path

  def initialize
    @vertices = []
    @dfs_path = []
  end

  def << (vertex)
    @vertices << vertex
  end

  def edges
    set_of_edges = SortedSet.new
    @vertices.each do |vertex|
      edges = vertex.edges
      edges.each do |edge|
        set_of_edges << edge
      end
    end
    set_of_edges
  end

  def random_vertex
    @vertices[rand(0...@vertices.size)]
  end

  def add_vertex(vertex)
    @vertices << vertex
  end

  def breadth_first_search(vertex)
    vertex.visit
    vertex.neighbors.each do |neighbor|
      unless neighbor.visited?
        neighbor.visit
        breadth_first_search neighbor
      end
    end
  end

  def depth_first_search(vertex)
    vertex.visit
    @dfs_path << vertex
    neighbors = vertex.neighbors
    if neighbors.nil?
      return
    end
    neighbors.each do |neighbor|
      unless neighbor.visited?
        depth_first_search neighbor
        @dfs_path << vertex
      end
    end
  end

  def detect_cycle(vertex)
    @path =[] if @path.nil?

    if vertex.visited?
      return :cycle
    end

    vertex.visit
    puts vertex.id
    children = vertex.neighbors
    children.delete @path.last
    @path << vertex
    children.each do |vertex|
      result = detect_cycle(vertex)
      if result == :cycle
        return :cycle
      end
    end
    @path.pop
  end

  def all_vertices_visited_except(start)
    @vertices.each do |vertex|
      if (vertex != start) && (vertex.visited? == false)
        return false
      end
    end
    true
  end

  def all_vertices_visited?
    @vertices.each do |vertex|
      unless vertex.visited?
        return false
      end
    end
    true
  end

  def connected?
    breadth_first_search(@vertices[0])
    @vertices.each do |vertex|
      unless vertex.visited?
        clear_visit
        return false
      end
    end
    clear_visit
    true
  end

  def has_vertex_with_odd_degree
    @vertices.any? {|vertex| vertex.degree.odd?}
  end
  
  def clear_visit
    @vertices.each do |vertex|
      vertex.unvisit
    end
  end

  def clear_flags
    @vertices.each do |vertex|
      vertex.clear_flags
    end
  end

  def print
    @vertices.each do |vertex|
      vertex.print
      puts 'has edges:'
      vertex.edges.each do |edge|
        edge.print
      end
    end
  end
end