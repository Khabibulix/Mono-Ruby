require_relative '../lib/node'

describe do
    before(:all) do
        @node = Node.new([4,4])
        @node_border = Node.new([0,0])
    end

    specify "Node default value should be a dot" do
        expect(@node.value).to eq "."
    end

    specify "Should return an array of neighbors for the center node" do
        result = [[3,3], [3,5], [5,3], [5,5]]
        expect(@node.neighbors).to eq result
    end

    specify "Should return an array of neighbors excluding falsy one" do
        expect(@node_border.neighbors).to eq [[1,1]]
    end
end