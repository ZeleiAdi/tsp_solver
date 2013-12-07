require_relative 'vertex'

class Edge
  attr_accessor :weight

  @vertex1
  @vertex2

  @vertices

  @travelled

  def initialize (vertex1, vertex2, weight)
    @vertex1 = vertex1
    @vertex2 = vertex2
    @weight = weight

    @vertices = [vertex1, vertex2]

    @travelled = false
  end

  def get_pair (vertex)
    (@vertices - [vertex])[0]
  end

  def <=> (other)
    @weight <=> other.weight
  end

  def print
    puts "#{@vertex1.id} #{@vertex2.id} #{@weight}"
  end

end