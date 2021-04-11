require 'rails_helper'

RSpec.describe Snack, type: :model do
  before(:each) do
    @caleb = Owner.create!(name: "Caleb's Compassionate Snacks")
    @pearl = @caleb.machines.create!(location: "Pearl Street")
    @kale_chips = @pearl.snacks.create!(name: "Kale Chips", price: 5.50)
    @soy_nuts = @pearl.snacks.create!(name: "Soy Nutty", price: 4.75)
    @one_grape = @pearl.snacks.create!(name: "A Grape", price: 0.25)
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should have_many :machine_snacks }
    it { should have_many(:machines).through :machine_snacks }
  end

  describe 'instance methods' do
    describe ".formatted_price" do
      it "displays price as $0.00" do
        expect(@kale_chips.formatted_price).to eq("$5.50")
        expect(@soy_nuts.formatted_price).to eq("$4.75")
        expect(@one_grape.formatted_price).to eq("$0.25")
      end
    end
  end
end
