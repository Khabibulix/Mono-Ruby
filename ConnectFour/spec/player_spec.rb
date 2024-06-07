require_relative '../lib/player'

describe do

    before(:all) do 
        @player = Player.new
    end

    specify "A Player should have a known symbol"  do        
        symbol_known = @player.symbols.include?(@player.symbol)
        expect(symbol_known)
    end

    specify "The player and the ennemy shouldn't have the same symbol" do
        expect(@player.symbol).not_to eq @player.adversary_symbol
    end
    
end