require_relative 'lib/tree.rb'


t = Tree.new([1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345])
t.build_tree
t.insert_node(25)
t.pretty_print



