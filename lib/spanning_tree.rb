require_relative 'adjacencylistgraph'
require_relative 'matrix'

module SpanningTree
  @@graph
  #notes
  #nearest neighbor of a city will only be infinity if it has been added to the spanning tree
  #it is not fortunate, but when c[i,j] has a value of 0, it means there is no edge between i and j
  #   therefore zero value has to be checked for
  #might return with nil

  def self.run matrix
    build_minimal_spanning_tree matrix
  end

  def self.path_length spanning_matrix
    sum = 0
    spanning_matrix.row_count.times do |row_index|
      spanning_matrix.column_count.times do |column_index|
        sum += spanning_matrix[row_index, column_index]
      end
    end
    sum
  end

  def self.number_of_stops spanning_matrix
    spanning_matrix.row_count*2
  end

  def self.build_minimal_spanning_tree(matrix)
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