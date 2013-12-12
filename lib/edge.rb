require_relative 'vertex'

class Edge
  attr_accessor :weight
  attr_accessor :vertex1_id
  attr_accessor :vertex2_id

  @vertex1
  @vertex2

  @vertices

  @travelled

  def initialize (vertex1, vertex2, weight)
    @vertex1 = vertex1
    @vertex2 = vertex2
    @weight = weight

    @vertex1_id = @vertex1.id
    @vertex2_id = @vertex2.id

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