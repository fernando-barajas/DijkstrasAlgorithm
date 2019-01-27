class DijkstrasAlgorithm
  attr_reader :graph, :costs, :parents, :processed

  def initialize(graph, costs, parents)
    @graph = graph
    @costs = costs
    @parents = parents
    @processed = []
  end

  def perform
    node = find_lowest_cost_node(costs)

    while node
      cost = costs[node]
      neighbors = graph[node]

      node = find_lowest_cost_node(node)
      neighbors.keys.each do |neighbor|
        new_cost = cost + neighbors[neighbor]
        if costs[neighbor] > new_cost
          costs[neighbor] = new_cost
          parents[neighbor] = node
        end
      end
      processed << node
      node = find_lowest_cost_node(node)
    end

    parents
  end

  def find_lowest_cost_node(node)
    lowest_cost = Float::INFINITY
    lowest_cost_node = nil
    costs.keys.each do |node|
      cost = costs[node]
      if cost < lowest_cost && !processed.include?(node)
        lowest_cost = cost
        lowest_cost_node = node
      end
    end

    lowest_cost_node
  end
end
