require_relative 'nearest_neighbor'
require_relative 'primitive_nearest_neighbor'
require_relative 'intelligent_nearest_neighbor'
require_relative 'spanning_tree'
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
    while !@@graph.connected?
      @@graph, @@matrix = GraphFactory.generate_graph_and_matrix @@graph_size
      @@start = @@graph.random_vertex
    end
    :success
  end

  def self.path_length path
    sum = 0
    path.each_cons(2) do |pair|
      edge = pair[0].edge_to_neighbor pair[1]
      sum += edge.weight
      #edge.print
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
        spanning_matrix =  SpanningTree.build_minimal_spanning_tree @@matrix
        Stopwatch.stop
        unless spanning_matrix.nil?
          sum = SpanningTree.path_length spanning_matrix
          stops = SpanningTree.number_of_stops spanning_matrix
          #path
          spanning_graph = GraphFactory.transform_matrix_into_graph spanning_matrix
          spanning_graph.depth_first_search spanning_graph.random_vertex
          path = spanning_graph.dfs_path
          #dfs_path has to be cleared sometime... potential bug here
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