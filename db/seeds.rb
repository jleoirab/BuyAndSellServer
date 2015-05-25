# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Fantasy environment for testing. Don't laugh at my lack of creativity. LOL!
states = [{
		name: 'Abuja'
	}, {
		name: 'Lagos'
	}
]


towns_a = [{
		name: 'Gwari'
	}, {
		name: 'Gwarimpa'
	}, {
		name: 'DownTown'
	}, {
		name: 'Center City'
	},{
		name: 'Damala'
	}
]

towns_b = [{
		name: 'Ikeja'
	}, {
		name: 'Victoria Island'
	}, {
		name: 'Ikoyi'
	}, {
		name: 'Ojuelgba'
	},{
		name: 'Nameless'
	}
]


nation = Nation.create(name: 'Nigeria')
nation.states.create(states)
nation.states.first.towns.create(towns_a)
nation.states.second.towns.create(towns_b)

