require_relative 'vertex'
require_relative 'matrix'

class AdjacencyListGraph

  attr_accessor :vertices

  def initialize
    @vertices = []
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
        return false
      end
    end
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
    end
  end

  #notes
  #nearest neighbor of a city will only be infinity if it has been added to the spanning tree
  #it is not fortunate, but when c[i,j] has a value of 0, it means there is no edge between i and j
  #   therefore zero value has to be checked for
  #might return with nil
  def build_minimal_spanning_tree(matrix)
    infinity = 1000

    spanning_tree = Matrix.new matrix.row_count, matrix.column_count

    vertex_count = matrix.row_count
    nearest_vertex = []
    min_weight = []

    vertex_count.times {
      nearest_vertex << infinity
      min_weight << infinity
    }
    #initialize
    vertex_count.times do |index|
      #tree starts from vertex0
      if index == 0
        nearest_vertex[index] = infinity
        min_weight[index] = infinity
      else
        nearest_vertex[index] = 0
        if matrix[index, 0] > 0
          min_weight[index] = matrix[index, 0]
        else
          min_weight[index] = infinity
        end
      end
    end

    spanning_tree_vertices_count = 1
    while spanning_tree_vertices_count != vertex_count do
      #search for minimum in min_weight
      min_value = infinity
      min_index = -1
      vertex_count.times do |index|
        if min_weight[index] < min_value
          min_value = min_weight[index]
          min_index = index
        end
      end
      k = min_index
      #puts 'edge value = ' + min_value.to_s
      #puts 'k = ' + k.to_s

      #insert edge and vertex
      spanning_tree_vertices_count += 1
      spanning_tree[nearest_vertex[k], k] = min_weight[k]
      spanning_tree[k, nearest_vertex[k]] = min_weight[k]

      nearest_vertex[k] = infinity
      min_weight[k] = infinity
      #update arrays
      vertex_count.times do |index|
        if (nearest_vertex[index] != infinity) && (matrix[k, index] < min_weight[index]) && (matrix[k, index] > 0)
          nearest_vertex[index] = k
          min_weight[index] = matrix[k, index]
        end
      end
    end
    edge_count = 0
    spanning_tree.row_count.times do |row_index|
      row_index.times do |column_index|
        if spanning_tree[row_index, column_index] > 0
          edge_count += 1
        end
      end
    end
    if edge_count == vertex_count-1
      spanning_tree
    else
      puts 'no minimal spanning tree found'
    end
  end
end