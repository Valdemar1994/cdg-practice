require "rspec"
require "./task3"

# Word task testing

RSpec.describe "Word check" do
    it "returns 2 to the power of the entered word" do
        expect(words("VIDEOCD")).to eq("2 to the power of the length of entered word word = 128")
    end

    it "returns reversed word" do
        expect(words("management")).to eq("Reversed word = tnemeganam")
    end

end

# Pokemon task testing

RSpec.describe "Creating pokemon" do

    count = 3
    pokemon = [
    {name: "Bulbasaur", color: "Green"},
    {name: "Charmander", color: "Red"},
    {name: "Arctovish", color: "Blue"}
    ]
        
    it "if we create 2 pokemons" do
    allow_any_instance_of(Object).to receive(:gets).and_return("Bulbasaur", "Green",
         "Charmander", "Red", "Arctovish", "Blue")
    expect(pokemon(count)).to eq(pokemon)
    end
    
end