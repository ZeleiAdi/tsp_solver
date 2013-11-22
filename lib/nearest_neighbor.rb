require_relative 'adjacencylistgraph'
require_relative 'vertex'
class NearestNeighbor
  def self.run start
    vertices = []
    vertices << start
    start.visited
    #lehet, hogy nil-lel tér vissza
    next_vertex = start.nearest_unvisited_neighbor
    unless (next_vertex == nil)
      vertices << next_vertex
      next_vertex.visited
    #else
      #...
    end

  end
  def self.travel vertex
    vertex.visited


    unless  next_city =  vertex.nearest_unvisited_neighbor
           vertex.unvisit
    end


  end
end