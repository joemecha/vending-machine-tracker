require 'rails_helper'

RSpec.describe 'a snack show page' do
  before :each do
    @caleb = Owner.create!(name: "Caleb's Compassionate Snacks")

    @pearl = @caleb.machines.create!(location: "Pearl Street")
    @yoga_plot = @caleb.machines.create!(location: "Hot Yoga Studio Parking Lot")
    @soro_hill = @caleb.machines.create!(location: "Some Sorority on the Hill")

    @kale_chips = @pearl.snacks.create!(name: "Kale Chips", price: 5.50)
    @soy_nuts = @pearl.snacks.create!(name: "Soy Nutty", price: 4.75)
    @one_grape = @pearl.snacks.create!(name: "A Grape", price: 0.25)

    @kale_chips = @yoga_plot.snacks.create!(name: "Kale Chips", price: 5.50)
    @soy_nuts = @yoga_plot.snacks.create!(name: "Soy Nutty", price: 4.75)

    @soy_nuts = @soro_hill.snacks.create!(name: "Soy Nutty", price: 4.75)
    @one_grape = @soro_hill.snacks.create!(name: "A Grape", price: 1.25)

    visit "/snacks/#{@soy_nuts.id}"
  end

  it "displays the snack and all of it's attributes (name and price)" do
    expect(page).to have_content(@soy_nuts.name)
    expect(page).to have_content(@soy_nuts.price)
  end

  it "lists the locations of vending machines carrying it" do
    within "#locations" do
      expect(page).to have_content(@pearl.name)
      expect(page).to have_content(@yoga_plot.name)
      expect(page).to have_content(@soro_hill.name)
    end
  end

  it "displays the number of different snacks in each vending machine" do
    within "#locations" do
      expect(page).to have_content("kinds of snacks, average price of")
      expect(@pearl.qty_snacks).to eq(3)
      expect(@yoga_plot.qty_snacks).to eq(2)
      expect(@soro_hill.qty_snacks).to eq(2)
    end
  end

  it "shows the average price of snacks in each vending machine that's shown" do
    within "#locations" do
      expect(@pearl.avg_price).to eq("$3.50")
      expect(@yoga_plot.avg_price).to eq("$5.13")
      expect(@soro_hill.avg_price).to eq("$3.00")
    end
  end
end
