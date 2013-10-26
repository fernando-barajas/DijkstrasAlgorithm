require_relative 'node'

class Grapho
  attr_accessor :nodes

  def initialize start, stop
    @nodes = []
    @start = start
    @stop = stop
  end

  def start_calculation
    @neighbor = @nodes.each{ |n| n if n.name == @start }.first
    @neighbor.distance = 0
    @neighbor.visited = true
    @neighbors = {}
    while true
      @nodes.each do |node|
        node.get_conexion do |nx|
          if @neighbor.name == nx[:node]
            if (@neighbor.distance + nx[:node_dist]) < node.distance
              node.distance = (@neighbor.distance + nx[:node_dist])
              node.visited
              @neighbors[node.distance] = node
            end
          end
        end unless node.name == @start || node.visited
        @neighbor = @neighbors.sort { |v| v }
      end
    end
  end

  grafo = Grapho.new 1, 5
  grafo.nodes << Node.new(1, 0)
  grafo.nodes << Node.new(2, [{ node: 1, node_dist: 7}])
  grafo.nodes << Node.new(3, [{ node: 1, node_dist: 9 }, { node: 2, distance: 10 }])
  grafo.nodes << Node.new(4, [{ node: 2, node_dist: 15 }, { node: 3, distance: 11 }])
  grafo.nodes << Node.new(5, [{ node: 4, node_dist: 6}])
  grafo.nodes << Node.new(6, [{ node: 1, node_dist: 14}, { node: 3, distance: 2 }])
  grafo.start_calculation
end
