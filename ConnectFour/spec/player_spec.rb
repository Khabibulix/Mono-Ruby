require_relative '../lib/player'

describe "A Player should have a known symbol" do
    it do
        player = Player.new
        symbol_known = player.symbols.include?(player.symbol)
        expect(symbol_known)
    end
end