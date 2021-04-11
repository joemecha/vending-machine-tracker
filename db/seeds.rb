@caleb = Owner.create!(name: "Caleb's Compassionate Snacks")
@boozy = Owner.create!(name: "Boozy B's Tiny Liquor Shops")

@pearl = @caleb.machines.create!(location: "Pearl Street")
@yoga_plot = @caleb.machines.create!(location: "Hot Yoga Studio Parking Lot")
@soro_hill = @caleb.machines.create!(location: "Some Sorority on the Hill")
@city_hall = @boozy.machines.create!(location: "City Hall")

@kale_chips = Snack.create!(name: "Kale Chips", price: 5.50)
@soy_nuts = Snack.create!(name: "Soy Nutty", price: 4.75)
@one_grape = Snack.create!(name: "A Grape", price: 0.25)

@premium_malts = Snack.create!(name: "The Premium Malts", price: 5.00)
@asahi = Snack.create!(name: "Asahi Super Dry", price: 4.50)
@sapporo = Snack.create!(name: "Sapporo Draft Beer", price: 4.75)
@kirin_beer_like_beverage = Snack.create!(name: "Gross Kirin Happoshu", price: 2.00)

MachineSnack.create(machine_id: 1, snack_id: 1)
MachineSnack.create(machine_id: 1, snack_id: 2)
MachineSnack.create(machine_id: 1, snack_id: 3)

MachineSnack.create(machine_id: 2, snack_id: 1)
MachineSnack.create(machine_id: 2, snack_id: 2)

MachineSnack.create(machine_id: 3, snack_id: 2)
MachineSnack.create(machine_id: 3, snack_id: 3)

MachineSnack.create(machine_id: 4, snack_id: 4)
MachineSnack.create(machine_id: 4, snack_id: 5)
MachineSnack.create(machine_id: 4, snack_id: 6)
MachineSnack.create(machine_id: 4, snack_id: 7)
