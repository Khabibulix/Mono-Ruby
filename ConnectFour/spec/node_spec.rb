require_relative '../lib/node'

describe do
    before(:all) {@node = Node.new}

    specify "Node default value should be a dot" do
        expect(@node.value).to eq "."
    end
end