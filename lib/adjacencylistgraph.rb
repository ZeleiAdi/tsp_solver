require_relative './Graph.rb'
require_relative 'vertex'


class AdjacencyListGraph

	include Graph

	@start_vertex
	@vertices

	def initialize number_of_vertices, average_degree
		@vertices = []
		number_of_vertices.times do
			@vertices << Vertex.new
		end

		@vertices.each do |vertex|

		end
		(number_of_vertices * average_degree).times do |iterator|

			@vertices[iterator].bind rand(0...iterator), rand(1..50)
		end

	end

	def random_vertex
	end

	def nearest_vertex_to vertex
	end

	def nearest_unvisited_vertex_to vertex
	end

	def shortest_edge 
	end

	def shortest_utravelled_edge
	end

	def shortest_edge_of vertex
		vertex.sortest_edge
	end

	def number_of_remaining_unvisited_vertices

	end

	def sort_edges

	end

	#array for one cycle
	def search_for_cycle

	end

	def build_minimal_spanning_tree

	end

	def search_for_triangle

	end
end