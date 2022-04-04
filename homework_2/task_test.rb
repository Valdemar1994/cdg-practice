require "rspec"
require "./task"

#First method testing

RSpec.describe "Task1" do
    it "returns greeting message if user yonger than 18" do
        expect(greeting("Vadim", "Stepanov", 17)).to eq("Vadim Stepanov you are under 18 
but it is not never too early start learning programming!".gsub("\n",""))
    end

    it "returns message if user older 18 years" do
        expect(greeting("Stepan", "Vadimov", 54)).to eq("Stepan Vadimov let's work together!")
    end
end

#Second method testing

RSpec.describe "Task2" do
    it "returns second number if first number equil 20" do
        expect(foobar(20, 11)).to eq("second number = 11")
    end

    it "returns first number if second number equil 20" do
        expect(foobar(-30, 20)).to eq("first number = -30")
    end

    it "returns the sum of two numbers if first number and second number not equil 20" do
        expect(foobar(5, 31)).to eq("summ = 36")
    end
end
