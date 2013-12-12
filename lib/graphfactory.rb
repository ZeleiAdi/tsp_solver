require_relative 'adjacencylistgraph.rb'
require_relative 'matrix'

module GraphFactory
  def self.create_graph_with(number_of_vertices)
    Matrix.new(number_of_vertices, number_of_vertices)
  end

  def self.create_graph_in_matrix_form(number_of_vertices)
    matrix = Matrix.new(number_of_vertices, number_of_vertices)
    fill_matrix matrix
    matrix
  end

  def self.generate_graph(number_of_vertices)
    matrix = Matrix.new(number_of_vertices, number_of_vertices)
    fill_matrix matrix
    transform_matrix_into_graph matrix
  end

  def self.generate_graph_and_matrix(number_of_vertices)
    matrix = Matrix.new(number_of_vertices, number_of_vertices)
    fill_matrix matrix
    graph = transform_matrix_into_graph matrix
    [graph, matrix]
  end

  def self.fill_matrix (matrix)
    matrix.row_count.times do |row_index|
      row_index.times do |column_index|
        if rand(0...10) < 4
          matrix[column_index, row_index] = matrix[row_index, column_index] = rand(1..50)
        end
      end
    end
  end

  def self.transform_matrix_into_graph (matrix)
    graph = AdjacencyListGraph.new
    vertices = []

    matrix.row_count.times do |index|
      vertex = Vertex.new
      vertex.id = index
      vertices << vertex
    end
    matrix.row_count.times do |row_index|
      matrix.row_count.times do |column_index|
        if matrix[row_index, column_index] != 0
          vertices[row_index].add_edge(Edge.new(vertices[row_index], vertices[column_index], matrix[row_index, column_index]))
        end
      end
    end
    vertices.each do |vertex|
      graph.add_vertex vertex
    end
    graph
  end
end