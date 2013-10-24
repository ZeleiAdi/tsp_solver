require_relative 'vertex'

class Edge
	attr_accessor :weight

	@vertex1
	@vertex2
	
	@travelled

	def initialize vertex1, vertex2, weight
		@vertex1 = vertex1
		@vertex2 = vertex2
		@weight = weight

		@travelled = false
	end
end