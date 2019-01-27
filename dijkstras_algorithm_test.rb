require "minitest/autorun"
require "./dijkstras_algorithm"

class DijkstrasAlgorithmTest < Minitest::Test
  def test_shortest_path
    graph = { start: { a: 6, b: 2 },
               a: { fin: 1 },
               b: { a: 3, fin: 5 },
               fin: {} }
    costs = { a: 6, b: 2, fin: Float::INFINITY }
    parents = { a: :start, b: :start, fin: nil }

    sorthest_path = DijkstrasAlgorithm.new(graph, costs, parents)

    assert sorthest_path.perform == { a: :b, b: :start, fin: :a }
  end
end