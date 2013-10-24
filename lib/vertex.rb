require_relative 'edge'

class Vertex
	@edges
	@visited

	def initialize
		@edges = []
	end

	def degree
		@edges.size
	end

	def add vertex

	end

	def shortest_edge
		min_weight = 0
		min_edge
		@edges.each do |edge|
			if edge.weight < min_weight
				min_edge = edge
				min_weight = edge.weight
			end
		end
	end


	def add_edge edge
		@edges << edge;
	end

	def bind vertex, edge_weight
		edge = Edge.new self, vertex, edge_weight
		self.add_edge edge
		vertex.add_edge edge
	end

end

