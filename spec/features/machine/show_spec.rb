require 'rails_helper'

RSpec.describe 'the vending machine show' do
  before(:each) do
    @caleb = Owner.create!(name: "Caleb's Compassionate Snacks")
    @pearl = @caleb.machines.create!(location: "Pearl Street")
    @kale_chips = @pearl.snacks.create!(name: "Kale Chips", price: 5.50)
    @soy_nuts = @pearl.snacks.create!(name: "Soy Nutty", price: 4.75)

    visit machine_path(@caleb)
  end

  it "shows the machine name" do
    expect(page).to have_content("Pearl Street Vending Machine")
  end


  it "displays all snacks associated with the machine and their prices" do
    expect(page).to have_content(@kale_chips.name)
    expect(page).to have_content(@kale_chips.price)
    expect(page).to have_content(@soy_nuts.name)
    expect(page).to have_content(@soy_nuts.price)
  end

  it "displays prices with $ and rounded to 2 places" do
    expect(page).to have_content("$5.50")
    expect(page).to have_content("$4.75")
  end
end
