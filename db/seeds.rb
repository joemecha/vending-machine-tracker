@caleb = Owner.create!(name: "Caleb's Compassionate Snacks")
@pearl = @caleb.machines.create!(location: "Pearl Street")
@kale_chips = @pearl.snacks.create!(name: "Kale Chips", price: 5.50)
@soy_nuts = @pearl.snacks.create!(name: "Soy Nutty", price: 4.75)
