require_relative 'adjacencylistgraph.rb'
require_relative 'matrix'

puts "hello"

module GraphFactory
  def self.create_graph_with(number_of_vertices, graph_type)
    matrix = Matrix.new(number_of_vertices, number_of_vertices)
    #
    #case
    #  when graph_type == :adjacencylistgraph
    #    AdjacencyListGraph.new 5, 2
    #end

  end

  def self.fill_matrix (matrix)
    matrix.row_count.times do |row_index|
      row_index.times do |column_index|
        if (rand(0..1) == 1)
          matrix[column_index, row_index] = matrix[row_index, column_index] = rand(1..50)
        end
      end
    end
  end

  def self.transform_matrix_into_graph (matrix)
    graph = AdjacencyListGraph.new (matrix.row_count)
    vertices = []

    matrix.row_count.times { vertices << Vertex.new }
    matrix.row_count.times do |row_index|
      vertex = Vertex.new
      matrix.row_count.times do |column_index|
        if (matrix[row_index, column_index] != 0)
          vertices[row_index].add_edge(Edge.new(vertices[row_index], vertices[column_index], matrix[row_index, column_index]))
        end
      end
    end
    vertices
  end
end

matrix = Matrix.new(5, 5)
GraphFactory::fill_matrix(matrix)
matrix.print
vertices = GraphFactory::transform_matrix_into_graph(matrix)
vertices.each do |vertex|
  vertex.print
end
