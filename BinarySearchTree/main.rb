require_relative 'lib/tree.rb'


t = Tree.new((Array.new(15) { rand(1..100) }))
p t.balanced?

puts "Level order"
p t.level_order

puts "Pre order"
p t.preorder

puts "Post order"
p t.postorder

puts "In order"
p t.inorder

t.insert_node(45)
t.insert_node(48)
t.insert_node(49)

p t.balanced?

t.rebalance

p t.balanced?

puts "Level order"
p t.level_order

puts "Pre order"
p t.preorder

puts "Post order"
p t.postorder

puts "In order"
p t.inorder

