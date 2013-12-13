require_relative 'nearest_neighbor'
require_relative 'primitive_nearest_neighbor'
require_relative 'intelligent_nearest_neighbor'
require_relative 'stopwatch'
require_relative 'graphfactory'
require_relative 'matrix'

class HeuristicsGauge
  @@graph
  @@matrix
  @@graph_size
  @@start

  def self.initialize size
    @@graph_size = size
  end

  def self.load_graph
    @@graph, @@matrix = GraphFactory.generate_graph_and_matrix @@graph_size
    @@start = @@graph.random_vertex
    #puts @@graph.connected?
    :success
  end

  def self.path_length path
    sum = 0
    path.each_cons(2) do |pair|
      edge = pair[0].edge_to_neighbor pair[1]
      sum += edge.weight
      edge.print
    end
    sum
  end

  def self.heuristics_performance heuristics_name
    Stopwatch.start
    case
      when heuristics_name == :nearest_neighbor
        path = NearestNeighbor.run @@graph, @@start
        Stopwatch.stop
        unless path.nil?
          sum = path_length path
          stops = path.size
        end
      when heuristics_name == :primitive_nearest_neighbor
        path = PrimitiveNearestNeighbor.run @@graph, @@start
        Stopwatch.stop
        unless path.nil?
          sum = path_length path
          stops = path.size
        end
      when heuristics_name == :intelligent_nearest_neighbor
          path = IntelligentNearestNeighbor.run @@graph, @@start
           Stopwatch.stop
        unless path.nil?
          sum = path_length path
          stops = path.size
          path.each { |vertex| vertex.print}
        end
      when heuristics_name == :spanning_tree
        spanning_matrix = @@graph.build_minimal_spanning_tree @@matrix
        Stopwatch.stop
        unless spanning_matrix.nil?
          spanning_matrix.row_count do |row_index|
            spanning_matrix.column_count do |column_index|
              sum += spanning_matrix[row_index, column_index]
              stops = spanning_matrix.row_count*2
            end
          end
        end
      else
        puts 'No such heuristic'
        Stopwatch.stop
    end
    @@graph.clear_visit
    @@graph.clear_flags
    if path.nil?
      return [Stopwatch.elapsed_time, :path_not_found]
    end
    [Stopwatch.elapsed_time, :path_found, sum, stops]
  end

end