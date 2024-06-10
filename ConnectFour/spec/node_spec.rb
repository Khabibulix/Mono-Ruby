# frozen_string_literal: true

require_relative '../lib/node'

describe do
  before(:all) do
    @node = Node.new([4, 4])
    @node_border = Node.new([0, 0])
  end

  specify 'Node default value should be a dot' do
    expect(@node.value).to eq '.'
  end
end
