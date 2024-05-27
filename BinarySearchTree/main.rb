require_relative 'lib/node.rb'
require_relative 'lib/tree.rb'


t = Tree.new([1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345])
p t.build_tree

