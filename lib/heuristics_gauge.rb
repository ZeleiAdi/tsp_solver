require_relative 'nearest_neighbor'
require_relative 'primitive_nearest_neighbor'
require_relative 'stopwatch'
require_relative 'graphfactory'

class HeuristicsGauge
  @@graph
  @@graph_size
  @@start

  def self.initialize size
    @@graph_size = size
  end

  def self.load_graph
    @@graph = GraphFactory.generate_graph @@graph_size
    @@start = @@graph.random_vertex
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

  #def self.heuristics_path_length heuristics_name
  #  case
  #    when heuristics_name == :nearest_neighbor
  #      path = NearestNeighbor.run @@graph, @@start
  #      unless path.nil?
  #        sum = path_length path
  #        stops = path.size
  #      end
  #    when heuristics_name == :primitive_nearest_neighbor
  #      path = PrimitiveNearestNeighbor.run @@graph, @@start
  #      unless path.nil?
  #        sum = path_length path
  #        stops = path.size
  #      end
  #    else
  #      puts 'No such heuristic'
  #  end
  #  @@graph.clear_visit
  #  @@graph.clear_flags
  #  [sum, stops]
  #end

  #def self.heuristics_runtime heuristics_name
  #  Stopwatch.start
  #  path = nil
  #  case
  #    when heuristics_name == :nearest_neighbor
  #      path = NearestNeighbor.run @@graph, @@start
  #    when heuristics_name == :primitive_nearest_neighbor
  #      path = PrimitiveNearestNeighbor.run @@graph, @@start
  #    else
  #      puts 'No such heuristic'
  #  end
  #  Stopwatch.stop
  #  @@graph.clear_visit
  #  @@graph.clear_flags
  #  if path.nil?
  #    return [Stopwatch.elapsed_time, :path_not_found]
  #  end
  #  [Stopwatch.elapsed_time, :path_found]
  #end
end