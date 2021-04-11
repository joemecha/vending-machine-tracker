require 'rails_helper'

RSpec.describe Machine, type: :model do
  before(:each) do
    @caleb = Owner.create!(name: "Caleb's Compassionate Snacks")
    @pearl = @caleb.machines.create!(location: "Pearl Street")
    @kale_chips = @pearl.snacks.create!(name: "Kale Chips", price: 5.50)
    @soy_nuts = @pearl.snacks.create!(name: "Soy Nutty", price: 4.75)
    @one_grape = @pearl.snacks.create!(name: "A Grape", price: 0.25)
  end

  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'instance methods' do
    describe ".avg_price" do
      it "displays average price of all snacks in the machine" do
        expect(@pearl.avg_snack_price).to eq("$3.50")
      end
    end
  end
end
