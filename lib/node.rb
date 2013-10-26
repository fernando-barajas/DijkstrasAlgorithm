class Node
  attr_accessor :name, :conexion, :visited, :distance

  def initialize name, conexion, distance = Float::INFINITY , visited = false
    @name = name
    @conexion = conexion
    @visited = visited
    @distance = distance
  end

  def get_conexion
    self.conexion.each do |n|
    yield(n)
  end
  end
end
