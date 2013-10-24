require_relative 'adjacencylistgraph.rb'

module GraphFactory
	def self.create_graph_with number_of_vertices, graph_type
		case 
		when graph_type == :adjacencylistgraph
			AdjacencyListGraph.new 5, 2
		end

	end
end


puts GraphFactory.create_graph_with(5, :adjacencylistgraph).inspect

=begin
	
	
end
class GraphFactory
	def init number_of_points, graph_type

	end
end
=end