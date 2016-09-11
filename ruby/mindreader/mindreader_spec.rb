require_relative 'mindreader'

describe MindReader do
	let(:game) { MindReader.new("CHEESEbUrGer") }

	it "should make keyword downcase" do
		expect(game.keyword.join).to eq "cheeseburger"
	end
	
	it "guesses letter z" do
		expect(game.guess("z")).to be false
	end

	it "guesses letter e" do
		expect(game.guess("e")).to be true
	end

	it "displays correct blank word" do
		expect(game.display_word.join(" ")).to eq "- - - - - - - - - - - -"
	end

	it "should give us 18 guesses" do
		expect(game.guesses_allowed).to eq 18
	end

end
