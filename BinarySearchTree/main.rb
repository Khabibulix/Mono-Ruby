require_relative 'lib/tree.rb'


t = Tree.new([1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345])
# t.insert_node(25)
# t.delete_node(67)
t.pretty_print
# p t.find(5)
#p t.level_order
t.inorder




