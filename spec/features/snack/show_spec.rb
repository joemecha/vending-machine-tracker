require 'rails_helper'

RSpec.describe 'a snack show page' do
  before :each do
    @caleb = Owner.create!(name: "Caleb's Compassionate Snacks")

    @pearl = @caleb.machines.create!(location: "Pearl Street")
    @yoga_plot = @caleb.machines.create!(location: "Hot Yoga Studio Parking Lot")
    @soro_hill = @caleb.machines.create!(location: "Some Sorority on the Hill")

    @kale_chips = Snack.create!(name: "Kale Chips", price: 5.50)
    @soy_nuts = Snack.create!(name: "Soy Nutty", price: 4.75)
    @one_grape = Snack.create!(name: "A Grape", price: 0.25)

    MachineSnack.create(machine_id: 1, snack_id: 1)
    MachineSnack.create(machine_id: 1, snack_id: 2)
    MachineSnack.create(machine_id: 1, snack_id: 3)

    MachineSnack.create(machine_id: 2, snack_id: 1)
    MachineSnack.create(machine_id: 2, snack_id: 2)

    MachineSnack.create(machine_id: 3, snack_id: 2)
    MachineSnack.create(machine_id: 3, snack_id: 3)

    visit "/snacks/#{@soy_nuts.id}"
  end

  it "displays the snack and all of it's attributes (name and price)" do
    expect(page).to have_content(@soy_nuts.name)
    expect(page).to have_content(@soy_nuts.price)
  end

  it "lists the locations of vending machines carrying it" do
    within "#locations" do
      expect(page).to have_content(@pearl.location)
      expect(page).to have_content(@yoga_plot.location)
      expect(page).to have_content(@soro_hill.location)
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
      expect(@pearl.avg_snack_price).to eq("$3.50")
      expect(@yoga_plot.avg_snack_price).to eq("$5.12")
      expect(@soro_hill.avg_snack_price).to eq("$2.50")
    end
  end
end
